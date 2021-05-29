package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class CustomerController {
	@Autowired CustomerService customerService;
	
	@GetMapping("/getCustomerOne")
	public String getCustomerOne(Model model, @RequestParam(value="customerId", required = true) int customerId) {
		log.debug(Debuging.DEBUG+" customerId : "+customerId);
		Map<String, Object> map = customerService.getCustomerOne(customerId);
		
		model.addAttribute("getCustomerOne", map.get("getCustomerOne"));
		model.addAttribute("getRentalListByCustomerId", map.get("getRentalListByCustomerId"));
		
		return "getCustomerOne";
	}
	
	@GetMapping("/getCustomerList")
	public String getCustomerList(Model model, @RequestParam(value="currentPage", defaultValue = "1") int currentPage,
												@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
												@RequestParam(value="storeId", required = false, defaultValue = "0") int storeId,
												@RequestParam(value="searchWord", required = false) String searchWord) {
		log.debug(Debuging.DEBUG+" currentPage : "+currentPage);
		log.debug(Debuging.DEBUG+" rowPerPage : "+rowPerPage);
		log.debug(Debuging.DEBUG+" storeId : "+storeId);
		log.debug(Debuging.DEBUG+" searchWord : "+searchWord);
		
		Map<String, Object> map = new HashMap<>();	
		map.put("currentPage", currentPage);
		map.put("rowPerPage", rowPerPage);
		map.put("storeId", storeId);
		map.put("searchWord", searchWord);
		
		Map<String, Object> serviceMap = customerService.getCustomerList(map); 
		log.debug(Debuging.DEBUG+" servieMap : "+serviceMap);
		
		
		model.addAttribute("customerList", serviceMap.get("customerList"));
		model.addAttribute("lastPage", serviceMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);		
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("storeId", storeId);
		
		return "getCustomerList";
	}
}
