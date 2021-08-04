package com.last.prj.scoreMana.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.scoreMana.service.ScoreManaService;
import com.last.prj.scoreMana.service.ScoreManaVO;
import com.last.prj.students.service.StudentsVO;


@Controller
public class ScoreManaController {
@Autowired
	ScoreManaService SMdao;
	
	@RequestMapping("ScoreManaPage")
	public String ScoreManaPage(Model model, HttpSession session) {
		String sId = (String) session.getAttribute("id");
		StudentsVO vo = new StudentsVO();
		vo.setSid(sId);
		model.addAttribute("student",SMdao.EnrolmentStudent(vo));
		return "scoreMana/Enrolment.tiles";
	}

	@RequestMapping("EnrolmentList")
	@ResponseBody
	public Map<String, Object> EnrolmentList(HttpSession session,@RequestBody Map<String,String> map){
		String sId = (String) session.getAttribute("id");
		String opts = map.get("opts");
		System.out.println("================================="+opts);
		
		StudentsVO vo = SMdao.StudentSelectinfo(sId);
		int grade = vo.getGrade();
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", SMdao.EnrolmentList(grade));
		data.put("data", datas);
		return data;
	}
	
	//중복 수강체크
	@RequestMapping("AjaxConfirm")
	@ResponseBody
	public int AjaxConfirm(@RequestParam("openNum") String openNum, HttpSession session) {
		String sId = (String) session.getAttribute("id");
		ScoreManaVO vo = new ScoreManaVO();
		vo.setSId(sId);
		vo.setOpenNum(openNum);
		ScoreManaVO vo2 = SMdao.OverlapCheck(vo);
		
		System.out.println(vo2);
		//중복체크
		int i = 1;
		if(SMdao.OverlapCheck(vo)==null) { //중복수강 확인
			i = 0;
		}
		System.out.println(i);
		return i;
	}
	
	//수강 취소(삭제)
	@RequestMapping("AjaxEnrolmentDelete")
	public String AjaxEnrolmentDelete(@RequestParam("openNum") String openNum,Model model, HttpSession session) {
		String sId = (String) session.getAttribute("id");
		String message = "";
		ScoreManaVO vo = new ScoreManaVO();
		vo.setSId(sId);
		vo.setOpenNum(openNum);
		
		int i = SMdao.AjaxEnrolmentDelete(vo);
			if(i>0) {
				message = "수강취소가 완료되었습니다.";
			}else {
				message = "수강취소가 실패되었습니다.";
			}
		model.addAttribute("message",message);
		return "redirect:ScoreManaPage";
	}
	
	//수강신청(insert)
	@RequestMapping("AjaxEnrolmentInsert")
	public String AjaxEnrolmentInsert(@RequestParam("openNum") String openNum, HttpSession session) {
		String sId = (String) session.getAttribute("id");
		ScoreManaVO vo = new ScoreManaVO();
		vo.setSId(sId);
		vo.setOpenNum(openNum);
		SMdao.AjaxEnrolmentInsert(vo);
		return "redirect:ScoreManaPage";
	}
	
	//재이수 확인
	@RequestMapping("AjaxRetakeChek")
	@ResponseBody
	public String AjaxRetakeChek(@RequestParam("openNum") String openNum, HttpSession session) {
		String sId = (String) session.getAttribute("id");
		ScoreManaVO vo = new ScoreManaVO();
		vo.setSId(sId);
		vo.setOpenNum(openNum);
		return SMdao.RetakeChek(vo);
	}
	
	@RequestMapping("AjaxcreditCheck")
	@ResponseBody
	public int AjaxCreditCheck(HttpSession session) {
		String sId = (String) session.getAttribute("id");
		int result = SMdao.AjaxCreditCheck(sId);
		System.out.println(result);
		return result;
	}
}
