package com.last.prj.hwProfessor.service;

import java.util.List;
import java.util.Map;

public interface HwProfessorService {
    //강의명 select
	List<Map<String, Object>> hwLname(HwProfessorVO vo);
	//강의년도 select
	List<Map<String, Object>> hw_ySelect(HwProfessorVO vo);
	
	//강의년도,강의학기,강의명(강의코드) 로 검색했는 결과LIST
	List<Map<String, Object>> hwSearchList(HwProfessorVO vo);
	
	//과제 학생점수 IN
	int hwScoreIn(HwProfessorVO vo);
	
	//(교수)등록한과제 전체조희
	List<Map<String, Object>> hw_professorSelectList(HwProfessorVO vo);
	//(교수)등록한과제 제출한학생목록 전체조회
	List<Map<String, Object>> hw_submitList(HwProfessorVO vo);
	//(교수)등록한과제 조건조회
	HwProfessorVO hw_professorSelect(HwProfessorVO vo);
	
	//(교수)과제 등록
	int hwPfInsert(HwProfessorVO vo);
	//(교수)등록한 과제 삭제
	int hw_professorDelete(HwProfessorVO vo);
	//(교수)등록한 과제 정보 수정
	int hw_professorUpdate(HwProfessorVO vo);
	
	//학생이 등록한 과제 삭제
	int hwSubmitDel(HwProfessorVO vo);
	//학생이 등록한 과제 전체삭제
	int submitDelAll(HwProfessorVO vo);
	
	//교수가 등록한 과제삭제
	int hwPfDelete(HwProfessorVO vo);
	//교수가 등록한 과제변경
	int hwUpdate(HwProfessorVO vo);
	//교수 등록할 과제조회
	List<Map<String, Object>> hwPfInsertSelect(HwProfessorVO vo);
	
	//평균처리 해당강의 학생리스트
	List<Map<String, Object>> hwAvgList(HwProfessorVO vo);
}
