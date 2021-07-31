package com.last.prj.lecture.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.lecture.service.LectureService;
import com.last.prj.lecture.service.LectureVO;
import com.last.prj.lectureRoom.service.LectureRoomService;

@Controller
public class LecutreController {
	@Autowired
	LectureService Ldao;
	
	@Autowired
	LectureRoomService LRdao;
	
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
	
	@RequestMapping("ProfessorLectureList")
	public String lectureList(Model model, HttpServletRequest req) {
		String pId = req.getParameter("id");
		model.addAttribute("lectures",Ldao.LectureList(pId));
		model.addAttribute("lroom",LRdao.getLectureRoom());
		return "Lecture/ProfessorLectureList.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="lectureUpdate", method = RequestMethod.PUT)
	public int lectureUpdate(@RequestBody LectureVO vo) {
		Ldao.LectureUpdate(vo);
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="lectureDelete", method = RequestMethod.PUT)
	public int lectureDelete(@RequestBody LectureVO vo) {
		System.out.println(vo.getDeletedRows());
		Ldao.LectureDelete(vo);
		return 0;
	}
}
