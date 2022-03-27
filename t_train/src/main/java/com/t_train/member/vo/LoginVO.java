package com.t_train.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LoginVO {

	private String id;
	private String pw;
	private String name;
	private int gradeNo;
	private String gradeName;
	
}
