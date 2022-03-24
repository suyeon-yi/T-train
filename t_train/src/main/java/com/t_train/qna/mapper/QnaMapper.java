package com.t_train.qna.mapper;

import java.util.List;

import com.t_train.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

public interface QnaMapper {

	//1-1. 리스트
	public List<QnaVO> list(PageObject pageObject) throws Exception;
	//1-2. 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	//2. 질문/답변보기
	public QnaVO view(long no) throws Exception;
	//3. 질문등록
	public int write(QnaVO vo) throws Exception;
	//4. 질문/답변수정
	public int update(QnaVO vo) throws Exception;
	//5. 질문/답변삭제
	public int delete(long no) throws Exception;
	//6. 답변등록의 순서번호 증가
	public int increaseOrdNo(QnaVO vo) throws Exception;
	//7. 답변등록
	public int answer(QnaVO vo) throws Exception;
}
