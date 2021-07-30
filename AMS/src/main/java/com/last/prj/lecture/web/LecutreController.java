package com.last.prj.lecture.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.lecture.service.LectureService;
import com.last.prj.lecture.service.LectureVO;

@Controller
public class LecutreController {
	@Autowired
	LectureService Ldao;
	
	@RequestMapping("LectureInsert")
	public String LectureInsert(LectureVO vo, Model model) {
		
		int a = Ldao.LectureInsert(vo);
		String message = "";
		if(a>0) {
			message = "등록성공";
		}else
			message = "등록실패";
		model.addAttribute(message);
		return "redirect:LectureInfo";
	}
}
