package com.last.prj.professor.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.professor.service.ProfessorLectureVO;
import com.last.prj.professor.service.ProfessorService;

@Controller
public class ProfessorController {

	@Autowired
	ProfessorService service;
	
	// 내 강의 리스트 출력하기
	@RequestMapping("lectureList")
	public String studyplanList(Model model,ProfessorLectureVO vo,HttpSession session) {
		vo.setPid((String)session.getAttribute("id"));
		System.out.println(vo.getPid());
		model.addAttribute("spList", service.lectureList());
		
	
		return "professor/lecturelist.tiles";
	}

	
}
