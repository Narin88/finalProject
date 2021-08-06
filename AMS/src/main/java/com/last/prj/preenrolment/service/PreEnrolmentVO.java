package com.last.prj.preenrolment.service;

import lombok.Data;

@Data
public class PreEnrolmentVO {
	private String sId; //학번
	private String openNum; //강의 개설번호
	private String reTake; //재수강여부
	
	
	private String lnum;  //강의번호
	private String lname; //강의명
	private int credit; //학점
	private String division; //이수구분
	private String timeTable;  //강의시간 강의명
	private int grade;
}
