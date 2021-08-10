package com.last.prj.evaluation.service;

import java.sql.Date;

import lombok.Data;
@Data
public class EvaluationVO {
	private int evaluationseq;//번호 시퀀스
	private String sid; //학번
	private String pid;//교수아이디
	private String pname;//교수이름
	private String lyear;//강의 개설년도
	private int term;//학기
	private String opennum;//과목개설번호
	private int dividenum;//분반번호
	private int lnum;//강의번호
	private Date sdate; // 시작 일 
	private Date edate; // 마감 일 
	private String lname;//강의이름


}
