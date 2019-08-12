package com.khfinal.mvc.etc.util;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Service
//	Validator : 유효성 검사
public class FileValidator implements Validator {

	@Override
	//	해당 객체가 지원 가능한지 여부를 묻는 메서드
	public boolean supports(Class<?> arg0) {
		return false;
	}

	// 7-1. homecontroller에서 호출시 실행
	//	유효성 검사를 하는 실질적인 method
	@Override
	public void validate(Object uploadFile, Errors errors) {
		// 7-2. 업로드 파일 저장
		UploadFile file = (UploadFile) uploadFile;
		
		// 7-3. 만약 파일크기가 0이면 , 즉 업로드 파일이 없이 들어오면 에러 메시지 저장
		//	rejectValue : 에러 발생시 표현할 메시지들 (경로? , 에러코드(404,500 등)? , 메시지)
		if(file.getFile().getSize() == 0) {
			errors.rejectValue("file", "errorCode", 
					"Please select a file");
		}
	}
}
