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
}
