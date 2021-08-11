package com.last.prj.studyplan.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.last.prj.hwProfessor.service.HwProfessorVO;
import com.last.prj.lectureRoom.service.LectureRoomVO;
import com.last.prj.professor.service.ProfessorVO;

public interface StudyplanService {
	// 강의 계획서 내용
	public List<StudyplanJoinVO> studyPlanList(StudyplanJoinVO vo);


	public int studyplanInsert(StudyplanVO vo); // 강의 계획서 등록하기

	public int studyplanUpdate(StudyplanVO vo); // 강의 계획서 수정하기

	public StudyplanJoinVO selectresult(StudyplanJoinVO vo);// 값 하나 받아오기

	public StudyplanJoinVO readOnly(StudyplanJoinVO vo);//	// 강의 계획서 읽기전용 (학생)
	
	
    //강의명 select
	public List<StudyplanJoinVO>Lname(StudyplanJoinVO vo);
	//강의년도 select
	public List<StudyplanJoinVO> ySelect(StudyplanJoinVO vo);
	
	
}
