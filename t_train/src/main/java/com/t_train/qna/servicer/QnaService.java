package com.t_train.qna.servicer;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t_train.qna.mapper.QnaMapper;
import com.t_train.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

@Service
public class QnaService {

	@Inject
	private QnaMapper mapper;
	
	
	//1. 리스트
	public List<QnaVO> list(PageObject pageObject) throws Exception {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	//2. 질문/답변 보기
	public QnaVO view(long no) throws Exception{
		return mapper.view(no);
	}
	
	//3. 질문하기
	public int write(QnaVO vo) throws Exception {
		return mapper.write(vo);
	}
	
	//4. 질문/답변 수정
	public int update(QnaVO vo) throws Exception {
		return mapper.update(vo);
	}
	
	//5. 질문/답변 삭제
	public int delete(long no) throws Exception {
		return mapper.delete(no);
	}
	
	//6. 답변하기
	public int answer(QnaVO vo) throws Exception {
		mapper.increaseOrdNo(vo);
		return mapper.answer(vo);
	}
}
