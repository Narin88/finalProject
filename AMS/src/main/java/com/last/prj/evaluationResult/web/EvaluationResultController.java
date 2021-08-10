package com.last.prj.evaluationResult.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.evaluation.service.EvaluationVO;
import com.last.prj.evaluationResult.service.EvaluationResultService;
import com.last.prj.evaluationResult.service.EvaluationResultVO;

@Controller
public class EvaluationResultController {
	@Autowired
	EvaluationResultService dao;
	@RequestMapping("EvaluationResult")//값 보내기
	public String EvaluationResult(Model model, HttpSession session, EvaluationResultVO vo) {
		vo.setSid((String)session.getAttribute("id")); // 여기 ID 값
		dao.EvaluationInsert(vo);
		System.out.println(dao.EvaluationInsert(vo));
		return "students/studentScoreView.tiles";
	}
}
