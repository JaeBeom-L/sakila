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
import com.gd.sakila.service.FilmService;
import com.gd.sakila.vo.FilmForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class FilmController {
	@Autowired FilmService filmService;
	
	@GetMapping("/modifyFilm")
	public String modifyFilm(Model model, @RequestParam(value="filmId", required = true) int filmId) {
		log.debug(Debuging.DEBUG+" filmId : "+filmId);
		
		Map<String, Object> filmOneMap = filmService.getFilmOne(filmId);
		Map<String, Object> map = filmService.selectMap();
		
		model.addAttribute("filmId", filmId);
		model.addAttribute("filmOneMap", filmOneMap);
		model.addAttribute("categoryList", map.get("categoryList"));
		return "modifyFilm";		
	}
	
	@PostMapping("/modifyFilm")
	public String modifyFilm(FilmForm filmForm) {
		log.debug(Debuging.DEBUG+" filmForm : "+filmForm);
		
		filmService.modify(filmForm);
		
		return "redirect:/admin/getFilmOne?FID="+filmForm.getFilm().getFilmId();
	}
	
	@GetMapping("/addFilm")
	public String addFilm(Model model) {
		Map<String, Object> map = filmService.selectMap();
		log.debug(Debuging.DEBUG+" controller에서 map : "+map);
		
		model.addAttribute("categoryList", map.get("categoryList"));
		model.addAttribute("languageList", map.get("languageList"));
		
		return "addFilm";
	}
	
	@PostMapping("/addFilm")
	public String addFilm(FilmForm filmForm) {
		log.debug(Debuging.DEBUG+" filmForm : "+filmForm);
		
		int filmId = filmService.addFilm(filmForm); // 등록한 film의 filmId
		return "redirect:/admin/getFilmOne?FID="+filmId;
	}
	
	@GetMapping("/getFilmOne")
	public String getFilmOne(Model model, @RequestParam(value="FID", required = true) int FID) {
		log.debug(Debuging.DEBUG+" FID : "+FID);
		
		Map<String, Object> getFilmOneMap = filmService.getFilmOne(FID);
		int fisrtStoreFilmCount = filmService.getFilmCount(FID, 1);
		int secondStoreFilmCount =filmService.getFilmCount(FID, 2); 
		
		log.debug(Debuging.DEBUG+" getFilmOneMap : "+getFilmOneMap);
		log.debug(Debuging.DEBUG+" fisrtStoreFilmCount : "+fisrtStoreFilmCount);
		log.debug(Debuging.DEBUG+" secondStoreFilmCount : "+secondStoreFilmCount);
		
		model.addAttribute("getFilmOneMap", getFilmOneMap);
		model.addAttribute("fisrtStoreFilmCount", fisrtStoreFilmCount);
		model.addAttribute("secondStoreFilmCount", secondStoreFilmCount);
		
		return "getFilmOne";
	}
	
	@GetMapping("/getFilmList")
	public String getFlimList(Model model, @RequestParam(value="titleSearch" ,required = false) String titleSearch, 
											@RequestParam(value="category", required = false) String category,
											@RequestParam(value="price", required = false) String price,
											@RequestParam(value="rating", required = false) String rating,
											@RequestParam(value="actorSearch", required = false) String actorSearch,
											@RequestParam(value="currentPage", required = true, defaultValue = "1") int currentPage,
											@RequestParam(value="rowPerPage", required = true, defaultValue = "10") int rowPerPage) {
		log.debug(Debuging.DEBUG+" titleSearch : "+titleSearch);
		log.debug(Debuging.DEBUG+" category : "+category);
		log.debug(Debuging.DEBUG+" price : "+price);
		log.debug(Debuging.DEBUG+" currentPage : "+currentPage);
		log.debug(Debuging.DEBUG+" rowPerPage : "+rowPerPage);
		log.debug(Debuging.DEBUG+" rating : "+rating);
		log.debug(Debuging.DEBUG+" actorSearch : "+actorSearch);
		
		// 뷰에서 받아온 매개변수들을 서비스에 전달하기 위한 Map타입의 변수
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("price", price);
		map.put("titleSearch", titleSearch);
		map.put("currentPage", currentPage);
		map.put("rowPerPage", rowPerPage);	
		map.put("rating", rating);
		map.put("actorSearch", actorSearch);
		log.debug(Debuging.DEBUG+" map : "+map);
		
		Map<String, Object> serviceMap = filmService.getFilmList(map);
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);
		
		model.addAttribute("getFilmList", serviceMap.get("getFilmList"));
		model.addAttribute("price", serviceMap.get("price"));
		model.addAttribute("category", serviceMap.get("category"));
		model.addAttribute("rating", serviceMap.get("rating"));
		model.addAttribute("search", serviceMap.get("search"));
		model.addAttribute("titleSearch", serviceMap.get("titleSearch"));
		model.addAttribute("actorSearch", serviceMap.get("actorSearch"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", serviceMap.get("lastPage"));
		model.addAttribute("categoryList", serviceMap.get("categoryList"));
		
		return "getFilmList";
		
	}
}
