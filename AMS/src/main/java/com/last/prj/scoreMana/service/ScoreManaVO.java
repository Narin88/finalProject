package com.last.prj.scoreMana.service;

import lombok.Data;

@Data
public class ScoreManaVO {
	private String sId; //학번
	private String lNum; //강의번호
	private int middleScore; //중간점수
	private int finalsScore; //기말점수
	private int homeWork; //과제점수
	private int attendanceScore; //추석점수
	private int total; //총합
	private String rank; //등급
}
