package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.RentalService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class RentalController {
	@Autowired RentalService rentalService;
	
	@GetMapping("/modifyReturnDate")
	public String modifyReturnDate(int inventoryId) {
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);
		
		rentalService.modifyReturnDate(inventoryId);
		
		return "redirect:/admin/getInventoryList?inventoryId="+inventoryId;
	}
}
