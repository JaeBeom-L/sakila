package com.gd.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gd.sakila.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SakilaScheduler {
	@Autowired CustomerService customerService;
	
	// Scheduled 메서드 void변환, 매개변수 0개
	@Scheduled(cron ="0 0 0 1 * *") // (cron = *:초, *:분, *:시, *:일, *:요일, *:월, *:년 이지만 생략 가능)
	public void modifyCustomerActive() {
		customerService.modifyCustomerActiveByScheduler();
		log.debug(Debuging.debug+"고객 활동사항 수정 스케줄러 실행");
	}
}
