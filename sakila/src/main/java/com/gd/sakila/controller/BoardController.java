package com.gd.sakila.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.BoardService;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.BoardForm;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@GetMapping("/modifyBoard")
	public String modifyBoard(Model model, @RequestParam(value = "boardId", required = true) int boardId) {
		// 디버깅코드
		log.debug(Debuging.DEBUG+" modifyBoard boardId : " + boardId);
		Map<String, Object> map = boardService.getBoardOne(boardId);
		model.addAttribute("boardMap", map.get("boardMap"));
		return "modifyBoard";
	}
	
	@PostMapping("/modifyBoard")
	public String modifyBoard(Board board) {
		log.debug(Debuging.DEBUG+" modifyBoard board : "+board);
		int row = boardService.modifyBoard(board);
		log.debug(Debuging.DEBUG+"modify row count : "+row);
		if(row == 1) {
			return "redirect:/admin/getBoardOne?boardId="+board.getBoardId();
		}
		return "redirect:/admin/modifyBoard?boardId="+board.getBoardId();
	}
	
	@GetMapping("/removeBoard")
	public String removeBoard(Model model, @RequestParam(value = "boardId", required = true) int boardId) {
		//디버깅 코드
		log.debug(Debuging.DEBUG+" boardId : "+boardId);
		
		model.addAttribute("boardId", boardId);
		return "removeBoard";
	}
	
	@PostMapping("/removeBoard")
	public String removeBoard(Board board) {
		int row = boardService.removeBoard(board);
		log.debug(Debuging.DEBUG+"remove row cnt : "+row);
		if(row >= 1 ) {
			return "redirect:/admin/getBoardList";
		}
		return "redirect:/admin/removeBoard?boardId="+board.getBoardId();
	}
	
	@GetMapping("/addBoard") // addBoard.jsp 페이지로 이동
	public String addBoard() {
		log.debug(Debuging.DEBUG+" addBoard");
		
		return "addBoard";
	}
	
	@PostMapping("/addBoard") // board 게시물 입력후 boardList로 redirect
	public String addBoard(BoardForm boardForm, HttpServletRequest request) { // 커맨드객체
		//디버깅 코드
		log.debug(" boardForm : "+boardForm);
		
		HttpSession session = request.getSession();
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		log.debug(Debuging.DEBUG+" session staffId : "+staffId);
		
		boardForm.getBoard().setStaffId(staffId);
		
		boardService.addBoard(boardForm);	

		return "redirect:/admin/getBoardList";
	}
	
	@GetMapping("/getBoardOne")
	public String getBoardOne(Model model, @RequestParam(value="boardId", required = true) int boardId, HttpServletRequest request) {
		// 디버깅 코드
		log.debug(" boardId : "+boardId); 
		
		HttpSession session = request.getSession();
		String username = ((Staff)(session.getAttribute("loginStaff"))).getUsername();
		log.debug(Debuging.DEBUG+" session username : "+username);
		
		Map<String, Object> map = boardService.getBoardOne(boardId);
		
		//디버깅 코드
		log.debug(Debuging.DEBUG+" map : "+map); 
		
		model.addAttribute("boardMap", map.get("boardMap"));
		model.addAttribute("commentList", map.get("commentList"));
		model.addAttribute("boardfileList", map.get("boardfileList"));
		model.addAttribute("username", username);
		
		return "getBoardOne";
	}
	
	
	@GetMapping("/getBoardList")
	public String getBoardList(Model model, @RequestParam(value="currentPage", defaultValue = "1" ) int currentPage, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage, @RequestParam(value="searchWord", required = false) String searchWord){		
		log.debug(Debuging.DEBUG+" currentPage : "+currentPage); // 디버깅코드
		log.debug(Debuging.DEBUG+" rowPerPage : "+rowPerPage); // 디버깅코드
		log.debug(Debuging.DEBUG+" searchWord : "+searchWord); // 디버깅코드
		
		Map<String, Object> map = boardService.getBoardList(currentPage, rowPerPage, searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardList", map.get("boardList"));
		
		//디버깅 코드
		log.debug(Debuging.DEBUG+" map : "+map);
		
		return "getBoardList";
	}
}
