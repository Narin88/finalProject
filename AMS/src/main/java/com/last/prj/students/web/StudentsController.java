package com.last.prj.students.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.professor.service.ProfessorVO;
import com.last.prj.students.service.StudentsService;
import com.last.prj.students.service.StudentsVO;

@Controller
public class StudentsController {

	@Autowired
	private StudentsService serv;
	
	@ResponseBody
	@RequestMapping("studentInfo")
	public StudentsVO studentInfo(StudentsVO vo) {
		// 한 학생 정보 조회
		
		vo.setSid("21002002");
		
		return serv.studentInfo(vo);
		
	}
	
	@ResponseBody
	@RequestMapping("scoreView")
	public List<StudentsVO> scoreView(StudentsVO vo) {
		// 성적 조회
		vo.setSid("21002002");
		
		return serv.scoreView(vo);
	}
	
	@ResponseBody
	@RequestMapping("appliedLecture")
	public List<StudentsVO> appliedLecture(StudentsVO vo){
		// 수강 신청 과목 조회
		
		vo.setLyear("2021");
		vo.setTerm(1);
		vo.setDcode("001");
		
		vo.setSid("21002002");
		
		return serv.appliedLecture(vo);
	}
	
	@ResponseBody
	@RequestMapping("lectureLookUp")
	public List<StudentsVO> lectureLookUp(StudentsVO vo) {
		// 강의 시간표들 조회 
		
		vo.setLyear("2021");
		vo.setTerm(1);
		vo.setDcode("004");
		
		vo.setLocation("인문대");
		
		return serv.lectureLookUp(vo);
	}
	
	@ResponseBody
	@RequestMapping("professorSelect")
	public ProfessorVO professorSelect(ProfessorVO vo) {
		// 교수 정보 보기
		
		vo.setPname("홍길동");
		
		return serv.professorSelect(vo);
	}
	
	@ResponseBody
	@RequestMapping("studentUpdate")
	public int studentUpdate(StudentsVO vo) {
		// 학생 정보 수정
		
		int result = 0;
		
		vo.setSid("21002002");
		vo.setPwd("2222");
		
		result = serv.studentUpdate(vo);
		
		return result;
	}
}
