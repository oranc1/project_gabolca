package com.itwillbs.project_gabolcar.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class MyPasswordEncoder {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public String getCryptoPassword(String rawPassword) {
		String securePasswd = passwordEncoder.encode(rawPassword);
		
		return securePasswd;
	}
	
	public boolean isSameCryptoPassword(String rawPassword, String EncrytedPassword) {
		
		
		return passwordEncoder.matches(rawPassword, EncrytedPassword);
	}

}
