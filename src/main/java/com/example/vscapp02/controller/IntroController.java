package com.example.vscapp02.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroController{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @RequestMapping(path = "/greeting", method = RequestMethod.GET)
    public String greeting(HttpServletRequest request, Model model){
        logger.info("### MainController greeting call...");
        model.addAttribute("noticeHeaderList", "11");
        return "intro/greeting";
    }

    @RequestMapping(path = "/coding", method = RequestMethod.GET)
    public String coding(HttpServletRequest request, Model model){
        logger.info("### MainController coding call...");
        model.addAttribute("noticeHeaderList", "11");
        return "intro/coding";
    }

    @RequestMapping(path = "/education", method = RequestMethod.GET)
    public String education(HttpServletRequest request, Model model){
        logger.info("### MainController education call...");
        model.addAttribute("noticeHeaderList", "11");
        return "intro/education";
    }

    @RequestMapping(path = "/classplan", method = RequestMethod.GET)
    public String classplan(HttpServletRequest request, Model model){
        logger.info("### MainController classplan call...");
        model.addAttribute("noticeHeaderList", "11");
        return "intro/classplan";
    }

    @RequestMapping(path = "/Entreprise", method = RequestMethod.GET)
    public String Entreprise(HttpServletRequest request, Model model){
        logger.info("### MainController Entreprise call...");
        model.addAttribute("noticeHeaderList", "11");
        return "intro/Entreprise";
    }
}
