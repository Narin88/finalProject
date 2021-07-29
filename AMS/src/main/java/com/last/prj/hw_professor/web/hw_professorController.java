package com.last.prj.hw_professor.web;

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

import com.last.prj.hw_professor.service.hw_professorService;
import com.last.prj.hw_professor.service.hw_professorVO;
import com.last.prj.professor.service.ProfessorVO;

@Controller
public class hw_professorController {

	@Autowired
	hw_professorService service;
	
	@RequestMapping("hwList")
	public String hwList(Model model){
		/*
		List<hw_professorVO> list = new ArrayList<hw_professorVO>();
		list=service.hw_professorSelectList();
		System.out.println(list);
		model.addAttribute("list",list);
		
		*/
		List<Map <String , Object>> result = service.hw_professorSelectList();
		model.addAttribute("result",result);
		System.out.println(result);
	
		
		List<Map <String , Object>> submitResult = service.hw_submitList();
		model.addAttribute("submitList",submitResult);
		
		return "hw_professor/hw_professorList.tiles";
	}
	
	
}
