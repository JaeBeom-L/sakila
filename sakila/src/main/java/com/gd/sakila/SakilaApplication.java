package com.gd.sakila;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;


@ServletComponentScan // servlet 컴포넌트 스캔을 위해 사용
@SpringBootApplication
@EnableScheduling // 스케줄링 사용하기 위해 사용
public class SakilaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
	}

}
