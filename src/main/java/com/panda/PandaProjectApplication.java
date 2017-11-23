package com.panda;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@MapperScan("com.panda.mapper")
public class PandaProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(PandaProjectApplication.class, args);
	}
	/**
	 * Java 8 lambda表达式 自定义 错误页面 实现方式
	 */
//	@Bean
//	public EmbeddedServletContainerCustomizer containerCustomizer() {
//		return (container -> {
//			ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/system/401");
//			ErrorPage error403Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/system/403");
//			ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/system/pageMissing");
//			ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/system/500");
//
//			container.addErrorPages(error401Page, error403Page, error404Page, error500Page);
//		});
//	}
	/**
	 * Java 7 内部类 自定义 错误页面 实现方式
	 */
//	@Bean
//	public EmbeddedServletContainerCustomizer containerCustomizer() {
//
//		return new EmbeddedServletContainerCustomizer() {
//			@Override
//			public void customize(ConfigurableEmbeddedServletContainer container) {
//
//				ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/401.html");
//				ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/404.html");
//				ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.html");
//
//				container.addErrorPages(error401Page, error404Page, error500Page);
//			}
//		};
//	}
}
