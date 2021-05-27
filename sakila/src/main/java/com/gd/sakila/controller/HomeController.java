package com.gd.sakila.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	@Autowired StaffService staffService;
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping({"/", "/home", "/index"})
	public String home() {
		log.debug(Debuging.DEBUG+" view home"); //디버깅 코드
		return "home";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Staff staff) { // servlet 세션을 직접 사용, 컨트롤러 메서드의 매개변수는 DI 대상
		log.debug(Debuging.DEBUG+" staff : "+staff); //디버깅 코드
		
		Staff loginStaff = staffService.login(staff);
		log.debug(Debuging.DEBUG+" loginStaff : "+loginStaff); //디버깅 코드
		
		if(loginStaff != null) { // 로그인 시
			session.setAttribute("loginStaff", session); // new Staff();
		}
		return "redirect:/home"; // 로그인 후 다시 home으로 redirect
	}
}
