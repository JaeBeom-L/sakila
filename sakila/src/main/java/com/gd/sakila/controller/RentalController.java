package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.RentalService;
import com.gd.sakila.service.StaffService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class RentalController {
	@Autowired RentalService rentalService;
	@Autowired StaffService staffService;
	
	@GetMapping("/addRental")
	public String addRentalAndPayment(Model model, int customerId, @RequestParam(value="storeId", required = false) int storeId) {
		log.debug(Debuging.DEBUG+" customerId : "+customerId);
		
		List<Map<String, Object>> staffList = staffService.getStaffList(storeId);
		
		model.addAttribute("customerId", customerId);
		model.addAttribute("staffList", staffList);
		
		return "addRental";
	}
	
	@PostMapping("/addRental")
	public String addRentalAndPayment(@RequestParam(value="customerId", required = true) int customerId,
										@RequestParam(value="staffId", required = true) int staffId,
										@RequestParam(value="inventoryId", required = true) int inventoryId,
										@RequestParam(value="amount", required = true) double amount) {
		log.debug(Debuging.DEBUG+" customerId : "+customerId);
		log.debug(Debuging.DEBUG+" staffId : "+staffId);
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);
		log.debug(Debuging.DEBUG+" amount : "+amount);
		
		int overlapRow = rentalService.overlapInventoryId(inventoryId);
		if(overlapRow != 0) {
			return "addRental";
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("customerId", customerId);
		map.put("staffId", staffId);
		map.put("inventoryId", inventoryId);
		map.put("amount", amount);
		
		rentalService.addRentalAndPayment(map);
		
		return "redirect:/admin/getInventoryList";
		
	}
	
	@GetMapping("/modifyReturnDate")
	public String modifyReturnDate(int inventoryId, double amount, double overdue) {
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);
		log.debug(Debuging.DEBUG+" amount : "+amount);
		log.debug(Debuging.DEBUG+" overdue : "+overdue);
		
		Map<String, Object> map = new HashMap<>();
		map.put("inventoryId", inventoryId);
		map.put("amount", amount);
		map.put("overdue", overdue);
		
		rentalService.modifyReturnDate(map);
		
		return "redirect:/admin/getInventoryList?inventoryId="+inventoryId;
	}
}
