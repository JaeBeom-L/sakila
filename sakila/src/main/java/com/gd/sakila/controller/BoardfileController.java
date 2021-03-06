package com.gd.sakila.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.BoardfileService;
import com.gd.sakila.vo.Boardfile;


import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/admin")
public class BoardfileController {
	@Autowired BoardfileService boardfileService;
	
	@GetMapping("/addBoardfile")
	public String addBoardfile(Model model, @RequestParam(value = "boardId", required = true) int boardId) {
		model.addAttribute("boardId", boardId);
		return "addBoardfile";
	}
	
	@PostMapping("/addBoardfile")
	public String addBoard(MultipartFile multipartFile, @RequestParam(value = "boardId", required = true) int boardId) {
		log.debug(Debuging.DEBUG+" multipartFile : "+multipartFile);
		log.debug(Debuging.DEBUG+" boardId : "+boardId);
		
		boardfileService.addBoardfile(multipartFile, boardId);
		return "redirect:/admin/getBoardOne?boardId="+boardId;
	}
	
	@GetMapping("/removeBoardfile")
	public String removeBoardfile(Boardfile boardfile) {
		log.debug(Debuging.DEBUG+" remove boardfileId : "+boardfile.getBoardfileId());
		log.debug(Debuging.DEBUG+" remove boardId : "+boardfile.getBoardId());
		boardfileService.removeBoardfileOne(boardfile);
		
		return "redirect:/admin/getBoardOne?boardId="+boardfile.getBoardId();
	}
}
