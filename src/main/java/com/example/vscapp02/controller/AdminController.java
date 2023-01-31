package com.example.vscapp02.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @GetMapping("/a1")
    public String a1(){
        logger.debug("a1...");


        return "index.html";
    }
}
