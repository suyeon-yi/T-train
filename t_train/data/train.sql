DROP TABLE train CASCADE CONSTRAINTS;
drop SEQUENCE train_seq;

-- ���� �ð�ǥ
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

--���� ������
insert INTO train(no,traingradename,depplacename, arrplacename, adultcharge, depplandtime,arrplandtime)
VALUES (train_seq.nextval,'KTX','����','�λ�','59800 ','05��15��','07��49��');
COMMIT;

drop table notice CASCADE CONSTRAINTS;
drop SEQUENCE notice_seq;

-- ��������
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

--���� ������
--���� ����
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES (notice_seq.nextval, '����','�� ����','2022-03-02','2022-05-05');
--���� ����
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES (notice_seq.nextval, '����','�ܿ� ����','2021-12-01','2022-02-05');
--���� ����
INSERT INTO notice(no, title, content, startDate, endDate)
VALUES (notice_seq.nextval, '����','���� ����','2022-07-02','2022-08-29');
COMMIT;

DROP TABLE qna CASCADE CONSTRAINTS;
DROP SEQUENCE qna_seq;

-- �� �Ҹ���
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

-- ���� ������
--�����ϱ�
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo)
VALUES(qna_seq.nextval, '����Ʈ �̿�', '���� �ð�ǥ api', 'test',qna_seq.nextval, 1, 0);
--�亯�ϱ�
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.nextval, '����Ʈ �̿�', '���� �غ� ���Դϴ�.', 'admin', 61, 2, 1, 61);
COMMIT;

DROP TABLE grade CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;

-- ȸ�� ���
create table grade
(
    gradeNo number(2) primary key,
    gradeName varchar2(20) not null
);

--���õ�����
INSERT INTO grade VALUES(1, '�Ϲ�ȸ��');
INSERT INTO grade VALUES(9, '������');
commit;

-- ȸ�� ����
create table member
(
  id varchar2(20) primary key,
  pw varchar2(20) not null,
  name varchar2(30) not null,
  gender varchar2(6) not null check(gender in('����','����')),
  birth date not null,
  tel varchar2(13) not null,
  email varchar2(50) not null,
  regDate date default sysdate,
  conDate date default sysdate,
  status VARCHAR2(6) DEFAULT '����' CHECK(status in('����','����','Ż��','�޸�')),
  gradeNo number(2) default 1 REFERENCES grade(gradeNo)
);

-- ���õ�����
INSERT INTO member(id, pw, name, gender, birth, tel, email, gradeNo)
VALUES('admin', '1111', '������', '����', '1994-09-12', '010-1111-2222', 'suyun9999@naver.com', 9);
commit;

INSERT INTO member(id, pw, name, gender, birth, tel, email )
VALUES('test', '1111', '�ù�', '����', '1999-01-01', '010-3333-4444', 'test@naver.com');
COMMIT;