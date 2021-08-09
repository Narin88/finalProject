package com.last.prj.evaluation.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.evaluation.service.EvaluationService;
import com.last.prj.evaluation.service.EvaluationVO;

@Controller
public class EvaluationController {
	/*
	 * @Autowired EvaluationService dao;
	 */

//
@RequestMapping("Evaluation")
public String EvaluationPage(Model model, HttpSession session, EvaluationVO vo) {
	vo.setSid((String)session.getAttribute("id"));
	/*
	 * model.addAttribute("eva", dao.questionList(vo));
	 */
	return "evaluation/question.tiles";

}

}
