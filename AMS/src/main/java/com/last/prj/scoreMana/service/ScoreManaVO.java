package com.last.prj.scoreMana.service;

import lombok.Data;

@Data
public class ScoreManaVO {
	private String sId; //학번
	private String openNum; //강의번호
	private int middleScore; //중간점수
	private int finalScore; //기말점수
	private int homeWork; //과제점수
	private int attendanceScore; //출석점수
	private int total; //총합
	private String rank; //등급
	private String reTake; //재수강여부 001재수강 002수강
	private String pid;//교수 아이디
	private int grade; //학년
	private String sName;		// 학생 이름
	private String lName; // 과목이름
	
	
	
	
	
	
}
