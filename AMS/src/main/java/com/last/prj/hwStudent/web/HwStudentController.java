package com.last.prj.hwStudent.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.last.prj.hwStudent.service.HwStudentService;
import com.last.prj.hwStudent.service.HwStudentVO;

@Controller
public class HwStudentController {

	@Autowired
	HwStudentService service;
	
	@RequestMapping("hwStudent")
	public String hwStudent(Model model,HwStudentVO vo,HttpSession session) {
		vo.setSid((String) session.getAttribute("id"));

		List<Map<String, Object>> result =service.hwSLectureList(vo);
		//수강중인 강의목록 
		model.addAttribute("result",result);
		return "hw_student/hw_StudentMain.tiles";
	}
	
	@RequestMapping("hwSelect")
	public String hwSelectList(Model model,HwStudentVO vo,HttpSession session) {
		vo.setSid((String) session.getAttribute("id"));

		
	
		//해당강의 과제조회
		List<Map<String, Object>> result =service.hwsSelectList(vo);
		model.addAttribute("result",result);
		return "hw_student/hw_SelectList.tiles";
	}
	
	//해당강의 과제 제출페이지
	@RequestMapping("hwSInsert")
	public String hwSInsert(HwStudentVO vo,Model model) {
			System.out.println(vo.getOpennum());
			System.out.println(vo.getRegisterId());
			
			
			List<Map<String, Object>> result = service.hwSOneSelect(vo);
			System.out.println(result);
			model.addAttribute("result",result);
		return "hw_student/hw_InsertForm.tiles";
	}
	
	
	//학생 과제 제출 폼
	@RequestMapping("hwSSubmit")
	public String hwSSubmit(HwStudentVO vo,Model model,HttpSession session,MultipartHttpServletRequest request) {
		vo.setSubmitSid((String) session.getAttribute("id"));
		vo.setSid((String) session.getAttribute("id"));
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
		vo.setSubmitFile(sysFileName); //파일명저장
		
		int result= service.hwSSubmit(vo);
		
		return "redirect:submitList";
	}
	
	
	@RequestMapping("deleteHwS")
	public String deleteHwS(HwStudentVO vo,Model model,HttpSession session) {
	vo.setSid((String) session.getAttribute("id"));

			int r=service.deleteHwS(vo);
			
			//해당강의 과제 제출
			List<Map<String, Object>> result = service.hwSOneSelect(vo);
			System.out.println(result);
			model.addAttribute("result",result);
			
		return "hw_student/hw_InsertForm.tiles";
	}
	
	@RequestMapping("submitList")
	public String submitList(HwStudentVO vo,Model model,HttpSession session) {
		vo.setSid((String) session.getAttribute("id"));
		List<Map<String, Object>> result =service.hwSAllList(vo);
			model.addAttribute("result",result);
		return "hw_student/hw_SubmitList.tiles";
	}
	
	
	
	
}
