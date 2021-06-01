package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.AddressMapper;
import com.gd.sakila.mapper.CustomerMapper;
import com.gd.sakila.vo.Address;
import com.gd.sakila.vo.Customer;
import com.gd.sakila.vo.CustomerForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	@Autowired AddressMapper addressMapper;
	
	public void addCustomer(CustomerForm customerForm) {
		log.debug(Debuging.DEBUG+" customerForm : "+customerForm);
		
		Address address = customerForm.getAddress();
		log.debug(Debuging.DEBUG+" address : "+address);
		addressMapper.insertAdress(address);
		
		int addressId = customerForm.getAddress().getAddressId();
		log.debug(Debuging.DEBUG+ " addressId : "+addressId);
		
		Customer customer = customerForm.getCustomer();
		customer.setAddressId(addressId);
		log.debug(Debuging.DEBUG+" customer : "+customer);
		
		customerMapper.insertCustomer(customer);
		
	}
	
	public void modifyCustomerActiveByScheduler() {
		log.debug(Debuging.DEBUG+" 고객 활동상태 수정 스케줄러 실행");
		int row = customerMapper.updateCustomerActiveByScheduler();
		log.debug(Debuging.DEBUG+" 스케줄러 수정 된 고객 수 : "+row);
	}
	
	public Map<String, Object> getCustomerOne(int customerId){
		log.debug(Debuging.DEBUG+" customerId : "+customerId);
		Map<String, Object> getCustomerOne = customerMapper.selectCustomerOne(customerId);
		List<Map<String, Object>> getRentalListByCustomerId = customerMapper.selectRentalListByCustomerId(customerId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("getCustomerOne", getCustomerOne);
		map.put("getRentalListByCustomerId", getRentalListByCustomerId);
		
		return map;
	}
	
	public Map<String, Object> getCustomerList(Map<String, Object> controllerMap){
		log.debug(Debuging.DEBUG+" map : "+controllerMap);
		int currentPage = (Integer)controllerMap.get("currentPage");
		int rowPerPage = (Integer)controllerMap.get("rowPerPage");
		int beginRow = (currentPage-1)*rowPerPage;
		int totalRow = customerMapper.selectCustomerTotal(controllerMap);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage++;
		}
		
		int storeId = (Integer)controllerMap.get("storeId");
		String searchWord = (String)controllerMap.get("searchWord");
		if(searchWord == "") {
			searchWord = null;
		}
		
		Map<String, Object> serviceMap = new HashMap<>();
		serviceMap.put("currentPage", currentPage);
		serviceMap.put("rowPerPage", rowPerPage);
		serviceMap.put("beginRow", beginRow);
		serviceMap.put("storeId", storeId);
		serviceMap.put("searchWord", searchWord);
		serviceMap.put("lastPage", lastPage);
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);
		
		List<Map<String, Object>> customerList = customerMapper.selectCustomerList(serviceMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("customerList", customerList);
		map.put("lastPage", lastPage);
		log.debug(Debuging.DEBUG+" map : "+map);
		
		return map;
		
	}
}
