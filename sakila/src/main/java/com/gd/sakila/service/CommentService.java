package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CommentService {
	@Autowired
	CommentMapper commentMapper;
	
	// 댓글 입력 서비스
	public int addComment(Comment comment) {		
		log.debug(Debuging.DEBUG+" comment : "+comment);//디버깅 코드
		
		int addCommentRow = commentMapper.insertComment(comment);	// 	댓글 성공하면 1, 실패시 0	
		log.debug(Debuging.DEBUG+" addCommentRow : "+addCommentRow);//디버깅 코드
		
		return addCommentRow;
	}
	
	// 댓글 삭제 서비스
	public int removeComment(int commentId) {	
		log.debug(Debuging.DEBUG+" commentId : "+commentId);// 디버깅 코드
		
		int removeCommentRow = commentMapper.deleteCommentByCommentId(commentId); // 삭제 성공시 1, 실패시 0
		log.debug(Debuging.DEBUG+" removeCommentRow : "+removeCommentRow);// 디버깅 코드
		
		return removeCommentRow;
	}
}
