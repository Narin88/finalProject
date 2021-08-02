package com.last.prj.hwProfessor.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HwProfessorVO {
	
	private String registerId;		//과제등록번호
	private String opennum;		//강의번호
	private Date registerDate;  //등록날짜
	private Date pperiod;		//제출기간
	private String registerFile;//양식파일
	private String pcomment;	//교수코멘트
	private String pid;			//교수번호
	private String lyear;		//강의년도
	private String term;		//강의학기
	private String lcode;		//강의코드
	}

