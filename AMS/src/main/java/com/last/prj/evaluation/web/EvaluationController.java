package com.last.prj.evaluation.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.evaluation.service.EvaluationService;
import com.last.prj.evaluation.service.EvaluationVO;
import com.last.prj.students.service.StudentsService;
import com.last.prj.students.service.StudentsVO;

@Controller
public class EvaluationController {

	@Autowired
	EvaluationService dao;

	/*
	 * @Autowired private StudentsService stService;
	 */
	/*
	 * @RequestMapping("ss") public String EvaluationPage(Model model, HttpSession
	 * session, StudentsVO vo) { vo.setSid((String) session.getAttribute("id"));
	 * vo.setTerm(1);
	 * 
	 * model.addAttribute("eva", stService.appliedLecture(vo));
	 * System.out.println(vo); System.out.println("누구======================" +
	 * stService.appliedLecture(vo));
	 * 
	 * return "evaluation/question.tiles";
	 * 
	 * }
	 */
	
	  //컬럼 정보 하나씩 가져오기
	  
	  @RequestMapping("Evaluation") 
	  public String Evaluation(Model model, HttpSession session, EvaluationVO vo) { 
			vo.setSid((String) session.getAttribute("id"));
			vo.setTerm(1);
			
			model.addAttribute("eva", dao.selectone(vo));
		 	System.out.println(vo);
		 	System.out.println(dao.selectone(vo));
		 	
		 	return "evaluation/question.tiles";
	  
	  }
	 
}
