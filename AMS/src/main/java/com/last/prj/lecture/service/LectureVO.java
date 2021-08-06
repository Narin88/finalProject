package com.last.prj.lecture.service;

import java.util.List;

import lombok.Data;

@Data
public class LectureVO {
	private String lnum; //강의번호
	private String pid; //교수번호
	private String lrcode; //강의실 코드
	private int newlimitcount; //새로운 정원
	private String timetable; //강의시간
	private String lyear; //학년
	private int term; //학기
	private String book; //교재
	private String dividenum; //분반
	private String datestatus; //강의상태
	private String lname; //강의 이름
	private int credit; //학점
	private String dname; //학과이름
	private String mname; //전공이름
	private String opennum; //강의 등록번호
	private int grade; //학년
	private String division; //이수구분
	private String lrname; //강의실 이름
	
	private String seach; //검색해야될 내용
	private String seachgubun; //검색할카테고리
	
	private int encount; //현재 수강인원
	
	private List<LectureVO> updatedRows;
	private List<LectureVO> deletedRows;
	
	private List<LectureVO> Listview;
}
