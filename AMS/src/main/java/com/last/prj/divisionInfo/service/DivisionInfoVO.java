package com.last.prj.divisionInfo.service;

import lombok.Data;

@Data
public class DivisionInfoVO {
	private String dCode; //이수 코드
	private String division; // 이수구분
	private int cRedit; //학점
}