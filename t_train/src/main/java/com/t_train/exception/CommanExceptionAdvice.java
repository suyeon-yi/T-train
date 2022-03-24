package com.t_train.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

//자동 생성과 역할
@ControllerAdvice
@Log4j
public class CommanExceptionAdvice {

	//Exception 예외가 발생되면 가져와서 처리해 준다. - 500번 오류
	@ExceptionHandler(Exception.class)
	public String except(Exception ex, Model model) {
		
		//콘솔에 에러 메세지 출력
		log.error("///////////////////// 예외처리 ///////////////////");
		log.error("에러 메세지 : " + ex.getMessage());
		
		//jsp페이지로 예외를 전달하기 위해 model에 담는다.
		model.addAttribute("exception", ex);
		
		//model 출력
		log.error(model);
		
		//jsp로 이동
		return "/error/error_500";
	}
	
	//404번 오류
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		
		log.error("///////////////////// no Page(404) ///////////////////");
		log.error("요청한 페이지가 없음");
		
		return "error/error_404";
	}
}
