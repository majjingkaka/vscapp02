package com.example.vscapp02.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoController{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @RequestMapping(path = "/notice", method = RequestMethod.GET)
    public String notice(HttpServletRequest request, Model model){
        logger.info("### MainController notice call...");
        model.addAttribute("noticeHeaderList", "11");
        return "info/notice";
    }

    @RequestMapping(path = "/question", method = RequestMethod.GET)
    public String question(HttpServletRequest request, Model model){
        logger.info("### MainController question call...");
        model.addAttribute("noticeHeaderList", "11");
        return "info/question";
    }

    @RequestMapping(path = "/gallery", method = RequestMethod.GET)
    public String gallery(HttpServletRequest request, Model model){
        logger.info("### MainController gallery call...");
        model.addAttribute("noticeHeaderList", "11");
        return "info/gallery";
    }
}
