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
import com.gd.sakila.service.FilmService;
import com.gd.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class InventoryController {
	@Autowired InventoryService inventoryService;
	@Autowired FilmService filmService;
	
	@GetMapping("/addInventory")
	public String addInventory(Model model, int filmId) {
		log.debug(Debuging.DEBUG+" filmId : "+filmId);
		
		Map<String, Object> getFilmOneMap = filmService.getFilmOne(filmId);
		log.debug(Debuging.DEBUG+" getFilmOneMap : "+getFilmOneMap);
		
		model.addAttribute("getFilmOneMap", getFilmOneMap);
		
		return "addInventory";
		
	}
	
	@PostMapping("/addInventory")
	public String addInventory(Model model, @RequestParam(value="filmId", required = true) int filmId,
											@RequestParam(value="storeId", required = true) int storeId,
											@RequestParam(value="count", required = true) int count) {
		log.debug(Debuging.DEBUG+" filmId : "+filmId);
		log.debug(Debuging.DEBUG+" storeId : "+storeId);
		log.debug(Debuging.DEBUG+" count : "+count);
		
		Map<String, Object> map = new HashMap<>();
		map.put("filmId", filmId);
		map.put("storeId", storeId);
		map.put("count", count);
		
		inventoryService.addInventory(map);
				
		return "redirect:/admin/getInventoryList";
	}
	
	@RequestMapping("/getRentalListByInventoryId")
	public String getRentalListByInventoryId(Model model, int inventoryId, String title) {
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);
		
		List<Map<String, Object>> rentalList = inventoryService.getRentalListByInventoryId(inventoryId);
		log.debug(Debuging.DEBUG+" rentalList : "+rentalList);
		
		model.addAttribute("rentalList", rentalList);
		model.addAttribute("inventoryId", inventoryId);
		model.addAttribute("title", title);
		
		return "getRentalListByInventoryId";
	}
	
	@RequestMapping("/getInventoryList")
	public String getInventoryList(Model model, @RequestParam(value="storeId", required = false) String storeId,
												@RequestParam(value="inventoryId", required = false) String inventoryId,
												@RequestParam(value="searchWord", required = false) String searchWord,
												@RequestParam(value="currentPage", required = true, defaultValue = "1") int currentPage,
												@RequestParam(value="rowPerPage", required = true, defaultValue = "10") int rowPerPage) {
		log.debug(Debuging.DEBUG+" storeId : "+storeId);
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);
		log.debug(Debuging.DEBUG+" searchWord : "+searchWord);
		log.debug(Debuging.DEBUG+" currentPage : "+currentPage);
		log.debug(Debuging.DEBUG+" rowPerPage : "+rowPerPage);
		
		Map<String, Object> controllerMap = new HashMap<>();
		controllerMap.put("storeId", storeId);
		controllerMap.put("inventoryId", inventoryId);
		controllerMap.put("searchWord", searchWord);
		controllerMap.put("currentPage", currentPage);
		controllerMap.put("rowPerPage", rowPerPage);
		
		Map<String, Object> serviceMap = inventoryService.getInventoryList(controllerMap);
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);
		
		model.addAttribute("inventoryList", serviceMap.get("inventoryList"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", serviceMap.get("lastPage"));
		model.addAttribute("searchWord", serviceMap.get("searchWord"));
		model.addAttribute("storeId", serviceMap.get("storeId"));
		model.addAttribute("inventoryId", serviceMap.get("inventoryId"));
		
		
		return "getInventoryList";
	}
}
