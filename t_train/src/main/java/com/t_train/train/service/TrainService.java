package com.t_train.train.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.t_train.train.mapper.TrainMapper;
import com.t_train.train.vo.TrainVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TrainService {

	@Inject
	private TrainMapper mapper;
	
	//1. list
	public List<TrainVO> list(PageObject pageObject) throws Exception{
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		log.info("TrainService.list().pageObject : " + pageObject);
		return mapper.list(pageObject);
	}
	
	//2. view
	public TrainVO view(long no) throws Exception{
		log.info("TrainService.view().no : " + no);
		return mapper.view(no);
	}
	
	//3. write
	public int write(TrainVO vo) throws Exception {
		log.info("TrainService.write().vo : " + vo);
		return mapper.write(vo);
	}
	
	//4. update
	public int update(TrainVO vo) throws Exception {
		log.info("TrainService.write().vo : " + vo);
		return mapper.update(vo);
	}
	
	//5. delete
	public int delete(long no) throws Exception {
		log.info("TrainService.delete().no : " + no);
		return mapper.delete(no);
	}
	
	
}
