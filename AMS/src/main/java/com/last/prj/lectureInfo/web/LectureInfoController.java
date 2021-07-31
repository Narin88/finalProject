package com.last.prj.lectureInfo.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.lectureInfo.service.LectureInfoService;
import com.last.prj.lectureInfo.service.LectureInfoVO;
import com.last.prj.lectureRoom.service.LectureRoomService;

@Controller
public class LectureInfoController {
	@Autowired
	private LectureRoomService LRdao;
	
	@Autowired
	private LectureInfoService Lidao;
	
	@RequestMapping("LectureInfo")
	public String LectureInfo(Model model, HttpServletRequest req) {
		//String pId = (String) session.getAttribute("id");
		String pId = req.getParameter("id");
		model.addAttribute("Lectures",Lidao.getLectureInfoList(pId));
		model.addAttribute("LR",LRdao.getLectureRoom());
		return "Lecture/LectureInfoList.tiles";
	}
	
}
 