package com.example.vscapp02.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//servlet-context.xml을 대체한 파일
@Configuration
//@EnableWebMvc //스프링부트에서 안쓴다 제외시키기
//Spring Boot 의 고유기능을 사용하기 위해서는 @EnableWebMvc 는 사용하지 않습니다.
//@EnableWebMvc를 사용하면 Spring MVC를 사용하게 되어 직접 MVC 설정을 해주어야 한다는 의미입니다.
@ComponentScan(basePackages = {"com.example.vscapp02", "com.example.vscapp02.dto"})
public class WebConfig implements WebMvcConfigurer{
    
    // @Override
	// public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
	// 	configurer.enable();
	// }
    
    /*리소스 경로 추가*/
    @Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//registry.addResourceHandler("/resources/**").addResourceLocations("classpath:/resources/");
		registry.addResourceHandler("/**").addResourceLocations("classpath:/templates/", "classpath:/static/");
		registry.addResourceHandler("/plugins/**").addResourceLocations("classpath:/plugins/");
		registry.addResourceHandler("/dist/**").addResourceLocations("classpath:/dist/");
		registry.addResourceHandler("/m/**").addResourceLocations("classpath:/m/");
		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/images/");

        //registry.addResourceHandler("/images/**").addResourceLocations("/resources/images");
		//registry.addResourceHandler("/css/**").addResourceLocations("/resources/css");
		//registry.addResourceHandler("/js/**").addResourceLocations("/resources/js");
		//registry.addResourceHandler("/fonts/**").addResourceLocations("/resources/fonts");
	}

	// @Bean
	// public InternalResourceViewResolver resolver() {
	// 	InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	// 	resolver.setViewClass(JstlView.class);
	// 	resolver.setPrefix("/WEB-INF/views/");
	// 	resolver.setSuffix(".jsp");
	// 	return resolver;
	// }
    
    // @Bean
	// public InternalResourceViewResolver viewResolver() {
	// 	InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
	// 	viewResolver.setViewClass(JstlView.class);
	// 	viewResolver.setPrefix("/WEB-INF/views/");
	// 	viewResolver.setSuffix(".jsp");
	// 	viewResolver.setOrder(1);
	// 	return viewResolver;
	// }

    // @Bean
	// public MessageSource messageSource() {
	// 	ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
	// 	messageSource.setBasename("messages");
	// 	return messageSource;
	// }


	
}
