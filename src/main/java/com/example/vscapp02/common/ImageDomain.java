package com.example.vscapp02.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;


@Service
public class ImageDomain {
    private static Logger logger = LoggerFactory.getLogger(ImageDomain.class);

    public static final String PROD_DOMAIN = "http://onyouclinic.cdn3.cafe24.com"; //http://onyouclinic.com
    public static final String DEV_DOMAIN = "http://localhost";
    public static final String LOCAL_DOMAIN = "http://localhost";

    private String domain;

    @Value("${spring.profiles.active}")
    private String profile;
    
    @Autowired
    private ConfigurableEnvironment env;

    @Autowired
    Environment environment;

    //http://www.baeldung.com/spring-profiles
    //-Dspring.profiles.active=dev

    @PostConstruct
    public void init() {
        //String profile = environment.getActiveProfiles()[0];
        //env.setActiveProfiles("dev");

        //String profile = environment.getActiveProfiles()[0];
        logger.info("init start activeprofile : "+ profile);

        if("dev".equals(profile)) {
            this.domain = DEV_DOMAIN;
        } else if("prod".equals(profile)) {
            this.domain = PROD_DOMAIN;
        }else if("local".equals(profile)) {
            this.domain = LOCAL_DOMAIN;
        }
    }

    public String getDomain() {
        return domain;
    }
}
