package com.last.prj.scoreMana.service;

import lombok.Data;

@Data
public class ScoreManaVO {
	private String sId; //학번
	private String openNum; //강의번호
	private int middleScore; //중간점수
	private int finalScore; //기말점수
	private int homeWork; //과제점수
	private int attendanceScore; //추석점수
	private int total; //총합
	private String rank; //등급
	private String reTake; //재수강여부 001재수강 002수강
	
	private int grade; //학년
	
	private String sName; //학생이름
	private String mName; //전공이름
	private String email; //학생 이메일
	private String sPhone; //학생 전화번호
	private String sGender; //학생성별
	private String disabled; //장애여부
	
}
