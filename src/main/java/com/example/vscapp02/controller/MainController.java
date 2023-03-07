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
        logger.debug("### MainController main call...");
        model.addAttribute("pageName", "");

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
        //logger.debug("Info");
        //logger.warn("Warn");
        //logger.error("Error");

        return "login";
    }

    @RequestMapping(path = "home")
    public String home(Model model) {
        logger.debug("home...");
        model.addAttribute("pageName", "home");
        return "home";
    }

    @RequestMapping(path = "login")
    public void login() {
        logger.debug("login...");
    }

    @RequestMapping(path = "loginFail")
    public void login_fail() {
        logger.debug("login_fail...");
    }

    @RequestMapping(path = "logout")
    public void logout() {
        logger.debug("logout...");
    }

    @RequestMapping(path = "use")
    public String use(Model model) {
        logger.debug("use...");
        model.addAttribute("pageName", "use");
        return "terms/use";
    }
}
