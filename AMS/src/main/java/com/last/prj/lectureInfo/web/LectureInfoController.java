package com.last.prj.lectureInfo.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.lectureInfo.service.LectureInfoService;
import com.last.prj.lectureRoom.service.LectureRoomService;

@Controller
public class LectureInfoController {
	@Autowired
	private LectureRoomService LRdao;
	
	@Autowired
	private LectureInfoService Lidao;
	
	@RequestMapping("LectureInfo")
	public String LectureInfo(Model model, HttpSession session) {
		String pid = (String) session.getAttribute("id");
		model.addAttribute("Lectures",Lidao.getLectureInfoList(pid));
		model.addAttribute("LR",LRdao.getLectureRoom());
		System.out.println("======================="+Lidao.getLectureInfoList(pid));
		return "Lecture/LectureInfoList.tiles";
	}
	
	@RequestMapping("testPage")
	public String testPage() {
		return "test/testpage.tiles";
	}
}
 