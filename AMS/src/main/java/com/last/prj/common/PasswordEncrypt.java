package com.last.prj.common;

import static org.junit.Assert.assertTrue;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncrypt {

	public String bcryTest(String pwd) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(16);
		String result = encoder.encode(pwd);
		
		System.out.println(result);
		assertTrue(encoder.matches("myPassword", result));
		
		return result;
	}
}
