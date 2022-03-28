package com.t_train.train.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TrainVO {

	private long no;
	private String traingradename;
	private String depplacename;
	private String arrplacename;
	private long adultcharge;
	@DateTimeFormat(pattern = "HH24:mm")
	private Date depplandtime;
	@DateTimeFormat(pattern = "HH24:mm")
	private Date arrplandtime;
	
}
