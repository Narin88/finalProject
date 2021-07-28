package com.last.stuyplan.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.last.studyplan.service.StudyplanService;

@Controller
public class StudyplanController {

	@Autowired
	private StudyplanService studyDao;
}
