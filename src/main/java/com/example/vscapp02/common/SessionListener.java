// package com.example.vscapp02.common;

// //import org.slf4j.Logger;
// //import org.slf4j.LoggerFactory;
// import javax.servlet.http.HttpSessionEvent;
// import javax.servlet.http.HttpSessionListener;

// public class SessionListener implements HttpSessionListener {

//     //private Logger logger = LoggerFactory.getLogger(this.getClass());

//     @Override
//     public void sessionCreated(HttpSessionEvent se) {
//         se.getSession().setMaxInactiveInterval(60); //세션만료60분
//     }

//     @Override
//     public void sessionDestroyed(HttpSessionEvent se) {
//     }
// }