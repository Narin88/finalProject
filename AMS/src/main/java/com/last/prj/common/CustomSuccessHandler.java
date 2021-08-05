package com.last.prj.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.last.prj.log.service.LogService;
import com.last.prj.log.web.LogInfo;

public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	@Autowired
	private LogService dao;

	public CustomSuccessHandler() {
	}

	public CustomSuccessHandler(String defaultTargetUrl) {
		setDefaultTargetUrl(defaultTargetUrl);
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		super.onAuthenticationSuccess(request, response, authentication);
		// 세션ID 등록
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		HttpSession session = request.getSession();
		
		session.setAttribute("id", userDetails.getUsername());

		// 로그입력
		Map<String, String> map = LogInfo.getInfo(request);
		LogVO vo = new LogVO();
		vo.setVisitId(userDetails.getUsername());
		vo.setVisitIp(map.get("ip"));
		vo.setVisitAgent(map.get("browser"));
		vo.setVisitCookie(map.get("cookie"));

		dao.insertLogger(vo);
		System.out.println(LogInfo.getInfo(request));
	}
}
