package com.last.prj.hwProfessor.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.hwProfessor.service.HwProfessorService;
import com.last.prj.hwProfessor.service.HwProfessorVO;

@Controller
public class HwProfessorController {

	@Autowired
	HwProfessorService service;

	@RequestMapping("hwList")
	public String hwList(Model model, HwProfessorVO vo, HttpServletRequest req) {
		vo.setPid("99003013");
//		if (vo.getLyear()==null || "".equals(vo.getLyear())){
//			vo.setLyear("2021");
//		}
//		if (vo.getTerm()==null ||"".equals(vo.getTerm())) {
//			vo.setTerm("1");
//		}
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy년 MM월dd일 HH시mm분ss초");

		Date time = new Date();

		String time1 = format1.format(time);
		String time2 = format2.format(time);

		System.out.println(time1);
		System.out.println(time2);
		// 검색했을때의 값
		String year = req.getParameter("lyear");
		String term = req.getParameter("term");
		String lname = req.getParameter("ln");

		System.out.println(term);
		System.out.println(year);
		System.out.println(lname);
		model.addAttribute("reTerm", term);
		model.addAttribute("reYear", year);
		model.addAttribute("reName", lname);

		// 해당교수 과제 목록
		List<Map<String, Object>> result = service.hw_professorSelectList(vo);
		model.addAttribute("result", result);
		// System.out.println(result);
		// 강의년도 select
		List<Map<String, Object>> ySelect = service.hw_ySelect(vo);
		model.addAttribute("ySelect", ySelect);
		// 강의명 select
		List<Map<String, Object>> lName = service.hwLname(vo);
		model.addAttribute("lName", lName);
		// 해당강의 과제제출 목록
		List<Map<String, Object>> submitResult = service.hw_submitList(vo);
		model.addAttribute("submitList", submitResult);

		return "hw_professor/hw_professorList.tiles";
	}

}
