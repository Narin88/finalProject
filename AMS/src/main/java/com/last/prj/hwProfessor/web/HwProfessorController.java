package com.last.prj.hwProfessor.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.hwProfessor.service.HwProfessorService;
import com.last.prj.hwProfessor.service.HwProfessorVO;

import oracle.net.resolver.NavServiceAlias;

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
		// 조건 검색했을때의 값
		String year = req.getParameter("lyear");
		String term = req.getParameter("term");
		String lname = req.getParameter("ln");

		model.addAttribute("reTerm", term);
		model.addAttribute("reYear", year);
		model.addAttribute("reName", lname);

		// 해당교수 과제 목록
		List<Map<String, Object>> result = service.hw_professorSelectList(vo);
		//Map<String,Object> data= new HashMap<String,Object>();
		//Map<String,Object> datas= new HashMap<String,Object>();
		//data.put("result", true);
		//datas.put("contents", service.hw_professorSelectList(vo));
		//data.put("data", datas);
		model.addAttribute("result", result);
		
		
		
		
		
		// System.out.println(result);
		// 강의년도 select
		String defaultYear="2021";
		vo.setLyear(defaultYear);
		List<Map<String, Object>> ySelect = service.hw_ySelect(vo);
		model.addAttribute("ySelect", ySelect);
		// 강의명 select
		List<Map<String, Object>> lName = service.hwLname(vo);
		model.addAttribute("lName", lName);

		
			
		return "hw_professor/hw_professorList.tiles";
			
	}
	// 해당강의 과제제출 목록
	@RequestMapping("inquiry")
	@ResponseBody
	public List<Map<String, Object>> inquiry(HttpServletRequest req,Model model,HwProfessorVO vo) {
		
					//String register_id=req.getParameter("register_id");
					//vo.setRegisterId(register_id);
						//	System.out.println(register_id);
					//List<Map<String, Object>> submitResult = service.hw_submitList(vo);
					//model.addAttribute("submitList", submitResult);
		return  service.hw_submitList(vo);
	}
	//교수 점수 기능
	@RequestMapping("scoreIn")
	public String scoreIn(HwProfessorVO vo){
		System.out.println(vo.getSubmitSid());
		System.out.println(vo.getScore());
		service.hwScoreIn(vo);
		return "redirect:hwList";
	}
	
	
	//교수 과제 등록
	@RequestMapping("hwPfInsert")
	public String hwPfInsert(HwProfessorVO vo,Model model) {
				vo.setPid("99003013");
				// 해당교수 과제 목록
				List<Map<String, Object>> result = service.hwPfInsertSelect(vo);
				System.out.println(result);
				model.addAttribute("result",result);
				// 강의년도 select
				SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
				
				Date time = new Date();	
				
				String time1=format1.format(time);
				System.out.println(time1);
				model.addAttribute("today",time1);
				
				//List<Map<String, Object>> list =service.hwPfInsertSelect(vo);
				//System.out.println(list);
				//model.addAttribute("list",list);
		
				return "hw_professor/hw_professorInsert.tiles";
	}
	
	@RequestMapping("hwInsertForm")
	public String hwInsertFrm(HwProfessorVO vo,HttpServletRequest req) {
	System.out.println(vo);
			//service.hwPfInsert(vo);
		return "redirect:hwPfInsert";
	}
	
	@RequestMapping("hwSubmitDel")
	@ResponseBody
	public int hwSubmitDel(HwProfessorVO vo) {
		
		return service.hwSubmitDel(vo);
	}
	//학생 제출한과제 전체삭제
	@RequestMapping("submitDelAll")
	public String submitDelAll(HwProfessorVO vo) {
		
		service.submitDelAll(vo);
		return "redirect:hwList"; 
	}
	
	//교수가 등록한 과제삭제
	@RequestMapping("hwPfDel")
	public String hwPfDel(HwProfessorVO vo) {
		int r=service.hwPfDel(vo);
		if(r!=0) {
			System.out.println("success");
		}else {
			System.out.println("fail");
		}
		return "redirect:hwList";
	}
	
	@RequestMapping("hwUpdate")
	public String hwUpdate(HwProfessorVO vo) {
		int r=service.hwUpdate(vo);
		return "redirect:hwList";
	}
}
