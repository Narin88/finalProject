package com.last.prj.evaluationResult.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.evaluation.service.EvaluationVO;
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
		return "scoreView";
	}
	
	@RequestMapping("EresultSt")//학생 결과 확인 페이지
	public String EresultSt(Model model, HttpSession session, EvaluationResultVO vo) {

		return "evaluation/evaluation_Result_st.tiles";
	}
	
	@RequestMapping("Eresultpro")//교수 결과 확인 페이지
	public String EvaluationResultpr(Model model, HttpSession session, EvaluationResultVO vo) {
		model.addAttribute("num",vo.getOpennum());
		model.addAttribute("data",dao.EvaluationResult(vo));
		return "evaluation/evaluation_Result_pro.tiles";
	}
	
	@PostMapping("Eresultpro")
	@ResponseBody
	public Map<String, Object> getEvaluationResultpr(EvaluationResultVO vo){
			Map<String, Object> map = new HashMap<String,Object>();
			vo.setA1("a1");
			map.put("q1", dao.EvaluationResult(vo));
			vo.setA1("a2");
			map.put("q2", dao.EvaluationResult(vo));
			vo.setA1("a3");
			map.put("q3", dao.EvaluationResult(vo));
			vo.setA1("a4");
			map.put("q4", dao.EvaluationResult(vo));
			vo.setA1("a5");
			map.put("q5", dao.EvaluationResult(vo));
			vo.setA1("a6");
			map.put("q6", dao.EvaluationResult(vo));
			vo.setA1("a7");
			map.put("q7", dao.EvaluationResult(vo));
		return map;
	}
}
