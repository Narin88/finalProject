package com.last.stuyplan.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.lectureRoom.service.LectureRoomVO;
import com.last.professor.service.ProfessorVO;
import com.last.studyplan.service.StudyplanService;
import com.last.studyplan.service.StudyplanVO;

@Service
public class StudyplanServiceImpl implements StudyplanService {

	@Autowired
	StudyPlanMapper map;
	//수강신청 리스트 불러오기
	

	//교수 정보 불러오기 
	
	@Override
	public ProfessorVO professorSelect(ProfessorVO vo) {
		// TODO Auto-generated method stub
		return map.professorSelect(vo);
	}

	
	//강의실 정보 불러오기
		
	@Override
	public LectureRoomVO lectureroomSelect(LectureRoomVO vo) {
		// TODO Auto-generated method stub
		return map.lectureroomSelect(vo);
	}

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

	
	
	
	
	
			
			
			
			
	




}
