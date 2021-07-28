package com.last.prj.students.service;

public interface StudentsService {
	
	StudentsVO studentInfo(StudentsVO vo);	// 학적 조회
	int studentUpdate(StudentsVO vo);		// 학적 수정
}
