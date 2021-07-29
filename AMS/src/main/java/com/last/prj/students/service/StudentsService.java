package com.last.prj.students.service;

import java.util.List;

public interface StudentsService {
	
	StudentsVO studentInfo(StudentsVO vo);		// 학적 조회
	List<StudentsVO> scoreView(StudentsVO vo);	// 성적 조회
	
	int studentUpdate(StudentsVO vo);			// 학적 수정
	
}
