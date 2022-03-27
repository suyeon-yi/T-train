package com.t_train.train.mapper;

import java.util.List;

import com.t_train.train.vo.TrainVO;
import com.webjjang.util.PageObject;

public interface TrainMapper {

	
	//1. list
	public List<TrainVO> list(PageObject pageObject) throws Exception;
	//1-2. 전체 데이터 개수
		public long getTotalRow(PageObject pageObject) throws Exception;
	//2. write
	public int write(TrainVO vo) throws Exception;
}
