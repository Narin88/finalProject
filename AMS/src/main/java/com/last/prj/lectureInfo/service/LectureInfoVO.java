package com.last.prj.lectureInfo.service;

import lombok.Data;

@Data
public class LectureInfoVO{
	private String lnum; // 강의번호
	private String dcode; //이수코드
	private String mcode; //전공코드
	private int lcode; //과목코드
	private String pid; //교수ID
	private String grade; //학년
	private int limitcount; //정원
	private String lname; //강의 이름
	private String pname; //교수 이름
	private int credit; //학년
	private String division; //이수구분
	
	
}