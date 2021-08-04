package com.last.prj.lecture.web;


import javax.servlet.http.HttpSession;

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
		Ldao.LectureInsert(vo);

		return "redirect:studyPlanList";
	}
	
	@RequestMapping("ProfessorLectureList")
	public String lectureList(Model model, HttpSession session) {
		String pId = (String) session.getAttribute("id");
		model.addAttribute("lectures",Ldao.LectureList(pId));
		model.addAttribute("lroom",LRdao.getLectureRoom());
		return "Lecture/ProfessorLectureList.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="lectureUpdate", method = RequestMethod.PUT)
	public int lectureUpdate(@RequestBody LectureVO vo) {
		System.out.println(vo);
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
