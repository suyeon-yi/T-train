package com.t_train.notice;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.t_train.notice.mapper.NoticeMapper;
import com.t_train.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeTest {
	
	@Inject
	private NoticeMapper mapper;
	
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
		log.info("============ notice list mapper test =============");
		log.info(mapper.list(pageObject) + "\n");
	}
	
	@Test
	public void testView() throws Exception {
		long no  = 57;
		log.info("============ notice view mapper test =============");
		log.info(mapper.view(no) + "\n");
	}
	
	@Test
	public void testWrite() throws Exception {
		NoticeVO vo = new NoticeVO();
		vo.setTitle("테스트 진행 공지");
		vo.setContent("테스트 진행 공지");
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		Date starDate = df.parse("2022-03-11");
//		Date endDate = df.parse("2022-03-12");
//		vo.setStartDate(starDate);
//		vo.setEndDate(endDate);
		//강사님 방법 -> 경고 뜸
		vo.setStartDate(new Date(2022, 3, 11));
		vo.setEndDate(new Date(2022, 3, 12));
		log.info("============ notice write mapper test =============");
		log.info(mapper.write(vo) + "\n");
	}
	
	@Test
	public void tesUpdate() throws Exception {
		NoticeVO vo = new NoticeVO();
		vo.setNo(57);
		vo.setTitle("새해이번트 테스트 진행 공지");
		vo.setContent("테스트 진행 공지");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date starDate = df.parse("2022-01-01");
		Date endDate = df.parse("2022-02-01");
		vo.setStartDate(starDate);
		vo.setEndDate(endDate);
		log.info("============ notice update mapper test =============");
		log.info(mapper.update(vo) + "\n");
	}
	
	@Test
	public void testDelete() throws Exception {
		long no  = 58;
		log.info("============ notice delete mapper test =============");
		log.info(mapper.delete(no) + "\n");
	}
}
