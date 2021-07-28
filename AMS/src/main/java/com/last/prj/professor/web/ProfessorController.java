package com.last.prj.professor.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.last.prj.professor.service.ProfessorService;

@Controller
public class ProfessorController {

	@Autowired
	ProfessorService service;
	
	
	
}
