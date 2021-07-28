package com.last.prj.hw_student.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.last.prj.hw_student.service.hw_studentService;

@Controller
public class hw_studentController {

	@Autowired
	hw_studentService service;
	
	
}
