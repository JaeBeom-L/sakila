package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.StaffService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class StaffController {
	@Autowired StaffService staffService;
	
	@GetMapping("/staffList")
	public String getStaffList(Model model, @RequestParam(value="staffSID", required = false) Integer staffSID) {
		List<Map<String, Object>> staffList = staffService.getStaffList(staffSID);
		log.debug(Debuging.debug+" staffList : "+staffList);
		model.addAttribute("staffList", staffList);
		return "staffList";
	}
}
