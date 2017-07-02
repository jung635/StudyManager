package com.jung.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class PasswordEncoding implements PasswordEncoder{

	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	@Override
	public String encode(CharSequence inputPass) {
		return passwordEncoder.encode(inputPass);
	}

	@Override
	public boolean matches(CharSequence inputPass, String encodedPass) {
		return passwordEncoder.matches(inputPass, encodedPass);
	}

}
