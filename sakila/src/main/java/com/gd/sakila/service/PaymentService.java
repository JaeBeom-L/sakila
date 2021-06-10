package com.gd.sakila.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.PaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class PaymentService {
	@Autowired PaymentMapper paymentMapper;
	
	public Map<String, Object> bestStaff(){
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		
		log.debug(Debuging.DEBUG+" map : "+map);
		
		Map<String, Object> bestStaff = paymentMapper.selectLastMonthBestStaff(map).get(0);
		log.debug(Debuging.DEBUG+" bestStaff : "+bestStaff);
		
		return bestStaff;
		
	}
}
