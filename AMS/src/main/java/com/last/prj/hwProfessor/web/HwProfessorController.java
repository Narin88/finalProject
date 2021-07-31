package com.last.prj.hwProfessor.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.hwProfessor.service.HwProfessorService;
import com.last.prj.hwProfessor.service.HwProfessorVO;
import com.last.prj.professor.service.ProfessorVO;

@Controller
public class HwProfessorController {

	@Autowired
	HwProfessorService service;
	
	@RequestMapping("hwList")
	public String hwList(Model model,HwProfessorVO vo){
		vo.setPid("99003013");
//		if (vo.getLyear()==null || "".equals(vo.getLyear())){
//			vo.setLyear("2021");
//		}
//		if (vo.getTerm()==null ||"".equals(vo.getTerm())) {
//			vo.setTerm("1");
//		}
		
		//해당교수 과제 목록
		List<Map <String , Object>> result = service.hw_professorSelectList(vo);
		model.addAttribute("result",result);
		System.out.println(result);
		//강의년도 select
		List<Map <String , Object>> ySelect = service.hw_ySelect(vo);
		model.addAttribute("ySelect",ySelect);
		//강의명 select
				List<Map <String , Object>> lName = service.hwLname(vo);
				model.addAttribute("lName",lName);
		//해당강의 과제제출 목록
		List<Map <String , Object>> submitResult = service.hw_submitList(vo);
		model.addAttribute("submitList",submitResult);
		
		return "hw_professor/hw_professorList.tiles";
	}
	
}