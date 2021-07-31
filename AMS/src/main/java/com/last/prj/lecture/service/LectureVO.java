package com.last.prj.lecture.service;

import java.util.List;

import lombok.Data;

@Data
public class LectureVO {
	private String lNum; //강의번호
	private String pId; //교수번호
	private String lrCode; //강의실 코드
	private int newLimitCount; //새로운 정원
	private String timeTable; //강의시간
	private String lYear; //학년
	private int term; //학기
	private String book; //교재
	private String divideNum; //분반
	private String dateStatus; //강의상태
	private String lName; //강의 이름
	
	private String openNum; //강의 등록번호
	private String grade; //학년
	private String division; //이수구분
	private String lrName; //강의실 이름
	
	private int enCount; //현재 수강인원
	
	private List<LectureVO> updatedRows;
	private List<LectureVO> deletedRows;
}
