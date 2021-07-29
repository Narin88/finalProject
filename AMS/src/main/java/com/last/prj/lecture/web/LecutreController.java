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
		if(a>0) {
			System.out.println("등록성공");
		}else
			System.out.println("등록실패");
		return "redirect:LectureInfo";
	}
}
