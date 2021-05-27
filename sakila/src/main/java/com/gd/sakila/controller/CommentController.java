package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.Debuging;
import com.gd.sakila.service.CommentService;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class CommentController {
	@Autowired
	CommentService commentService;
	
	// 댓글 입력 컨트롤러(POST)
	@PostMapping("/addComment")
	public String addComent(Comment comment, @RequestParam(value="boardId", required = true) int boardId) {
		//디버깅 코드
		log.debug(Debuging.DEBUG+" comment : "+comment.toString());
		
		int addCommentRow = commentService.addComment(comment); // 	댓글 성공하면 1, 실패시 0	
		log.debug(Debuging.DEBUG+" addCommentRow : "+addCommentRow);//디버깅 코드
		
		return "redirect:/admin/getBoardOne?boardId="+boardId; // 입력 후 있던 boardOne페이지로 돌아간다.
	}
	
	// 댓글 삭제 컨트롤러(GET)
	@GetMapping("/removeComment")
	public String removeComment(@RequestParam(value="commentId", required = true) int commentId, @RequestParam(value="boardId", required = true) int boardId) {
		//디버깅 코드
		log.debug(Debuging.DEBUG+" commentId: "+commentId);
		
		int removeCommentRow = commentService.removeComment(commentId);	// 삭제 성공시 1, 실패시 0
		log.debug(Debuging.DEBUG+" removeCommentRow : " +removeCommentRow);	//디버깅 코드
		
		return "redirect:/admin/getBoardOne?boardId="+boardId; // 삭제 후 있던 boardOne페이지로 돌아간다.
	}
}
