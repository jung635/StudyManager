package com.jung.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.jung.persistence.MemberDAO;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	@Inject
	MemberService service;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String user_id = (String)authentication.getPrincipal();
		String user_pass = (String)authentication.getCredentials();

		boolean isLogin = false;
		try {
			isLogin = loginCheck(user_id, user_pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Collection<? extends GrantedAuthority> authorities;
		
		if(user_id.equals("admin")){
			authorities = Collections.singleton(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}else{
			authorities = Collections.singleton(new SimpleGrantedAuthority("ROLE_USER"));
		}
		
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(user_id, user_pass, authorities);
		if(isLogin){
			result.setDetails(new CustomUserDetails(user_id, user_pass));
		}else{
			throw new UsernameNotFoundException("아이디나 비밀번호를 다시 확인해주세요");
		}
		
		
		return result;
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	public boolean loginCheck(String id, String pass) throws Exception{
		String encodedPass = service.getPass(id);
		boolean isLogin = service.matches(pass, encodedPass);
		
		return isLogin;
	}

}
