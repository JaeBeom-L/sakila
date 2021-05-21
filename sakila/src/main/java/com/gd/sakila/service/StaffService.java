package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

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
	@Autowired StaffMapper staffMapper; // 의존성 주입 bean객체에 객체를 생성
	public Staff login(Staff staff) {
		log.debug(Debuging.debug+" staff : "+staff);
		return staffMapper.selectStaffByLogin(staff);
	}
	
	public List<Map<String, Object>> getStaffList(){
		List<Map<String, Object>> staffList = staffMapper.selectStaff();
		log.debug(Debuging.debug+" staffList : "+staffList);
		return staffList;
	}
}
