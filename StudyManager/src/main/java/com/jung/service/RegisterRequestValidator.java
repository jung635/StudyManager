package com.jung.service;

import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.jung.domain.MemberBean;

@Service
public class RegisterRequestValidator implements Validator{
	@Inject
	private MemberService service;
	
	private static final String emailRegExp = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	private static final String passRegExp = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~,!,@,#,$,*,(,),=,+,_,.,|]).{8,20}$";
	private static final String idRegExp = "^(?=.*[a-zA-Z])(?=.*[0-9]).{5,10}$";

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberBean.class.isAssignableFrom(clazz); //�Ķ���ͷ� ���� clazzŸ���� ��ü�� MemberBeanŬ ���⼭�� supports() �޼��带 ������� ������
		//Ŭ������ Ÿ�� ��ȯ�� �������� Ȯ��. 
		//���⼭�� supports()�޼��带 ��� �������� 
		//������ MVC�� �ڵ����� ������ �����ϵ��� �����ϴ� ��� supports()�޼��带 �ùٸ��� �������־�� �Ѵ�.
	}

	@Override
	public void validate(Object target, Errors errors){
		MemberBean mb = (MemberBean)target;
		
		if(mb.getEmail()==null || mb.getEmail().trim().isEmpty()){
			errors.rejectValue("email", "required");
		}else if(!Pattern.matches(emailRegExp, mb.getEmail())){
			 errors.rejectValue("email", "bad");
		}
		
		if(mb.getId()==null || mb.getId().trim().isEmpty()){
			errors.rejectValue("id", "required");
		}else if(!Pattern.matches(idRegExp, mb.getId())){
			 errors.rejectValue("id", "bad");
		}else{
			try {
				if(service == null){
					System.out.println("null");
				}
				else{
					if(!service.dupIdCheck(mb.getId())) errors.rejectValue("id", "duplicate");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(mb.getPass()==null || mb.getPass().trim().isEmpty()){
			errors.rejectValue("pass", "required");
		}else{
			if(!Pattern.matches(passRegExp, mb.getPass())) errors.rejectValue("pass", "bad");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pass", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "required");
	}


}
