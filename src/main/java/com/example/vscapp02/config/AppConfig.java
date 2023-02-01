package com.example.vscapp02.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan(basePackages = {"com.example.vscapp02", "com.example.vscapp02.dto"},
        excludeFilters={
                @ComponentScan.Filter(type= FilterType.ANNOTATION, value= EnableWebMvc.class),
                @ComponentScan.Filter(type= FilterType.ANNOTATION, value= Configuration.class)
        })
public class AppConfig {
}
