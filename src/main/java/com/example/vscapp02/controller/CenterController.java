package com.example.vscapp02.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CenterController{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @RequestMapping(path = "/reference", method = RequestMethod.GET)
    public String reference(HttpServletRequest request, Model model){
        logger.info("### MainController reference call...");
        model.addAttribute("noticeHeaderList", "11");
        return "center/reference";
    }

}
