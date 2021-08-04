package com.last.prj;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.last.prj.common.FileUpload;
import com.last.prj.students.service.StudentsService;
import com.last.prj.students.service.StudentsVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private StudentsService ssdao;

	@RequestMapping("home")
	public String home() {
		try {
			InetAddress inetAddress = InetAddress.getLocalHost();
			System.out.println(inetAddress.getHostAddress());
			System.out.println(inetAddress.getLocalHost());
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

	// 로그인페이지
	@RequestMapping("/goLogin")
	public String goLogin() {
		return "login/login";
	}

	// 패스워드 찾는페이지로 넘어가는거
	@RequestMapping("forgetPwd")
	public String forgetPwd() {
		return "login/forgetPwd";
	}

	// 인증번호 인증
	@RequestMapping("forgetPwdAut")
	public String forgetPwdAut(@RequestParam("email") String email, @RequestParam("sname") String sname, Model model) {
		Random random = new Random();
		String user = "dlrjatk2@gmail.com";
		String pwd = "!xotn71202703!";

		int num = random.nextInt(999999);
		String toEmail = email;
		String title = "[No.M] 비밀번호변경 인증 이메일 입니다.";
		String content = System.getProperty("line.separator") + "안녕하세요 " + sname + "님" + //
				System.getProperty("line.separator") + " No.M대학교 비밀번호 재설정 인증번호는 " + num + " 입니다." + //
				System.getProperty("line.separator"); //

		// SMTP 서버 정보를 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pwd);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			
			// 수신자 메일주소
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			// 메일 제목
			message.setSubject(title);
			// 메일 내용
			message.setText(content);
			// 메일 전송
			Transport.send(message);
			System.out.println("메일 전송 성공=====");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		model.addAttribute("num", num);

		return "login/forgetPwdAut";
	}

	// 이메일 학번 있는지 확인
	@RequestMapping("forgetChkEmail")
	@ResponseBody
	public StudentsVO chkEmail(@RequestParam("email") String email, @RequestParam("sid") String sid, StudentsVO vo) {
		vo.setSid(sid);
		vo.setEmail(email);

		return ssdao.chkSidEmail(vo);
	}
	
	// 비밀번호 변경페이지
	@RequestMapping("forgetPwdNew")
	public String forgetPwdNew() {
		return "login/forgetPwdNew";
	}
}
