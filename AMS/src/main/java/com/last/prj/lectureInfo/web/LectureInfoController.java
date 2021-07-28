package com.last.prj.lectureInfo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.lectureInfo.service.LectureInfoService;

@Controller
public class LectureInfoController {

	@Autowired
	private LectureInfoService Lidao;
	
	@RequestMapping("LectureInfo")
	public String LectureInfo(Model model) {
		model.addAttribute("Lectures",Lidao.getLectureInfoList());
		return "Lecture/LectureInfoList";
	}
	
}
