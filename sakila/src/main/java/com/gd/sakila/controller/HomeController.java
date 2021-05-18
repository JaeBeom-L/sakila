package com.gd.sakila.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.sakila.Debuging;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	@GetMapping({"/", "/home", "/index"})
	public String home() {
		// 디버깅코드
		log.debug(Debuging.debug+" view home");
		return "home";
	}
	
}
