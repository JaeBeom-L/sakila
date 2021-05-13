package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.BoardService;
import com.gd.sakila.vo.Board;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@GetMapping("/addBoard") // addBoard.jsp 페이지로 이동
	public String addBoard() {
		return "addBoard";
	}
	
	@PostMapping("/addBoard") // board 게시물 입력후 boardList로 redirect
	public String addBoard(Board board) { // 커맨드객체
		boardService.addBoard(board);	
		return "redirect:/getBoardList";
	}
	
	@GetMapping("/getBoardOne")
	public String getBoardOne(Model model, @RequestParam(value="boardId", required = true) int boardId) {
		System.out.println(boardId+" BoardController-boardId"); // 디버깅코드		
		Map<String, Object> map = boardService.getBoardOne(boardId);
		model.addAttribute("map", map);
		return "getBoardOne";
	}
	
	
	@GetMapping("/getBoardList")
	public String getBoardList(Model model, @RequestParam(value="currentPage", defaultValue = "1" ) int currentPage, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage, @RequestParam(value="searchWord", required = false) String searchWord){		
		System.out.println(currentPage+" BoardController-currentPage"); // 디버깅코드
		System.out.println(rowPerPage+" BoardController-rowPerPage"); // 디버깅코드
		System.out.println(searchWord+" BoardController-searchWord"); // 디버깅코드
		
		Map<String, Object> map = boardService.getBoardList(currentPage, rowPerPage, searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardList", map.get("boardList"));
		
		return "getBoardList";
	}
}
