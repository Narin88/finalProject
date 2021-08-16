package com.dbal.app.emp;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PwEncrypt {
	
	@Test
	public void bcryTest() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = encoder.encode("1234");
		
		if(BCrypt.checkpw("1234", result)) {
			System.out.println("맞다");
		}
	}
}
