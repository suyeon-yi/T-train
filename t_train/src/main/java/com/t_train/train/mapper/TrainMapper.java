package com.t_train.train.mapper;

import java.util.List;

import com.t_train.train.vo.TrainVO;
import com.webjjang.util.PageObject;

public interface TrainMapper {

	
	//1. list
	public List<TrainVO> list(PageObject pageObject) throws Exception;
	//1-2. 전체 데이터 개수
	public long getTotalRow(PageObject pageObject) throws Exception;
	//2. view
	public TrainVO view(long no) throws Exception;
	//3. write
	public int write(TrainVO vo) throws Exception;
	//4. update
	public int update(TrainVO vo) throws Exception;
	//5. delete
	public int delete(long no) throws Exception;
}
