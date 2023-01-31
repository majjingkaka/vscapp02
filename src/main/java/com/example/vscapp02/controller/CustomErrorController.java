// package com.example.vscapp01.controller;

// import org.springframework.boot.web.servlet.error.ErrorController;
// import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;

// //https://gilu-world.tistory.com/107 [Spring + Vue.js] 새로고침 에러
// @Controller
// public class CustomErrorController implements ErrorController{
//     private final Logger logger = LoggerFactory.getLogger(this.getClass());
//     private final String ERROR_PATH = "/error";

//     @GetMapping(ERROR_PATH)
//     public String redirectRoot(){
//         logger.debug("redirectRoot...");
//         return "index.html";
//     }

//     public String getErrorPath(){
//         logger.debug("getErrorPath...");
//         return null;
//     }
// }
