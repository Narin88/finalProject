package com.last.prj.preenrolment.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.preenrolment.service.PreEnrolmentService;
import com.last.prj.preenrolment.service.PreEnrolmentVO;
import com.last.prj.students.service.StudentsVO;

@Controller
public class PreEnrolmentController {
	@Autowired
	PreEnrolmentService Pdao;
	
	@RequestMapping("PreEnrolmentPage")
	public String PreEnrolmentPage(Model model) {
		model.addAttribute("depart",Pdao.preDepartments());
		return "preenrolment/PreEnrolmentList.tiles";
	}
	
	@PostMapping("PreEnrolmentList")
	@ResponseBody
	public Map<String,Object> PreEnrolmentList(HttpSession session, @RequestBody Map<String,String> maps){
		String sid = (String)session.getAttribute("id");
		StudentsVO svo = Pdao.PreStudentSelect(sid);
		svo.setMcode(maps.get("mcode"));
		svo.setDcode(maps.get("dcode"));
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		map.put("result", true);
		data.put("contents", Pdao.preLectureList(svo));
		map.put("data", data);
		
		return map;
	}
	
	@GetMapping("getMajorList")
	@ResponseBody
	List<PreEnrolmentVO> getMajorList(PreEnrolmentVO vo){
		return Pdao.getMajorList(vo);
	}
}
