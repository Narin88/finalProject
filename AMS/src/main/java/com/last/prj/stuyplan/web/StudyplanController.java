package com.last.prj.stuyplan.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.stuyplan.service.StudyplanService;
import com.last.prj.stuyplan.service.StudyplanVO;

@Controller
public class StudyplanController {

	@Autowired
	private StudyplanService dao;

	// 내 강의 리스트 출력하기
	@RequestMapping("studyPlanList")
	public String studyplanList(Model model, StudyplanVO vo, HttpSession session) {

		String id = (String) session.getAttribute("pid");

		List<StudyplanVO> studyPlanList = new ArrayList<StudyplanVO>();

		model.addAttribute("spList", studyPlanList);

		return "studyplan/studyplanlist.tiles";
	}

	// 컬럼 정보 하나씩 가져오기
	@RequestMapping("selectresult")
	public String selectresult(Model model) {
		
		return null;
	}
	
	// 강의 계획서 등록하기
	@RequestMapping("studyPlanInsertPage")
	public String studyplanInsertPage(Model model, StudyplanVO vo, HttpSession session){

			return "studyplan/studyplaninsert.tiles";
		}

	
	@RequestMapping("studyPlanInsert")
	public String studyplanInsert(Model model, StudyplanVO vo, HttpSession session) {
		
	//	dao.studyplanInsert(vo);
		return "studyplan/studyplaninsert.tiles";
	}

	// 강의 계획서 수정하기

	@RequestMapping("/studyPlanUpdate")
	public String studyplanUpdate(Model model, StudyplanVO vo) {

		//dao.studyplanUpdate(vo);
		return "studyplan/studyplanlist.tiles";
	}
}
