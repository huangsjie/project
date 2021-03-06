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

}
