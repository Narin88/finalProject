package com.last.prj.hwStudent.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.last.prj.hwStudent.service.HwStudentService;

@Controller
public class HwStudentController {

	@Autowired
	HwStudentService service;
	
	
}
