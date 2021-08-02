package com.last.prj;

import java.net.InetAddress;
import java.net.UnknownHostException;

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
	public String home() {
		try {
			InetAddress inetAddress = InetAddress.getLocalHost();
			System.out.println(inetAddress.getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		
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
