package com.last.prj.evaluationResult.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.evaluationResult.service.EvaluationResultService;
import com.last.prj.evaluationResult.service.EvaluationResultVO;
import com.last.prj.students.service.StudentsService;
import com.last.prj.students.service.StudentsVO;

@Controller
public class EvaluationResultController {
	@Autowired
	EvaluationResultService dao;
	
	@Autowired
	private StudentsService stService;
	
	@RequestMapping("EvaluationInsert")//값 보내기
	public String EvaluationInsert(Model model, HttpSession session, EvaluationResultVO vo, StudentsVO vo2) {
		vo.setSid((String)session.getAttribute("id")); // 여기 ID 값
		vo2.setSid((String)session.getAttribute("id")); 
	
		System.out.println(vo);
		model.addAttribute("st", stService.scoreView(vo2));
		dao.EvaluationInsert(vo);
		System.out.println(dao.EvaluationInsert(vo));
		return "redirect:scoreView";
	}
	
	@ResponseBody
	@RequestMapping("EresultSt")//학생 결과 확인 페이지
	public List<EvaluationResultVO> EresultSt(EvaluationResultVO vo) {
		return dao.EresultSt(vo);
	}
	
	@RequestMapping("Eresultpro")//교수 결과 확인 페이지
	public String EvaluationResultpr(Model model, EvaluationResultVO vo) {
		model.addAttribute("num",vo.getOpennum());
		model.addAttribute("st",dao.EvaluationQ7Result(vo));
		System.out.println(dao.EvaluationQ7Result(vo));
		
		return "evaluation/evaluation_Result_pro.tiles";
	}
	
	@PostMapping("Eresultpro")
	@ResponseBody
	public Map<String, Object> getEvaluationResultpr(EvaluationResultVO vo){
			Map<String, Object> map = new HashMap<String,Object>();
			for (int i = 1; i < 7; i++) {
				vo.setA2("a" + i);
				
				map.put("q" + i, dao.EvaluationResult(vo));
				System.out.println(dao.EvaluationResult(vo));
			}
			
			
		return map;
	}
}
