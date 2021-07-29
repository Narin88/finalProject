package com.last.prj;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("home")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("serverTime", new Date());

		return "home";
	}

	@RequestMapping("uploadTest")
	public String uploadTest(MultipartHttpServletRequest request, Model model) {
		String rootUploadDir = "C:" + File.separator + "upload";

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
				sysFileName = simpleDateFormat.format(calendar.getTime()); // sysFileName: 날짜-fileLoop번호

				try {
					System.out.println("try 진입");
					mFile.transferTo(new File(dir + File.separator + sysFileName)); // C:/Upload/sysFileName
					list.add("원본파일명: " + orgFileName + ", 시스템파일명: " + sysFileName);

				} catch (Exception e) {
					list.add("파일 업로드 중 에러발생!!!");
				}
			} // if
		} // while
		
		for (String string : list) {
			System.out.println(string);
		}

		model.addAttribute("list", list);

		return "uploadTest";
	}

}
