package com.last.prj.students.service.impl;

import com.last.prj.students.service.StudentsVO;

public interface StudentsMap {

	StudentsVO studentInfo(StudentsVO vo);	// 학적 조회
	int studentUpdate(StudentsVO vo);		// 학적 수정
}
