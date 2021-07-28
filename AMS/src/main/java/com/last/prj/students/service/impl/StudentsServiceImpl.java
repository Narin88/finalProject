package com.last.prj.students.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.students.service.StudentsService;
import com.last.prj.students.service.StudentsVO;

@Service
public class StudentsServiceImpl implements StudentsService {

	@Autowired
	private StudentsMap map;
	
	@Override
	public StudentsVO studentInfo(StudentsVO vo) {
		// 학생 정보 조회
		
		return map.studentInfo(vo);
	}

	@Override
	public int studentUpdate(StudentsVO vo) {
		// 학생 정보 수정
		
		return map.studentUpdate(vo);
	}

}
