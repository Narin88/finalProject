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
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	//첫 번쨰 그리드 수강 내역
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
	
	// 전공목록 가져오기
	@GetMapping("getMajorList")
	@ResponseBody
	List<PreEnrolmentVO> getMajorList(PreEnrolmentVO vo){
		return Pdao.getMajorList(vo);
	}
	
	//두 번째 그리드 수강꾸러미 내역
	@PostMapping("enrolmentpackage")
	@ResponseBody
	public Map<String, Object> enrolmentpackage(HttpSession session){
		String sid = (String) session.getAttribute("id");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> maps = new HashMap<String, Object>();
		map.put("result", true);
		maps.put("contents", Pdao.enrolmentpackage(sid));
		map.put("data", maps);
		return map;
	}
	

	@GetMapping("preEnrolmentlimitCheck")
	@ResponseBody
	public int preEnrolmentlimitCheck(HttpSession session) {	
		String sid = (String) session.getAttribute("id");	
		return Pdao.preEnrolmentlimitCheck(sid);
	}
	
	@PostMapping("preEnrolmentinsert")
	@ResponseBody
	public Map<String, Object> preEnrolmentinsert(@RequestBody List<PreEnrolmentVO> vo, HttpSession session){
		String sid = (String) session.getAttribute("id");
		
		System.out.println("=============================="+vo);
		
		return null;
	}
}
