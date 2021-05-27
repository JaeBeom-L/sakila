package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.CustomerMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	public void modifyCustomerActiveByScheduler() {
		log.debug(Debuging.DEBUG+" 고객 활동상태 수정 스케줄러 실행");
		int row = customerMapper.updateCustomerActiveByScheduler();
		log.debug(Debuging.DEBUG+" 스케줄러 수정 된 고객 수 : "+row);
	}
}
