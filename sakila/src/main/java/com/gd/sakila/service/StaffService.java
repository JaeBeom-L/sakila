package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.AddressMapper;
import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.Address;
import com.gd.sakila.vo.Staff;
import com.gd.sakila.vo.StaffForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class StaffService {
	@Autowired StaffMapper staffMapper; // 의존성 주입 bean객체에 객체를 생성
	@Autowired AddressMapper addressMapper;
	
	public void addStaff(StaffForm staffForm) {
		log.debug(Debuging.DEBUG+" staffForm : "+staffForm);
		
		Address address = staffForm.getAddress();
		log.debug(Debuging.DEBUG+" address : "+address);
		addressMapper.insertAdress(address);
		
		int addressId = staffForm.getAddress().getAddressId();
		log.debug(Debuging.DEBUG+ " addressId : "+addressId);
		
		Staff staff = staffForm.getStaff();
		staff.setAddressId(addressId);
		log.debug(Debuging.DEBUG+" staff : "+staff);
		
		staffMapper.insertStaff(staff);
		
	}
	
	public Staff login(Staff staff) {
		log.debug(Debuging.DEBUG+" staff : "+staff);
		return staffMapper.selectStaffByLogin(staff);
	}
	
	public List<Map<String, Object>> getStaffList(Integer staffSID){
		List<Map<String, Object>> staffList = staffMapper.selectStaff(staffSID);
		log.debug(Debuging.DEBUG+" staffList : "+staffList);
		return staffList;
	}
}
