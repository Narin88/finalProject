package com.last.prj.hw_professor.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.hw_professor.service.hw_professorService;

@Controller
public class hw_professorController {

	@Autowired
	hw_professorService service;
	
	@RequestMapping("hwList")
	public String hwList() {
		return "hw_professor/hw_professorList.tiles";
	}
	
	
}
