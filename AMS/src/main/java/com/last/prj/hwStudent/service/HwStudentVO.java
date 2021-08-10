package com.last.prj.hwStudent.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HwStudentVO {

	private int registerId;	//과제제출 번호
	private int submitId;	//과제들옥 번호(구분하기위한 PK)
	private String submitSid;//제출학생 학번
	private String submitFile;//제출파일
	private Date submitDate;//제출 날짜
	private String scomment;// 학생 코멘트
	private String sid; //학생번호
	private String mname; //전공이름
	private String lname; //과목명
	private String lyear;//강의년도
	private String term; //강의학기
	private String schedule; //스케줄
	private String lrcode; //강의실
	private String pname; // 교수이름
	private int opennum;//강의번호
	private String registerDate; //등록날짜
	private String pcomment;// 과제제목
	private Date pperiod;// 제출날짜
	private String registerFile;// 양식파일
	
}
