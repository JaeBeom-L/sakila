package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.ActorService;
import com.gd.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class ActorController {
	@Autowired ActorService actorService;
	
	
	@GetMapping("/addActor")
	public String addActor() {
		return "addActor"; 
	}
	
	@PostMapping("/addActor")
	public String addActor(Actor actor) {
		log.debug(Debuging.debug+" actor : "+actor);
		
		int row = actorService.addActor(actor);
		log.debug(Debuging.debug+" sucess add Actor row : "+row);
		
		return "redirect:/admin/getActorList";
	}
	
	@GetMapping("/getActorList")
	public String getActorList(Model model, @RequestParam(value="currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(value="searchWord", required = false) String searchWord) {
		log.debug(Debuging.debug+" currentPage : "+currentPage);
		log.debug(Debuging.debug+" rowPerPage : "+rowPerPage);
		log.debug(Debuging.debug+" searchWord : "+searchWord);
		
		// 서비스로 보내기 위한 매개변수들을 Map타입에 저장
		Map<String, Object> map = new HashMap<>();
		map.put("currentPage", currentPage);
		map.put("rowPerPage", rowPerPage);
		map.put("searchWord", searchWord);
		
		Map<String, Object> serviceMap = actorService.getActorList(map);
		log.debug(Debuging.debug+" serviceMap : "+serviceMap);
		
		model.addAttribute("actorList", serviceMap.get("list"));
		model.addAttribute("lastPage", serviceMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		
		
		return "getActorList";
	}
}
