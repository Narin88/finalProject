package com.last.prj;

	import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.last.prj.common.FileUpload;
import com.last.prj.log.service.LogService;
import com.last.prj.log.service.LogVO;
import com.last.prj.log.web.LogInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private LogService dao;

	@RequestMapping("home")
	public String home(HttpServletRequest req, @CookieValue(value="myCooke", required=false) String cookie) {
		Map<String, String> map = LogInfo.getInfo(req);
		LogVO vo = new LogVO();
		vo.setVisitIp(map.get("ip"));
		vo.setVisitAgent(map.get("browser"));
		vo.setVisitCookie(map.get("cookie"));
		
//		dao.insertLogger(vo);
		
		System.out.println(LogInfo.getInfo(req));
	
		Enumeration<String> em = req.getHeaderNames();
		while(em.hasMoreElements()) {
			String header = (String) em.nextElement();
			System.out.println(header + ": " + req.getHeader(header));
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
	
//	@RequestMapping("/goLogin")
//	public String goLogin() {
//		return "login/login";
//	}
	
}
