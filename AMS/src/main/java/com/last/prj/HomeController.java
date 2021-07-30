package com.last.prj;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("home")
	public String home(Locale locale, Model model, HttpServletRequest req) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("serverTime", new Date());
		
		Map<String, String> map = LogInfo.getInfo(req);
		System.out.println(LogInfo.getInfo(req));
		LogVO vo = new LogVO();
		vo.setVisitIp(map.get("ip"));
		vo.setVisitAgent(map.get("browser"));
		
//		dao.insertLogger(vo);

		return "home";
	}

	@RequestMapping("uploadTest")
	public String uploadTest(MultipartHttpServletRequest request, Model model, TestVO vo) {
		FileUpload upload = new FileUpload();
		model.addAttribute("list", upload.uploadTest(request));
		System.out.println(vo);
		
		return "uploadTest";
	}
	
}
