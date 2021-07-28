package com.last.prj.hw_student.service.impl;

import java.util.List;

import com.last.prj.hw_student.service.hw_studentVO;

public interface hw_studentMap {

	//(학생) 등록한 과제 조회
		List<hw_studentVO> hw_studentSelectList();
		//(학생) 등록한 과제 조건조회
		hw_studentVO hw_studentSelect(hw_studentVO vo);
		//(학생) 과제 등록
		int hw_studentInsert(hw_studentVO vo);
		//(학생) 등록한 과제파일수정
		int hw_studentUpdate(hw_studentVO vo);
}
