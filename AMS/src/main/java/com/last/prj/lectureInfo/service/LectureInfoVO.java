package com.last.prj.lectureInfo.service;

import lombok.Data;

@Data
public class LectureInfoVO{
	private String lNum; // 강의번호
	private String dCode; //이수코드
	private String mCode; //전공코드
	private int lCode; //과목코드
	private String pId; //교수ID
	private String grade; //학년
	private int limitCount; //정원
	private String lName; //강의 이름
	private String pName; //교수 이름
	private int credit; //학년
	private String division; //이수구분
	
	
}