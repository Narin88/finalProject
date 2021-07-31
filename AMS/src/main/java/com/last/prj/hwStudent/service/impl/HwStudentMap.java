package com.last.prj.hwStudent.service.impl;

import java.util.List;

import com.last.prj.hwStudent.service.HwStudentVO;

public interface HwStudentMap {

	//(학생) 등록한 과제 조회
		List<HwStudentVO> hw_studentSelectList();
		//(학생) 등록한 과제 조건조회
		HwStudentVO hw_studentSelect(HwStudentVO vo);
		//(학생) 과제 등록
		int hw_studentInsert(HwStudentVO vo);
		//(학생) 등록한 과제파일수정
		int hw_studentUpdate(HwStudentVO vo);
}
