package com.last.prj.scoreMana.service;

import java.util.List;

import lombok.Data;

@Data
public class ScoreManaVO {
	private String sid; //학번
	private String opennum; //강의번호
	private int middlescore; //중간점수
	private int finalscore; //기말점수
	private int homework; //과제점수
	private int attendancescore; //출석점수
	private int total; //총합
	private String rank; //등급
	private String retake; //재수강여부 001재수강 002수강
	private String pid;//교수 아이디
	private int grade; //학년
	private String lnum;//과목번호
	private String lname;//과목이름
	private int dividenum;//분반번호
	private String sname; //학생이름
	private String mname; //전공이름
	private String email; //학생 이메일
	private String sphone; //학생 전화번호
	private String sgender; //학생성별
	private String disabled; //장애여부
	
	private List<ScoreManaVO> updatedRows;
}
