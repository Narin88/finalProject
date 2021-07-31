package com.last.prj.studyplan.web;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.stuyplan.service.StudyplanJoinVO;
import com.last.prj.stuyplan.service.StudyplanService;
import com.last.prj.stuyplan.service.StudyplanVO;

@Controller
public class StudyplanController {

	@Autowired
	private StudyplanService dao;

	// 내 강의 리스트 출력하기
	@RequestMapping("studyPlanList")
	public String studyplanList(Model model) {

		//String id = (String) session.getAttribute("pid");
			

		model.addAttribute("spList", dao.studyPlanList());
		
	
		return "studyplan/studyplanlist.tiles";
	}

	// 컬럼 정보 하나씩 가져오기
	@RequestMapping("selectresult")
	public String selectresult(Model model) {
		model.addAttribute("spList", dao.studyPlanList());
		
		return null;
	}
	
	// 강의 계획서 등록하기
	@RequestMapping("studyPlanInsertPage")
	public String studyplanInsertPage(Model model, StudyplanJoinVO vo){

		model.addAttribute("spList", dao.selectresult(vo));
		System.out.println(dao.selectresult(vo));
			return "studyplan/studyplaninsert.tiles";
		}

	
	@RequestMapping("studyPlanInsert")
	public String studyplanInsert(Model model, StudyplanJoinVO vo, StudyplanVO vo2) {
	
		dao.studyplanInsert(vo2);
		return "studyplan/redirect:studyPlanInsertPage?opennum="+vo.getOpennum();
	}
					

	
	// 강의 계획서 수정하기
	@RequestMapping("/studyPlanUpdatePage")
	public String studyPlanUpdatePage(Model model, StudyplanVO vo, StudyplanJoinVO vo2) {
		model.addAttribute("spList", dao.selectresult(vo2));
		return  "studyplan/studyplanupdate.tiles";
	}
	
	@RequestMapping("/studyPlanUpdate")
	public String studyplanUpdate(Model model, StudyplanVO vo) {
		model.addAttribute("spList", dao.studyplanUpdate(vo));
		
		return "redirect:studyPlanUpdatePage?opennum="+vo.getOpennum();
	}
	
	@RequestMapping("/readOnly")
	public String studyplanReadonlyPage(Model model, StudyplanJoinVO vo) {
		model.addAttribute("spList", dao.selectresult(vo));
		return "studyplan/studyplanreadonly.tiles";
	}
	
	// 강의 계획서 수정하기
	@RequestMapping("/readOnly2")
	public String studyplanReadonlyPage(Model model, StudyplanVO vo, StudyplanJoinVO vo2) {
		model.addAttribute("spList", dao.selectresult(vo2));
		return  "studyplan/studyplanreadonly.tiles";
	}
	
	//홈2
	@RequestMapping("/home2")
	public String home2() {
		return "studyplan/home2.tiles";
	}
	
}