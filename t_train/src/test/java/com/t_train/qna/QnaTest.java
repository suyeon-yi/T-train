package com.t_train.qna;



import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.t_train.qna.mapper.QnaMapper;
import com.t_train.qna.vo.QnaVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaTest {
	
	@Inject
	private QnaMapper mapper;
	
	@Test
	public void testDI() {
		log.info("============ 자동 test DI =============");
		log.info(mapper + "\n");
	}

	@Test
	public void testList() throws Exception {
		PageObject pageObject = new PageObject();
		pageObject.setPeriod("pre");
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("============ qna list mapper test =============");
		log.info(mapper.list(pageObject) + "\n");
	}
	
	@Test
	public void testView() throws Exception {
		long no  = 57;
		log.info("============ qna view mapper test =============");
		log.info(mapper.view(no) + "\n");
	}
	
	@Test
	public void testWrite() throws Exception {
		QnaVO vo = new QnaVO();
		vo.setTitle("테스트 진행 문의");
		vo.setContent("테스트 진행 문의");
		//강사님 방법 -> 경고 뜸
		log.info("============ qna write mapper test =============");
		log.info(mapper.write(vo) + "\n");
	}
	
	@Test
	public void tesUpdate() throws Exception {
		QnaVO vo = new QnaVO();
		vo.setNo(57);
		vo.setTitle("새해이번트 테스트 진행 문의");
		vo.setContent("테스트 진행 공지 문의");
		log.info("============ qna update mapper test =============");
		log.info(mapper.update(vo) + "\n");
	}
	
	@Test
	public void testDelete() throws Exception {
		long no  = 58;
		log.info("============ notice delete mapper test =============");
		log.info(mapper.delete(no) + "\n");
	}
	@Test
	public void testAnswer() throws Exception {
		QnaVO vo = new QnaVO();
		vo.setNo(57);
		vo.setTitle("새해이번트 테스트 진행 문의 답변");
		vo.setContent("테스트 진행 공지 문의 답변");
		log.info("============ qna answer mapper test =============");
		log.info(mapper.answer(vo) + "\n");
	}
}
