package com.example.vscapp02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ExceptionController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @RequestMapping(value = "/hello")
	public String hello() throws IOException {
		
		// render hello.jsp page
		return "hello";
	}

    @RequestMapping(value = "/test")
	public String test() throws IOException {
		
		//just throw exception to test the exceptionhandler mapping
		if(true) {
			throw new IOException("this is io exception");
		}
		
		// render hello.jsp page
		return "hello";
	}

    // @RequestMapping(path = "/test", method = RequestMethod.GET)
    // public String notice(HttpServletRequest request, Model model){
    //     logger.debug("### MainController notice call...");
    //     model.addAttribute("noticeHeaderList", "11");
    //     return "info/notice";
    // }
}
