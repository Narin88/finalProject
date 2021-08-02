package com.last.prj.professor.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.professor.service.ProfessorLectureVO;
import com.last.prj.professor.service.ProfessorService;
import com.last.prj.professor.service.ProfessorVO;
import com.last.prj.stuyplan.service.StudyplanJoinVO;

@Service
public class ProfessorServiceImpl implements ProfessorService{

	@Autowired
	ProfessorMap map;
	
	@Override
	public List<ProfessorVO> professorSelectList() {
	
		return map.professorSelectList();
	}

	@Override
	public ProfessorVO professorSelect(ProfessorVO vo) {
	
		return map.professorSelect(vo);
	}

	@Override
	public int professorInsert(ProfessorVO vo) {
		
		return 0;
	}

	@Override
	public int professorUpdate(ProfessorVO vo) {
	
		return 0;
	}

	@Override
	public int professorDelete(ProfessorVO vo) {
		
		return 0;
	}
	
	// 강의 리스트 불러오기
	@Override
	public List<ProfessorLectureVO> lectureList() {
		return map.lectureList();
	}

}
