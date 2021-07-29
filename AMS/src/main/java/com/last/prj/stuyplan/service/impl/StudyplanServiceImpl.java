package com.last.prj.stuyplan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.lectureRoom.service.LectureRoomVO;
import com.last.prj.professor.service.ProfessorVO;
import com.last.prj.stuyplan.service.StudyplanService;
import com.last.prj.stuyplan.service.StudyplanVO;

@Service
public class StudyplanServiceImpl implements StudyplanService {

	@Autowired
	StudyPlanMapper map;

	//강의계획서 등록하기			
	
	@Override
	public int studyplanInsert(StudyplanVO vo) {
		// TODO Auto-generated method stub
		return map.studyplanInsert(vo);
	}

	//강의 계획서 수정하기

	@Override
	public int studyplanUpdate(StudyplanVO vo) {
		return map.studyplanUpdate(vo);
	}
	// 강의 리스트 불러오기
	@Override
	public List<StudyplanVO> studyPlanList(StudyplanVO vo) {
	
		return map.studyPlanList(vo);
	}

	@Override
	public StudyplanVO selectresult(StudyplanVO vo) {
		// TODO Auto-generated method stub
		return map.selectresult(vo);
	}

	
	
	
}
