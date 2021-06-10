package com.gd.sakila.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.CommentService;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class CommentController {
	@Autowired
	CommentService commentService;
	
	// 댓글 입력 컨트롤러(POST)
	@PostMapping("/addComment")
	public String addComent(Comment comment, @RequestParam(value="boardId", required = true) int boardId, HttpServletRequest request) {
		//디버깅 코드
		log.debug(Debuging.DEBUG+" comment : "+comment.toString());
		
		HttpSession session = request.getSession();
		String username = ((Staff)(session.getAttribute("loginStaff"))).getUsername();
		log.debug(Debuging.DEBUG+" session username : "+username);
		
		comment.setUsername(username);
		
		int addCommentRow = commentService.addComment(comment); // 	댓글 성공하면 1, 실패시 0	
		log.debug(Debuging.DEBUG+" addCommentRow : "+addCommentRow);//디버깅 코드
		
		return "redirect:/admin/getBoardOne?boardId="+boardId; // 입력 후 있던 boardOne페이지로 돌아간다.
	}
	
	// 댓글 삭제 컨트롤러(GET)
	@GetMapping("/removeComment")
	public String removeComment(@RequestParam(value="commentId", required = true) int commentId, @RequestParam(value="boardId", required = true) int boardId, String username, HttpServletRequest request) {
		//디버깅 코드
		log.debug(Debuging.DEBUG+" commentId: "+commentId);
		
		HttpSession session = request.getSession();
		String sessionUsername = ((Staff)(session.getAttribute("loginStaff"))).getUsername();
		log.debug(Debuging.DEBUG+" session username : "+username);
		
		if(!sessionUsername.equals(username)) { // get방식으로 잘못된 접근 방지
			return "redirect:/admin/getBoardOne?boardId="+boardId;
		}
		
		int removeCommentRow = commentService.removeComment(commentId);	// 삭제 성공시 1, 실패시 0
		log.debug(Debuging.DEBUG+" removeCommentRow : " +removeCommentRow);	//디버깅 코드
		
		return "redirect:/admin/getBoardOne?boardId="+boardId; // 삭제 후 있던 boardOne페이지로 돌아간다.
	}
}
