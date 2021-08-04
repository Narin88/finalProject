package com.last.prj.hwProfessor.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.hwProfessor.service.HwProfessorService;
import com.last.prj.hwProfessor.service.HwProfessorVO;

@Controller
public class HwProfessorController {

	@Autowired
	HwProfessorService service;

	@RequestMapping("hwList")
	public String hwList(Model model, HwProfessorVO vo, HttpServletRequest req) {
		vo.setPid("99003013");
//		if (vo.getLyear()==null || "".equals(vo.getLyear())){
//			vo.setLyear("2021");
//		}
//		if (vo.getTerm()==null ||"".equals(vo.getTerm())) {
//			vo.setTerm("1");
//		}
		// 조건 검색했을때의 값
		String year = req.getParameter("lyear");
		String term = req.getParameter("term");
		String lname = req.getParameter("ln");

		model.addAttribute("reTerm", term);
		model.addAttribute("reYear", year);
		model.addAttribute("reName", lname);

		// 해당교수 과제 목록
		List<Map<String, Object>> result = service.hw_professorSelectList(vo);
		model.addAttribute("result", result);
		// System.out.println(result);
		// 강의년도 select
		List<Map<String, Object>> ySelect = service.hw_ySelect(vo);
		model.addAttribute("ySelect", ySelect);
		// 강의명 select
		List<Map<String, Object>> lName = service.hwLname(vo);
		model.addAttribute("lName", lName);

		
			
		return "hw_professor/hw_professorList.tiles";
			
	}

	@RequestMapping("inquiry")
	@ResponseBody
	public List<Map<String, Object>> inquiry(HttpServletRequest req,Model model,HwProfessorVO vo) {
		// 해당강의 과제제출 목록
					//String register_id=req.getParameter("register_id");
					//vo.setRegisterId(register_id);
						//	System.out.println(register_id);
					//List<Map<String, Object>> submitResult = service.hw_submitList(vo);
					//model.addAttribute("submitList", submitResult);
		return  service.hw_submitList(vo);
	}
		
	@RequestMapping("scoreIn")
	public String scoreIn(HwProfessorVO vo){
		System.out.println(vo.getSubmitSid());
		System.out.println(vo.getScore());
		service.hwScoreIn(vo);
		return "redirect:hwList";
	}
}
