package com.last.prj.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "imgUpload", urlPatterns = { "/imgUpload" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 10 * 5)
public class ImageUpload extends HttpServlet {
	private static final String UPLOAD_DIR = "students";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 업로드 경로
		String uploadPath = getServletContext().getRealPath("/resources/image") + File.separator + UPLOAD_DIR;
		// getServlet().getRealPath("") 단점
		// - 애플리케이션 배포하다가 기존 서버를 clean하면 업로드폴더가 싹 날라감
		// - 절대경로로 지정해서 업로드하는게 안전함
		// - 수정, 배포가 잦은 경우에는 절대경로를 지정해야함.
		
		System.out.println("======================이미지 업로드실행========================");

		File uploadDir = new File(uploadPath);

		// 경로 없으면 mkdir로 생성
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		
		try {
			String fileName = "";
			for (Part part : req.getParts()) { // req.getParts() : Multipart데이터들을 Part객체로 리턴
				System.out.println(part.getHeader("content-disposition")); // part마다 header 있음
				if (fileName != null) { // !폼필드경우 && !파일아예업로드 안했을 때
					part.write(uploadPath + File.separator + fileName); // 파일 저장
					System.out.println("파일명 : " + fileName + "저장완료!!!");
					System.out.println("경로 : " + uploadPath + File.separator + fileName);
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		System.out.println("파라미터 값 : " + req.getParameter("sender"));
		
		
		
		resp.setContentType("text/html");
		resp.getWriter().println("업로드 완료...!!");
	} // doPost()

	/**
	 * Param객체 파싱하여 파일이름 추출하기
	 * 
	 * @param part
	 * @return 파일명 : 파일명이 존재하지 않으면 null (폼필드 데이터)
	 */
	// 헤더 예시
	// form-data; name="multiPartServlet"; filename="git command.txt"
	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 2, content.length() - 1);
			}
		}
		return null; // filename이 없는 경우 (폼필드 데이터인 경우):
	}
}
