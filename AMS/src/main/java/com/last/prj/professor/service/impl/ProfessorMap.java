package com.last.prj.professor.service.impl;

import java.util.List;

import com.last.prj.professor.service.ProfessorLectureVO;
import com.last.prj.professor.service.ProfessorVO;


public interface ProfessorMap {
	List<ProfessorVO> professorSelectList();
	ProfessorVO professorSelect(ProfessorVO vo);
	int professorInsert(ProfessorVO vo);
	int professorUpdate(ProfessorVO vo);
	int professorDelete(ProfessorVO vo);
	List<ProfessorLectureVO> lectureList();
}
