package com.last.prj.studyplan.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.last.prj.lectureRoom.service.LectureRoomVO;
import com.last.prj.professor.service.ProfessorVO;
import com.last.prj.stuyplan.service.StudyplanJoinVO;
import com.last.prj.stuyplan.service.StudyplanVO;

public interface StudyPlanMapper {

	
	//강의 리스트
	public List<StudyplanJoinVO> studyPlanList();

	// 강의 계획서 내용
	public int studyplanInsert(StudyplanVO vo); // 강의 계획서 등록하기

	public int studyplanUpdate(StudyplanVO vo); // 강의 계획서 수정하기

	public StudyplanJoinVO selectresult(StudyplanJoinVO vo);// 값 하나 받아오기

	public StudyplanJoinVO readOnly(StudyplanJoinVO vo);//	// 강의 계획서 읽기전용 (학생)

}
