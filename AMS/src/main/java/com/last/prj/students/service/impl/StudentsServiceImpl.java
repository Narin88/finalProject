package com.last.prj.students.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.professor.service.ProfessorVO;
import com.last.prj.students.service.StudentsService;
import com.last.prj.students.service.StudentsVO;

@Service
public class StudentsServiceImpl implements StudentsService {

	@Autowired
	private StudentsMapper map;
	
	@Override
	public StudentsVO studentInfo(StudentsVO vo) {
		// 학생 정보 조회
		
		return map.studentInfo(vo);
	}


	@Override
	public List<StudentsVO> scoreView(StudentsVO vo) {
		// 성적 조회
		return map.scoreView(vo);
	}

	@Override
	public List<StudentsVO> appliedLecture(StudentsVO vo) {
		// 수강 신청 과목 조회
		return map.appliedLecture(vo);
	}
	
	
	@Override
	public List<StudentsVO> lectureLookUp(StudentsVO vo) {
		// 강의 시간표들 조회
		return map.lectureLookUp(vo);
	}
	
	@Override
	public ProfessorVO professorSelect(ProfessorVO vo) {
		// 교수 정보 조회
		return map.professorSelect(vo);
	}
	
	
	@Override
	public StudentsVO selfAuthentication(StudentsVO vo) {
		// 본인 인증
		return map.selfAuthentication(vo);
	}
	
	@Override
	public int studentUpdate(StudentsVO vo) {
		// 학생 정보 수정
		
		return map.studentUpdate(vo);
	}

}
