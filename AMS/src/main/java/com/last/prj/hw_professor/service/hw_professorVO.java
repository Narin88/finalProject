package com.last.prj.hw_professor.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class hw_professorVO {
	
	private int registerId;		//과제등록번호
	private String lNum;		//강의번호
	private Date registerDate;  //등록날짜
	private Date pPeriod;		//제출기간
	private String registerFile;//양식파일
	private String pComment;	//교수코멘트
	}

