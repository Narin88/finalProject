package com.last.prj.studyplan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.last.prj.stuyplan.service.StudyplanJoinVO;
import com.last.prj.stuyplan.service.StudyplanService;
import com.last.prj.stuyplan.service.StudyplanVO;

@Service
public class StudyplanServiceImpl implements StudyplanService {

	@Autowired
	StudyPlanMapper map;


	
	
	//강의계획서 등록하기			
	@Override
	public int studyplanInsert(StudyplanVO vo) {
		return map.studyplanInsert(vo);
	}

	//강의 계획서 수정하기

	@Override
	public int studyplanUpdate(StudyplanVO vo) {
		return map.studyplanUpdate(vo);
	}
	// 강의 리스트 불러오기
	@Override
	public List<StudyplanJoinVO> studyPlanList(StudyplanJoinVO vo) {
		return map.studyPlanList(vo);
	}
	//값 받아오기
	@Override
	public StudyplanJoinVO selectresult(StudyplanJoinVO vo) {
		return map.selectresult(vo);
	}
	//학생이 보는 강의 계획서
	@Override
	public StudyplanJoinVO readOnly(StudyplanJoinVO vo) {
		return map.readOnly(vo);
	}

	@Override
	public List<Map<String, Object>> Lname(StudyplanJoinVO vo) {
		// TODO Auto-generated method stub
		return map.Lname(vo);
	}

	@Override
	public List<Map<String, Object>> ySelect(StudyplanJoinVO vo) {
		// TODO Auto-generated method stub
		return map.ySelect(vo);
	}


	
	
	
}
