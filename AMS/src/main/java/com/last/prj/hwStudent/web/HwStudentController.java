package com.last.prj.hwStudent.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.hwStudent.service.HwStudentService;
import com.last.prj.hwStudent.service.HwStudentVO;

@Controller
public class HwStudentController {

	@Autowired
	HwStudentService service;
	
	@RequestMapping("hwStudent")
	public String hwStudent(Model model,HwStudentVO vo) {
		vo.setSid("21001001");
		List<Map<String, Object>> result =service.hwSLectureList(vo);
		//수강중인 강의목록 
		model.addAttribute("result",result);
		return "hw_student/hw_StudentMain.tiles";
	}
	
	@RequestMapping("hwSelect")
	public String hwSelectList(Model model,HwStudentVO vo) {
		vo.setSid("21001001");
		vo.setOpennum(14);
		
		
		//해당강의 과제조회
		List<Map<String, Object>> result =service.hwsSelectList(vo);
		model.addAttribute("result",result);
		return "hw_student/hw_SelectList.tiles";
	}
}
