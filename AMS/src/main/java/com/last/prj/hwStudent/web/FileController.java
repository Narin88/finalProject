package com.last.prj.hwStudent.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileController {
	
	@RequestMapping(value="fileDownload")
	public void fileDownload( HttpServletResponse response, HttpServletRequest request, @RequestParam Map<String, String> paramMap) {
	 
	    String path = paramMap.get("filePath"); //full경로
	    String fileName = paramMap.get("fileName"); //파일명
	 
	    File file = new File(path);
	 
	    FileInputStream fileInputStream = null;
	    ServletOutputStream servletOutputStream = null;
	 
	    try{
	        String downName = null;
	        String browser = request.getHeader("User-Agent");
	        //파일 인코딩
	        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
	            
	            downName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
	            
	        }else{
	            
	            downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	            
	        }
	        
	        response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary;");
	 
	        fileInputStream = new FileInputStream(file);
	        servletOutputStream = response.getOutputStream();
	 
	        byte b [] = new byte[1024];
	        int data = 0;
	 
	        while((data=(fileInputStream.read(b, 0, b.length))) != -1){
	            
	            servletOutputStream.write(b, 0, data);
	            
	        }
	 
	        servletOutputStream.flush();//출력
	        
	    }catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	        if(servletOutputStream!=null){
	            try{
	                servletOutputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	        if(fileInputStream!=null){
	            try{
	                fileInputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	    }
	}
}	
