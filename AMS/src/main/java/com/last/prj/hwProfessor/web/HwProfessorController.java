package com.last.prj.hwProfessor.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.last.prj.hwProfessor.service.HwProfessorService;
import com.last.prj.hwProfessor.service.HwProfessorVO;

import oracle.net.resolver.NavServiceAlias;

@Controller
public class HwProfessorController {

	@Autowired
	HwProfessorService service;

	@RequestMapping("hwList")
	public String hwList(Model model, HwProfessorVO vo, HttpServletRequest req,HttpSession session) {
		vo.setPid((String)session.getAttribute("id"));
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
		List<Map<String, Object>> inquiry = service.hw_submitList(vo);
		model.addAttribute("inquiry",inquiry);
		System.out.println(inquiry);
		return  inquiry;
	}
	//교수 점수 기능
	
	@RequestMapping(value="scoreIn",method=RequestMethod.PUT)
	@ResponseBody
	public int scoreIn(@RequestBody HwProfessorVO vo){
		System.out.println(vo.getSubmitSid());
		System.out.println(vo.getScore());
		int r=service.hwScoreIn(vo);
		System.out.println("============================="+r);
		if(r==1) {
			int n = service.hwAvgUpdate(vo);
			System.out.println(n);
		}
		return 0;
	}
	
	
	//교수 과제 등록페이지
	@RequestMapping("hwPfInsert")
	public String hwPfInsert(HwProfessorVO vo,Model model,HttpSession session) {
		vo.setPid((String)session.getAttribute("id"));
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
	
	//교수 과제등록 작성폼
	@RequestMapping("hwInsertForm")
	public String hwInsertFrm(HwProfessorVO vo,MultipartHttpServletRequest request) {
		//파일업로드
				String rootUploadDir = request.getSession().getServletContext().getRealPath("resources/upload/hw_professor/");
						//"C:\\Users\\User\\git\\finalProject\\AMS\\src\\main\\webapp\\resources\\upload\\hw_professor"; // 업로드 주소
				File dir = new File(rootUploadDir);

				if (!dir.exists()) { // 업로드 디렉토리가 존재하지 않으면 생성
					dir.mkdirs();
				}

				Iterator<String> iterator = request.getFileNames(); // 업로드된 파일정보 수집(2개 - file1,file2)

				int fileLoop = 0;
				String uploadFileName;
				MultipartFile mFile = null;
				String orgFileName = ""; // 진짜 파일명
				String sysFileName = ""; // 변환된 파일명

				ArrayList<String> list = new ArrayList<String>();

				while (iterator.hasNext()) {
					fileLoop++;

					uploadFileName = iterator.next();
					mFile = request.getFile(uploadFileName);

					orgFileName = mFile.getOriginalFilename();
					System.out.println(orgFileName);

					if (orgFileName != null && orgFileName.length() != 0) { // sysFileName 생성
						System.out.println("if문 진입");
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMDDHHmmss-" + fileLoop);
						Calendar calendar = Calendar.getInstance();
						sysFileName =orgFileName; // sysFileName: 날짜-fileLoop번호
						try {
							System.out.println("try 진입");
							mFile.transferTo(new File(dir + File.separator + sysFileName)); // C:/Upload/sysFileName
							list.add("원본파일명: " + orgFileName + ", 시스템파일명: " + sysFileName);

						} catch (Exception e) {
							list.add("파일 업로드 중 에러발생!!!");
						}
					} // if
				} // while
				vo.setRegisterFile(sysFileName); //파일명저장
	
	
				service.hwPfInsert(vo);
		return "redirect:hwPfInsert";
	}
	
	@RequestMapping(value="hwSubmitDel", method=RequestMethod.PUT)
	@ResponseBody
	public int hwSubmitDel(@RequestBody HwProfessorVO vo) {
		int result=service.hwSubmitDel(vo);
		System.out.println("결과=========="+result);
		return 0;
	}
	
	
	
	
	//학생 제출한과제 전체삭제
	@RequestMapping("submitDelAll")
	public String submitDelAll(HwProfessorVO vo) {
		
		service.submitDelAll(vo);
		return "redirect:hwList"; 
	}
	
	
	
	//교수가 등록한 과제삭제
	@RequestMapping("hwPfDelete")
	public String hwPfDelete(HwProfessorVO vo) {
		int r=service.hwPfDelete(vo);
		if(r!=0) {
			System.out.println("success");
		}else {
			System.out.println("fail");
		}
		return "redirect:hwList";
	}
	
	@RequestMapping("hwUpdate")
	public String hwUpdate(HwProfessorVO vo,MultipartHttpServletRequest request,Model model){
		
		
		//파일업로드
		String rootUploadDir = "C:\\Users\\User\\git\\finalProject\\AMS\\src\\main\\webapp\\resources\\upload\\hw_professor"; // 업로드 주소
		File dir = new File(rootUploadDir);

		if (!dir.exists()) { // 업로드 디렉토리가 존재하지 않으면 생성
			dir.mkdirs();
		}

		Iterator<String> iterator = request.getFileNames(); // 업로드된 파일정보 수집(2개 - file1,file2)

		int fileLoop = 0;
		String uploadFileName;
		MultipartFile mFile = null;
		String orgFileName = ""; // 진짜 파일명
		String sysFileName = ""; // 변환된 파일명

		ArrayList<String> list = new ArrayList<String>();

		while (iterator.hasNext()) {
			fileLoop++;

			uploadFileName = iterator.next();
			mFile = request.getFile(uploadFileName);

			orgFileName = mFile.getOriginalFilename();
			System.out.println(orgFileName);

			if (orgFileName != null && orgFileName.length() != 0) { // sysFileName 생성
				System.out.println("if문 진입");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMDDHHmmss-" + fileLoop);
				Calendar calendar = Calendar.getInstance();
				sysFileName =vo.getRegisterId()+'_'+orgFileName; // sysFileName: 날짜-fileLoop번호
				try {
					System.out.println("try 진입");
					mFile.transferTo(new File(dir + File.separator + sysFileName)); // C:/Upload/sysFileName
					list.add("원본파일명: " + orgFileName + ", 시스템파일명: " + sysFileName);

				} catch (Exception e) {
					list.add("파일 업로드 중 에러발생!!!");
				}
			} // if
		} // while
		vo.setRegisterFile(sysFileName); //파일명저장
		
		int r=service.hwUpdate(vo);
		return "redirect:hwList";
	}
	

	
}
