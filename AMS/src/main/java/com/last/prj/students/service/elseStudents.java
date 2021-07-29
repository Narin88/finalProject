package com.last.prj.students.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class elseStudents {
	// students 테이블 외의 값을 받아오기 위한 클래스

	// score_mana 테이블 ( 성적 관리 & 수강 등록 )
	private int total;		// 총점
	private String rank;	// 등급
	
	// lecture 테이블 ( 강의 개설 )
	private int term;		// 학기
	private String lname;	// 강의명
	private String lyear;	// 강의 생성 년도
	
	// lecture_info 테이블 (강의 정보)
	private String dcode;	// 학과 코드
	
	// division_info 테이블 (이수 구분)	
	private int credit;		// 학점
}
