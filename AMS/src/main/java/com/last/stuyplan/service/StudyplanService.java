package com.last.stuyplan.service;

import org.apache.ibatis.annotations.Select;

import com.last.prj.lectureRoom.service.LectureRoomVO;

public interface StudyplanService {
	
	//교수 테이블
	ProfessorVO professorSelect(ProfessorVO vo);// // 교수 정보 리스트로 가져오기 = 이름 / 전화번호 / 이메일 /
	
	//강의실 정보
	LectureRoomVO lectureroomSelect(LectureRoomVO vo); // 강의실 정보 가져오기 = 위치 / 좌석수 / 이름
	

	//강의 계획서 내용 
	@Select("select * from study_plan") // 기본 셀렉트문 
	public int studyplanInsert(StudyplanVO vo); // 강의 계획서 등록하기
	public int studyplanUpdate(StudyplanVO vo); // 강의 계획서 수정하기
	
	
	

	
}
