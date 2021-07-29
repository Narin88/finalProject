package com.last.prj.stuyplan.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.last.prj.lectureRoom.service.LectureRoomVO;
import com.last.prj.professor.service.ProfessorVO;
import com.last.prj.stuyplan.service.StudyplanVO;

public interface StudyPlanMapper {

	List<StudyplanVO> studyPlanList(StudyplanVO vo);

	// 강의 계획서 내용
	@Select("select * from study_plan") // 기본 셀렉트문
	int studyplanInsert(StudyplanVO vo); // 강의 계획서 등록하기

	int studyplanUpdate(StudyplanVO vo); // 강의 계획서 수정하기

	StudyplanVO selectresult(StudyplanVO vo);// 값 하나 받아오기

}
