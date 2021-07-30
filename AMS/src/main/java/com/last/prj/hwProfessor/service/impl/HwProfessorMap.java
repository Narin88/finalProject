package com.last.prj.hwProfessor.service.impl;

import java.util.List;
import java.util.Map;

import com.last.prj.hwProfessor.service.HwProfessorVO;

public interface HwProfessorMap {
	//강의명 select
	List<Map<String, Object>> hwLname(HwProfessorVO vo);
	//강의년도 select
	List<Map<String, Object>> hw_ySelect(HwProfessorVO vo);
	
	//강의년도,강의학기,강의명(강의코드) 로 검색했는 결과LIST
	List<Map<String, Object>> hwSearchList(HwProfessorVO vo);
	
	
	
	//(교수)등록한과제 전체조희
	List<Map<String, Object>> hw_professorSelectList(HwProfessorVO vo);
	//(교수)등록한과제 제출한학생목록 전체조회
	List<Map<String, Object>> hw_submitList(HwProfessorVO vo);
	//(교수)등록한과제 조건조회
	HwProfessorVO hw_professorSelect(HwProfessorVO vo);
	//(교수)과제 등록
	int hw_professorInsert(HwProfessorVO vo);
	//(교수)등록한 과제 삭제
	int hw_professorDelete(HwProfessorVO vo);
	//(교수)등록한 과제 정보 수정
	int hw_professorUpdate(HwProfessorVO vo);
}
