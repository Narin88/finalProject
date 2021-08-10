package com.last.prj.evaluationResult.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("EvaluationResult")//값 보내기
	public String EvaluationResult(Model model, HttpSession session, EvaluationResultVO vo, StudentsVO vo2) {
		vo.setSid((String)session.getAttribute("id")); // 여기 ID 값
		vo2.setSid((String)session.getAttribute("id")); 
	
		System.out.println(vo);
		model.addAttribute("st", stService.scoreView(vo2));
		dao.EvaluationInsert(vo);
		System.out.println(dao.EvaluationInsert(vo));
		return "scoreView";
	}
	
	@RequestMapping("Eresultpro")//교수 결과 확인 페이지
	public String Eresultpro(Model model, HttpSession session, EvaluationResultVO vo) {
		vo.setSid((String)session.getAttribute("id")); // 여기 ID 값
		
		return "evaluation/evaluation_Result_pro.tiles";
	}
}
