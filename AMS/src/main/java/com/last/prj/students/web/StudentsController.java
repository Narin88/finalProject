package com.last.prj.students.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.last.prj.preenrolment.service.PreEnrolmentService;
import com.last.prj.professor.service.ProfessorService;
import com.last.prj.professor.service.ProfessorVO;
import com.last.prj.students.service.StudentsService;
import com.last.prj.students.service.StudentsVO;
import com.last.prj.studyplan.service.StudyplanJoinVO;
import com.last.prj.studyplan.service.StudyplanService;

@Controller
public class StudentsController {

	@Autowired
	private StudentsService stService;

	@Autowired
	private ProfessorService pfService;
	
	@Autowired
	private PreEnrolmentService preService;
	
	@Autowired
	private StudyplanService planService;
	
	////////////////////////////////////////////////////////////

	@RequestMapping("studentInfo")
	public String studentInfo(StudentsVO svo, Model model, HttpSession session, ProfessorVO pvo) {
		// 학생 정보 조회 페이지로 이동 및 한 학생 정보 조회

		svo.setSid((String) session.getAttribute("id"));

		// 학생정보
		model.addAttribute("st", stService.studentInfo(svo));

		pvo.setPid(stService.studentInfo(svo).getPid());
		// 지도교수 정보
		model.addAttribute("pro", pfService.professorSelect(pvo));

		// 지도교수 강의정보
		model.addAttribute("al", stService.proLectureList(svo));
		
		return "students/studentInfo.tiles";
	}

	// grid api 값 받아오기
	@RequestMapping("scoreGetList")
	@ResponseBody
	public Map<String, Object> scoreGetList(HttpSession session, @RequestBody Map<String, String> map, StudentsVO vo) {
		vo.setSid((String) session.getAttribute("id"));

		if (map.get("year") != null) {
			vo.setLyear((String) map.get("year"));
			vo.setTerm(Integer.parseInt(map.get("term")));
		}

		// 시험점수 리스트 보내주기
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", stService.scoreView(vo));
		data.put("data", datas);

		return data;
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
		vo.setSid(realID);
		
		StudentsVO result = stService.selfAuthentication(vo);
		
		Boolean chk = BCrypt.checkpw(vo.getPwd(), result.getPwd());

		if (chk == false) {
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
		model.addAttribute("st", stService.scoreView(vo));
		model.addAttribute("tt", stService.divisionList(vo));
		
		
		return "students/studentScoreView.tiles";
	}

	@RequestMapping("/appliedLecture")
	public String appliedLecture(StudentsVO vo, Model model, HttpSession session) {
		// 수강 신청한(했던) 과목 조회

		// select
		vo.setTerm(1);

		// session
		vo.setSid((String) session.getAttribute("id"));

		model.addAttribute("st", stService.appliedLecture(vo));
		model.addAttribute("st1", stService.confirmEvalCheck(vo));

		return "students/appliedLecture.tiles";
	}

	@RequestMapping("/lectureLookUp")
	public String lectureLookUp(StudentsVO vo, Model model) {
		// 강의 시간표들 조회 (수강 신청 과정)

		// common code
		vo.setTerm(1);
		
		model.addAttribute("lec", stService.lectureLookUp(vo));
		model.addAttribute("room", stService.whereRoom());
		model.addAttribute("depart", preService.preDepartments());
		// model.addAttribute("spList", planService.selectresult(planVO));
		
		return "students/lectureLookUp.tiles";
	}

	@RequestMapping("/studentUpdate")
	public String studentUpdate(StudentsVO vo, Model model, HttpSession session) {
		// 학생 정보 수정

		String path = null;
		vo.setSid((String) session.getAttribute("id"));
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePwd = encoder.encode(vo.getPwd());
		vo.setPwd(securePwd);
		
		// boolean isRealPwd = BCrypt.checkpw(vo.getPwd(), securePwd);
		int result = stService.studentUpdate(vo);

		if (result != 0) {
			System.out.println("비밀번호 변경됨.");
			model.addAttribute("st", stService.studentInfo(vo));
			path = "students/studentInfo.tiles";
		} else {
			System.out.println("비밀번호 변경 안 됨.");
			path = "students/infoModify.tiles";
		}

		return path;
	}
	
	// 학과명으로 전공코드 및 전공명 조회
	@ResponseBody
	@GetMapping("customDcode")
	public List<StudentsVO> customDcode(StudentsVO vo) {
		return stService.customDcode(vo);
	}
	
	// 강의 계획서 조회
	@ResponseBody
	@GetMapping("planView")
	public StudyplanJoinVO planView(StudyplanJoinVO vo) {
		
		System.out.println("\n" + planService.selectresult(vo) + "\n");
		return planService.selectresult(vo);
	}

	// 강의 정보 조회
	@ResponseBody
	@RequestMapping("wantLectureList")
	public Map<String, Object> wantLectureList(
			HttpSession session,
			@RequestBody Map<String, String> map,
			StudentsVO vo)
	{
		
		vo.setSid((String) session.getAttribute("id"));
		vo.setTerm(1);
		
		vo.setMcode(map.get("mcode"));
		vo.setDname(map.get("dname"));
		vo.setDivision(map.get("division"));
		vo.setLocation(map.get("location"));
		vo.setTimetable(map.get("timetable"));
		
		if (map.get("grade") != null) {
			vo.setGrade(Integer.parseInt(map.get("grade")));
		}
		
		// 리스트 보내주기
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", stService.lectureLookUp(vo));
		data.put("data", datas);
		
		return data;
	}
	
	@RequestMapping("imageUpload")
	public String imgUpload(@RequestParam("pic") MultipartFile file, Model model, HttpSession session, StudentsVO vo) throws IllegalStateException, IOException {
		String path = session.getServletContext().getRealPath("resources/image/students");
		
		String sid = (String)session.getAttribute("id");
		vo.setSid(sid);
		vo = stService.studentInfo(vo);
		
		if (vo.getPicture() != null && !vo.getPicture().isEmpty()) {
			File orgFile = new File(path + File.separator + vo.getPicture());
			orgFile.delete();
			System.out.println("파일삭제 성공~~~~~~~~~~~~~~~~~~~~~~~~~");
		}
		
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(path, file.getOriginalFilename()));
			System.out.println("경로 ==== " + path);
			System.out.println("파일이름 === " + file.getOriginalFilename());
			System.out.println("성공!!!!!!!!!!!!!!!!!!!!!");
			
			vo.setPicture(file.getOriginalFilename());
			stService.studentPicUpdate(vo);
		}
		
		return "redirect:studentInfo";
	}
	
}
