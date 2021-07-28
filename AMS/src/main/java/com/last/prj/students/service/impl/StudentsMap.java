package com.last.prj.students.service.impl;

import java.util.List;

import com.last.prj.students.service.StudentsVO;

public interface StudentsMap {

	StudentsVO studentInfo(StudentsVO vo);		// 학적 조회
	List<StudentsVO> scoreView(StudentsVO vo);	// 성적 조회
	
	int studentUpdate(StudentsVO vo);			// 학적 수정
}
