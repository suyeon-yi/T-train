DROP TABLE train CASCADE CONSTRAINTS;
drop SEQUENCE train_seq;

-- 기차 시간표
create table train(
no number PRIMARY KEY,
traingradename VARCHAR2(10),
depplacename VARCHAR2(30) not NULL,
arrplacename  VARCHAR2(30) not NULL,
adultcharge NUMBER not NULL,
depplandtime VARCHAR2(20),
arrplandtime VARCHAR2(20)
);
CREATE SEQUENCE train_seq;

--샘플 데이터
insert INTO train(no,traingradename,depplacename, arrplacename, adultcharge, depplandtime,arrplandtime)
VALUES (train_seq.nextval,'KTX','서울','부산','59800 ','05시15분','07시49분');
COMMIT;

drop table notice CASCADE CONSTRAINTS;
drop SEQUENCE notice_seq;

-- 공지사항
create table notice
(
no number PRIMARY KEY,
topNo number ,
title varchar2(300) not null,
content VARCHAR2(2000) not null,
startDate date DEFAULT sysdate,
endDate date DEFAULT '9999-12-30',
writeDate date DEFAULT sysdate,
updateDate date DEFAULT sysdate

);

CREATE SEQUENCE notice_seq;

--샘플 데이터
--현재 공지
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES (notice_seq.nextval, '공지','봄 공지','2022-03-02','2022-05-05');
--지난 공지
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES (notice_seq.nextval, '공지','겨울 공지','2021-12-01','2022-02-05');
--예약 공지
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES (notice_seq.nextval, '공지','여름 공지','2022-07-02','2022-08-29');
COMMIT;

DROP TABLE qna CASCADE CONSTRAINTS;
DROP SEQUENCE qna_seq;

-- 고객 소리함
CREATE TABLE qna(
    no NUMBER PRIMARY KEY,
    title VARCHAR2(300) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    id VARCHAR2(20) NOT NULL REFERENCES member(id),
    writeDate date DEFAULT sysdate,
    refNo NUMBER REFERENCES qna(no),
    ordNo NUMBER,
    levNo NUMBER,
    parentNo NUMBER REFERENCES qna(no) ON DELETE CASCADE
);

CREATE SEQUENCE qna_seq;

-- 샘플 데이터
--질문하기
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo)
VALUES(qna_seq.nextval, '사이트 이용', '기차 시간표 api', 'test',qna_seq.nextval, 1, 0);
--답변하기
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, '사이트 이용', '현재 준비 중입니다.', 'admin', 61, 2, 1, 61);
COMMIT;

DROP TABLE grade CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

-- 회원 등급
create table grade
(
    gradeNo number(2) primary key,
    gradeName varchar2(20) not null
);

--샘플데이터
INSERT INTO grade VALUES(1, '일반회원');
INSERT INTO grade VALUES(9, '관리자');
commit;

-- 회원 관리
create table member
(
  id varchar2(20) primary key,
  pw varchar2(20) not null,
  name varchar2(30) not null,
  gender varchar2(6) not null check(gender in('남자','여자')),
  birth date not null,
  tel varchar2(13) not null,
  email varchar2(50) not null,
  regDate date default sysdate,
  conDate date default sysdate,
  status VARCHAR2(6) DEFAULT '정상' CHECK(status in('정상','강퇴','탈퇴','휴면')),
  gradeNo number(2) default 1 REFERENCES grade(gradeNo)
);

-- 샘플데이터
INSERT INTO member(id, pw, name, gender, birth, tel, email, gradeNo)
VALUES('admin', '1111', '관리자', '여자', '1994-09-12', '010-1111-2222', 'suyun9999@naver.com', 9);
commit;

INSERT INTO member(id, pw, name, gender, birth, tel, email )
VALUES('test', '1111', '시민', '남자', '1999-01-01', '010-3333-4444', 'test@naver.com');
COMMIT;