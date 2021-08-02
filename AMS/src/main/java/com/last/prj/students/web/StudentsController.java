package com.last.prj.students.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.professor.service.ProfessorVO;
import com.last.prj.students.service.StudentsService;
import com.last.prj.students.service.StudentsVO;

@Controller
public class StudentsController {

	@Autowired
	private StudentsService serv;

	////////////////////////////////////////////////////////////

	@RequestMapping("/studentInfo.do")
	public String studentInfo(StudentsVO vo, Model model) {
		// 학생 정보 조회 페이지로 이동 및 한 학생 정보 조회

		vo.setSid("21002002");	// 세션으로 대체 필요.

		model.addAttribute("st", serv.studentInfo(vo));
		
		return "students/studentInfo.tiles";
	}
	
	
	@RequestMapping("/infoConfirmPage")
	public String infoConfirm() {
		// 본인확인 페이지로 이동하기

		return "students/infoConfirm";
	}

	
	@RequestMapping("/infoConfirm.do")
	public String confirmingInfo(StudentsVO vo, Model model, HttpSession session) {
		// 본인 확인 과정 > 학생 정보(비밀번호) 수정 페이지로 이동

		// session id 값 받고 입력받은 아이디 값이랑 비교해야 함.

		String path = null;
		StudentsVO result = serv.selfAuthentication(vo);

		if (result == null) {
			// 조회 결과가 없으면

			path = "students/infoConfirm";
		} else {
			// 조회 결과가 있으면

			model.addAttribute("st", serv.selfAuthentication(vo));
			path = "students/infoModify.tiles";
		}

		return path;
	}
	
	
	@RequestMapping("/scoreView")
	public String scoreView(StudentsVO vo, Model model) {
		// 성적 조회 페이지
		vo.setSid("21002002");	// 세션 받기

		model.addAttribute("st", serv.scoreView(vo));

		return "students/studentScoreView.tiles";
	}
	
	@RequestMapping("/appliedLecture")
	public String appliedLecture(StudentsVO vo, Model model){
		// 수강 신청한(했던) 과목 조회

		// select
		vo.setLyear("2021");
		vo.setTerm(1);
		
		// session
		vo.setSid("21002002");
		
		model.addAttribute("st", serv.appliedLecture(vo));

		return "students/appliedLecture.tiles";
	}

	

	@RequestMapping("/lectureLookUp.do")	// do를 적어야 하나 말아야 하나
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
	
	@RequestMapping("/professorSelect.do")	// 이게 필요한가? location에 직접 값 넣으면 될 것도 같은데?
	public ProfessorVO professorSelect(ProfessorVO vo) {
		// 교수 정보 보기
		
		return serv.professorSelect(vo);
	}
	
	@RequestMapping("/studentUpdate.do")
	public String studentUpdate(StudentsVO vo, Model model) {
		// 학생 정보 수정
		
		String path = null;
		int result = serv.studentUpdate(vo);

		vo.setSid("21002002");	// 세션으로 받아야 함.
		System.out.println("비밀번호 뭐로 받았냐 : " + vo.getPwd());

		if (result != 0) {

			System.out.println("비밀번호 변경 안 됨.");

			path = "students/infoModify.tiles";
		} else {

			System.out.println("비밀번호 변경됨.");

			serv.studentUpdate(vo);

			model.addAttribute("st", serv.studentInfo(vo));
			path = "students/studentInfo.tiles";			
		}

		return path;
	}

}
