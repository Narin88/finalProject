package com.last.prj.professor.service;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

//교수VO
@Data
public class ProfessorVO {
	
	private String pid;		//교수 아이디
	private String mcode;	//전공 코드  
	private String pname;	//교수 이름
	private String pstatus; //교수 상태
	private String email;	//교수 이메일
	private String pphone;	//교수 연락처
	private int dcode;		//학과 코드 
	private String position;//직책
	private String pbirth;	//생년월일
	private String pgender;	//성별
	
	private String dname;	//학과이름
	private String mname;	//전공이름
}
