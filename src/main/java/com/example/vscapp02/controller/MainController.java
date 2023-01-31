package com.example.vscapp02.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController{
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public String main(HttpServletRequest request, Model model){
        logger.info("### MainController main call...");
        model.addAttribute("noticeHeaderList", "11");

        return "home";
    }
    
    /**
     * 로그인 폼
     * @return
    //  */
    @RequestMapping(path = "/login2", method = RequestMethod.GET)
    public String login2(){
        logger.debug("login2...index.html");

        //logger.trace("Trace");
        //logger.debug("Debug");
        //logger.info("Info");
        //logger.warn("Warn");
        //logger.error("Error");

        return "login";
    }

    @RequestMapping(path = "home")
    public String home() {
        logger.debug("home...");
        return "home";
    }

    @RequestMapping(path = "login")
    public String login() {
        logger.debug("login...index.html");
        return "login";
    }

    @RequestMapping(path = "loginFail")
    public void login_fail() {
    }

    @RequestMapping(path = "logout")
    public void logout() {
    }


}
