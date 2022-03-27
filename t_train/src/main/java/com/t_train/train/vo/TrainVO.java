package com.t_train.train.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TrainVO {

	private String resultCode;
	private String resultMsg;
	private String numOfRows;
	private String pageNo;
	private String totalCount;
	private String traingradename;
	@DateTimeFormat(pattern = "YYYYMMDDHHMISS")
	private String depplandtime;
	@DateTimeFormat(pattern = "YYYYMMDDHHMISS")
	private String arrplandtime;
	private String depplacename;
	private String arrplacename;
	private String adultchange;
	private String trainon;
	private String serviceKey;
	private String _type;
	private String depPlaceId;
	private String arrPlaceId;
	@DateTimeFormat(pattern = "YYYYMMDD")
	private Date depPlandTime;
	private String trainGradeCode;
	private String nodeid;
	private String nodename;
	private String cityCode;
	private String cityname;
}
