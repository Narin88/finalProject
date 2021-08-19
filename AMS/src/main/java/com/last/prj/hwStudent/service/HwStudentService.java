package com.last.prj.hwStudent.service;

import java.util.List;
import java.util.Map;

public interface HwStudentService {
	
	//(학생) 등록한 과제 조회
	List<HwStudentVO> hw_studentSelectList();
	//(학생) 등록한 과제 조건조회
	HwStudentVO hw_studentSelect(HwStudentVO vo);
	//(학생) 과제 등록
	int hw_studentInsert(HwStudentVO vo);
	//(학생) 등록한 과제파일수정
	int hw_studentUpdate(HwStudentVO vo);
	
	//수강중인 과목의 과제조회
	List<Map<String, Object>> hwsSelectList(HwStudentVO vo);
	//학생이 수강중인 목록조회
	List<Map<String, Object>> hwSLectureList(HwStudentVO vo);
	//학생이 해당과제제출 페이지 이동
	List<Map<String, Object>> hwSOneSelect(HwStudentVO vo);
	
	//학생이 과제제출
	int hwSSubmit(HwStudentVO vo);
	//학생이 과제제출한것을 수정(삭제를하여서 다시 insert)
	int deleteHwS(HwStudentVO vo);
	
	//(학생) 수강중인 강의의 제출한 과제 전체리스트
	List<Map<String, Object>> hwSAllList(HwStudentVO vo);
	
	//과제개수 count
	public String hwCount(HwStudentVO vo);
}
