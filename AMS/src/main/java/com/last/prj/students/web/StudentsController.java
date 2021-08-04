package com.last.prj.students.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.students.service.StudentsService;
import com.last.prj.students.service.StudentsVO;

@Controller
public class StudentsController {

	@Autowired
	private StudentsService serv;

	////////////////////////////////////////////////////////////

	@RequestMapping("/studentInfo")
	public String studentInfo(StudentsVO vo, Model model, HttpSession session) {
		// 학생 정보 조회 페이지로 이동 및 한 학생 정보 조회

		vo.setSid((String) session.getAttribute("id"));
		model.addAttribute("st", serv.studentInfo(vo));
		
		return "students/studentInfo.tiles";
	}
	
	
	@RequestMapping("/infoConfirmPage")
	public String infoConfirm() {
		// 본인확인 페이지로 이동하기

		return "students/infoConfirm";
	}

	
	@RequestMapping("/infoConfirm")
	public String confirmingInfo(StudentsVO vo, Model model, HttpSession session) {
		// 본인 확인 과정 > 학생 정보(비밀번호) 수정 페이지로 이동

		String path = null;
		String realID = (String) session.getAttribute("id");
		StudentsVO result = serv.selfAuthentication(vo);
		
		if (result == null || !realID.equals(vo.getSid())) {
			// 조회 결과가 없거나, 세션 아이디와 받은 아이디 값이 다를 경우

			path = "students/infoConfirm";
		} else {
			// 정보 일치할 경우

			// model.addAttribute("st", result);
			path = "students/infoModify.tiles";
		}

		return path;
	}
	
	
	@RequestMapping("/scoreView")
	public String scoreView(StudentsVO vo, Model model, HttpSession session) {
		// 성적 조회 페이지

		vo.setSid((String) session.getAttribute("id"));
		model.addAttribute("st", serv.scoreView(vo));

		return "students/studentScoreView.tiles";
	}
	
	@RequestMapping("/appliedLecture")
	public String appliedLecture(StudentsVO vo, Model model, HttpSession session){
		// 수강 신청한(했던) 과목 조회

		// select
		vo.setLyear("2021");
		vo.setTerm(1);
		
		// session
		vo.setSid((String) session.getAttribute("id"));
		
		model.addAttribute("st", serv.appliedLecture(vo));

		return "students/appliedLecture.tiles";
	}

	
	@RequestMapping("/lectureLookUp")
	public String lectureLookUp(StudentsVO vo, Model model) {
		// 강의 시간표들 조회 (수강 신청 과정)

		// common code
		vo.setLyear("2021");
		vo.setTerm(1);

		// select ( if )
		vo.setDcode("004");
		vo.setLocation("인문대");

		model.addAttribute("lec", serv.lectureLookUp(vo));

		return "students/lectureLookUp.tiles";
	}
	
	// 모달에서 클릭 이벤트 발생시킬 때 사용하려고 했는데 이벤트 발생 페이지에서 교수 정보 다 불러 오면 굳이 필요 없음
//	@RequestMapping("/professorSelect")
//	public String professorSelect(ProfessorVO vo, Model model) {
//		// 교수 정보 보기
//		
//		model.addAttribute("prf", serv.professorSelect(vo));
//		
//		return "students/appliedLecture";
//	}
	
	@RequestMapping("/studentUpdate")
	public String studentUpdate(StudentsVO vo, Model model, HttpSession session) {
		// 학생 정보 수정
		
		String path = null;
		vo.setSid((String) session.getAttribute("id"));
		int result = serv.studentUpdate(vo);
		
		if (result != 0) {

			System.out.println("비밀번호 변경됨.");
			
			serv.studentUpdate(vo);
			
			model.addAttribute("st", serv.studentInfo(vo));
			path = "students/studentInfo.tiles";			
		} else {

			System.out.println("비밀번호 변경 안 됨.");
			
			path = "students/infoModify.tiles";
		}

		return path;
	}

}
