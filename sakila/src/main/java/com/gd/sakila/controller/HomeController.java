package com.gd.sakila.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	@GetMapping({"/", "/home", "/index"})
	public String home() {
		// 디버깅코드
		log.debug("home");
		return "home";
	}
	
}
