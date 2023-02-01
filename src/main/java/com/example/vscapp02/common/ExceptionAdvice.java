package com.example.vscapp02.common;

import org.apache.velocity.exception.ResourceNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionAdvice {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@ExceptionHandler(value = {Exception.class, RuntimeException.class})
	public ModelAndView exception(Exception e) {

		logger.info("exception : ");
		//http://viralpatel.net/blogs/spring-mvc-exception-handling-controlleradvice-annotation/
		//https://blog.outsider.ne.kr/904

		ModelAndView mav = new ModelAndView("exception");
		mav.addObject("name", e.getClass().getSimpleName());
		mav.addObject("message", e.getMessage());

		return mav;
	}

	@ExceptionHandler(AuthenticationException.class)
	public ModelAndView AuthenticationException(AuthenticationException e) {

		logger.info("AuthenticationException : ");

		ModelAndView mav = new ModelAndView("exception");
		mav.addObject("name", e.getClass().getSimpleName());
		mav.addObject("message", e.getMessage());

		return mav;
	}

	@ExceptionHandler(UsernameNotFoundException.class)
	public ModelAndView UsernameNotFoundException(UsernameNotFoundException e) {

		logger.info("UsernameNotFoundException : ");

		ModelAndView mav = new ModelAndView("exception");
		mav.addObject("name", e.getClass().getSimpleName());
		mav.addObject("message", e.getMessage());

		return mav;
	}

	/*@ExceptionHandler(NoHandlerFoundException.class)*/
	@ResponseStatus(HttpStatus.NOT_FOUND)
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView NoHandlerFoundException(Exception ex) {

		logger.info("error404 : ");
		ModelAndView mav = new ModelAndView("exception");

		mav.addObject("name", "404");
		mav.addObject("message", "NOT_FOUND");

		return mav;
	}

	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ModelAndView serverErrorException(Exception ex) {

		logger.info("serverErrorException : ");
		ModelAndView mav = new ModelAndView("exception");

		mav.addObject("name", "500");
		mav.addObject("message", "serverErrorException");

		return mav;
	}

	@ExceptionHandler(ResourceNotFoundException.class)
	public ModelAndView handleMissingParameter() {

		logger.info("handleMissingParameter : ");
		ModelAndView mav = new ModelAndView("exception");

		mav.addObject("name", "404");
		mav.addObject("message", "NOT_FOUND");

		return mav;
	}

}
