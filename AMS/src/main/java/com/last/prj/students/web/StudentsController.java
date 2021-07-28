package com.last.prj.students.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("studentUpdate")
	public int studentUpdate(StudentsVO vo) {
		// 학생 정보 수정
		
		int result = 0;
		
		vo.setSid("21002002");
		vo.setPwd("1111");
		
		result = serv.studentUpdate(vo);
		
		return result;
	}
	
	
}
