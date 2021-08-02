package com.last.prj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.last.prj.common.FileUpload;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping("home")
	public String home(HttpServletRequest req, Model model, HttpSession session) {
		
		// 헤더 종류
//		Enumeration<String> em = req.getHeaderNames();
//		while(em.hasMoreElements()) {
//			String header = (String) em.nextElement();
//			System.out.println(header + ": " + req.getHeader(header));
//		}
		
		return "home";
	}

	@RequestMapping("uploadTest")
	public String uploadTest(MultipartHttpServletRequest request, Model model, TestVO vo) {
		FileUpload upload = new FileUpload();
		model.addAttribute("list", upload.uploadTest(request));
		System.out.println(vo);
		
		return "uploadTest";
	}
	
	@RequestMapping("/goLogin")
	public String goLogin() {
		return "login/login";
	}
	
}
