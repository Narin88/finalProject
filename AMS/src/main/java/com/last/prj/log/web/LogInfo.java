package com.last.prj.log.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class LogInfo {
	public static Map<String, String> getInfo(HttpServletRequest req) {
		String ip = req.getHeader("X-FORWARED_FOR");
		String browser = req.getHeader("User-Agent");
		String referer = req.getHeader("REFERER");

		// proxy 환경일 경우
		if (ip == null || ip.length() == 0) {
			ip = req.getHeader("Proxy-Client-IP");
		}

		// 웹로직 서버일 경우
		if (ip == null || ip.length() == 0) {
			ip = req.getHeader("Wl-Proxy-Client-IP");
		}

		if (ip == null || ip.length() == 0) {
			ip = req.getRemoteAddr();
		}

		// 브라우저 정보
		if (browser != null) {
			if (browser.indexOf("Trident") > -1) {
				browser = "MSIE";
			} else if (browser.indexOf("Chrome") > -1) {
				browser = "Chrome";
			} else if (browser.indexOf("Opera") > -1) {
				browser = "Opera";
			} else if (browser.indexOf("iPhone") > -1 && browser.indexOf("Mobile") > -1) {
				browser = "iPhone";
			} else if (browser.indexOf("Android") > -1 && browser.indexOf("Mobile") > -1) {
				browser = "Android";
			}
		}
		
		Map<String, String> info = new HashMap<String, String>();

		info.put("ip", ip);
		info.put("browser", browser);
		info.put("referer", referer);

		return info;
	}
}
