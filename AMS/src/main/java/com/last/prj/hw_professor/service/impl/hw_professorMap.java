package com.last.prj.hw_professor.service.impl;

import java.util.List;

import com.last.prj.hw_professor.service.hw_professorVO;

public interface hw_professorMap {

	//(교수)등록한과제 전체조희
	List<hw_professorVO> hw_professorSelectList();
	//(교수)등록한과제 조건조회
	hw_professorVO hw_professorSelect(hw_professorVO vo);
	//(교수)과제 등록
	int hw_professorInsert(hw_professorVO vo);
	//(교수)등록한 과제 삭제
	int hw_professorDelete(hw_professorVO vo);
	//(교수)등록한 과제 정보 수정
	int hw_professorUpdate(hw_professorVO vo);
}
