package com.gd.sakila.controller;

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
import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.StaffForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class StaffController {
	@Autowired StaffService staffService;
	
	@GetMapping("/addStaff")
	public String addStaff() {
		return "addStaff";
	}
	
	@PostMapping("/addStaff")
	public String addStaff(StaffForm staffForm) {
		log.debug(Debuging.DEBUG+" staffForm : "+staffForm);
		
		staffService.addStaff(staffForm);
		
		return "redirect:/admin/staffList";
	}
	
	@GetMapping("/staffList")
	public String getStaffList(Model model, @RequestParam(value="staffSID", required = false) Integer staffSID) {
		List<Map<String, Object>> staffList = staffService.getStaffList(staffSID);
		log.debug(Debuging.DEBUG+" staffList : "+staffList);
		model.addAttribute("staffList", staffList);
		model.addAttribute("staffSID",staffSID);
		return "staffList";
	}
}
