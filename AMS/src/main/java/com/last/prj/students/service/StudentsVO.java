package com.last.prj.students.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class StudentsVO {

	private String sid;			// 학번
	private String mcode;		// 학과
	private String sname;		// 학생 이름
	private String pid;			// 담당 교수 아이디
	private String saddress;	// 학생 주소
	private String email;		// 이메일
	private String sphone;		// 학생 연락처
	private Date enterDate;		// 입학일
	private int grade;			// 학년
	private String pwd;			// 비밀번호
	private String sstatus;		// 학생 상태
	private String sbirth;		// 학생 생년월일
	private int sgender;		// 학생 성별
	private int term;			// 학기
	private String disabled;	// 장애 여부
	
	
	
	// 아래는 students 테이블 외의 값을 받아오기 위한 변수

	// score_mana 테이블 ( 성적 관리 & 수강 등록 )
	private int total;			// 총점
	private String rank;		// 등급
	
	// lecture 테이블 ( 강의 개설 )
//		private int term;		// 학기
	private String lnum;		// 강의 번호
	private String lname;		// 강의명
	private String lyear;		// 강의 생성 년도
	private String dividenum;	// 분반
	private String timetable;	// 강의 시간(대략적) ex) 월1, 화2
	
	// lecture_info 테이블 (강의 정보)
	private String division;	// 이수 구분
	private String dcode;		// 이수 구분 코드
	private String target;		// 대상 학년
	
	// lecture_room 테이블 ( 강의실 테이블 )
	private String lrname;		// 강의실명
	private String location;	// 강의실 있는 지역
	
	// division_info 테이블 (이수 구분)	
	private int credit;			// 학점
	
	// major 테이블 ( 학과 )
	private String mname;		// 학과명
	
	// professor 테이블 ( 교수 )
	private String pname;		// 교수명
	
	// common_detail_code ( 공통 상세 코드 )
	private String student_status;	// 학생 학적 구분
}
