package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class StaffService {
	@Autowired // 의존성 주입 bean객체에 객체를 생성
	StaffMapper staffMapper;
	public Staff login(Staff staff) {
		log.debug(Debuging.debug+" staff : "+staff);
		return staffMapper.selectStaffByLogin(staff);
	}
	
}
