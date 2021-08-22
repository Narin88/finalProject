package com.last.prj.studyplan.web;






import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.students.service.StudentsVO;
import com.last.prj.studyplan.service.StudyplanJoinVO;
import com.last.prj.studyplan.service.StudyplanService;
import com.last.prj.studyplan.service.StudyplanVO;

@Controller
public class StudyplanController {

	@Autowired
	private StudyplanService dao;

	// 내 강의 리스트 출력하기
	@RequestMapping("studyPlanList")
	public String studyplanList(Model model,HttpSession session,HttpServletRequest req, StudyplanJoinVO vo) {
		String pid = (String)session.getAttribute("id");
		vo.setPid(pid);
		model.addAttribute("ySelect", dao.ySelect(vo));

		StudyplanJoinVO svo = new StudyplanJoinVO();
		svo.setPid(pid);
		svo.setLyear(vo.getLyear());
		svo.setTerm(vo.getTerm());
		model.addAttribute("spList", dao.studyPlanList(svo));
		System.out.println("====================="+dao.studyPlanList(svo));

		return "studyplan/studyplanlist.tiles";
	}

	// 컬럼 정보 하나씩 가져오기
	@RequestMapping("selectresult")
	public String selectresult(Model model, StudyplanJoinVO vo) {
		model.addAttribute("spList", dao.studyPlanList(vo));
		StudyplanJoinVO vo2 = (StudyplanJoinVO) dao.studyPlanList(vo);
		model.addAttribute("term", vo2.getTerm());
		
		return null;
	}
	
	// 강의 계획서 등록하기
	@RequestMapping("studyPlanInsertPage")
	public String studyplanInsertPage(Model model, StudyplanJoinVO vo,HttpSession session){
		vo.setPid((String)session.getAttribute("id"));
		model.addAttribute("spList", dao.selectresult(vo));
	
			return "studyplan/studyplaninsert.tiles";
		}

	
	@RequestMapping("studyPlanInsert")
	public String studyplanInsert(Model model, StudyplanJoinVO vo, StudyplanVO vo2,HttpSession session) {
		vo2.setPid((String)session.getAttribute("id"));
		model.addAttribute("spList",dao.studyplanInsert(vo2));
		return "redirect:studyPlanUpdatePage?opennum="+vo2.getOpennum();
	}
					

	
	// 강의 계획서 수정하기
	@RequestMapping("/studyPlanUpdatePage")
	public String studyPlanUpdatePage(Model model, StudyplanVO vo, StudyplanJoinVO vo2,HttpSession session) {
		vo2.setPid((String)session.getAttribute("id"));
		model.addAttribute("spList", dao.selectresult(vo2));
		return  "studyplan/studyplanupdate.tiles";
	}
	
	@RequestMapping("/studyPlanUpdate")
	public String studyplanUpdate(Model model, StudyplanVO vo,HttpSession session) {
		vo.setPid((String)session.getAttribute("id"));
		model.addAttribute("spList", dao.studyplanUpdate(vo));
		
		return "redirect:studyPlanUpdatePage?opennum="+vo.getOpennum();
	}
	//읽기전용
	
//	/*
//	 * @RequestMapping("/readOnly") public String studyplanReadonlyPage(Model model,
//	 * StudyplanJoinVO vo,HttpSession session) {
//	 * vo.setPid((String)session.getAttribute("id"));
//	 * model.addAttribute("spList",dao.selectresult(vo)); return
//	 * "studyplan/studyplanreadonly.tiles"; }
//	 */

	 @RequestMapping("/readOnly2")
	 public String studyplanReadonlyPage(Model model, StudentsVO vo , StudyplanJoinVO vo2, HttpSession session) {
		 
		 // 페이지에서 학생에게서 받은 정보들을 대입 
		 String pid = (String)session.getAttribute("id");
		 vo2.setPid(pid);
		 vo2.setOpennum(vo.getOpennum());
		 System.out.println(vo2);
		 model.addAttribute("spList", dao.selectresult(vo2));
		 
		 return "studyplan/studyplanreadonly.tiles";
	}

	
	//홈2
	@RequestMapping("home")
	public String home2(Model model,HttpSession session,StudentsVO vo) {
		
		UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		model.addAttribute("user", userDetails.getUsername());
		model.addAttribute("sr",vo);
		//세션 아이디 값 가져오기 
	    session.setAttribute("id", userDetails.getUsername());
		return "home";
	}

}
