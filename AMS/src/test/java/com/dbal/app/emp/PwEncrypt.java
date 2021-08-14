package com.dbal.app.emp;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PwEncrypt {
	
	@Test
	public void bcryTest() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = encoder.encode("1234");
		
		System.out.println(result);
//		assertTrue(encoder.matches("myPassword", result));
	}
}
