package com.last.prj.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class ImageUpload {
	public static Map<String, String> uploadTest(MultipartHttpServletRequest request) {
		// 업로드 주소
		String rootUploadDir = request.getSession().getServletContext().getRealPath("/resources/img/students");

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

		Map<String, String> map = new HashMap<String, String>();

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
					mFile.transferTo(new File(dir + File.separator + orgFileName)); // 업로드경로/파일이름
					map.put("sysName", sysFileName);

				} catch (Exception e) {
					map.put("error", "업로드 에러발생!!!");
				}
			} // if
		} // while

		if (map.get("error") == null || map.get("error") == "") {
			System.out.println("원본이름=========== " + map.get("orgName"));
			System.out.println("시스템이름========== " + map.get("sysName"));
			System.out.println("경로============== " + rootUploadDir);
		}
		map.put("path", rootUploadDir);
		
		return map;
	}
}
