package com.last.prj.professor.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ProfessorService {
	@Select("select * from professor")
	List<ProfessorVO> professorSelectList();
	ProfessorVO professorSelect(ProfessorVO vo);
	int professorInsert(ProfessorVO vo);
	int professorUpdate(ProfessorVO vo);
	int professorDelete(ProfessorVO vo);
}
