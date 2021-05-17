package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired
	BoardMapper boardMapper;
	@Autowired
	CommentMapper commentMapper;
	//
	
	//board 수정 서비스
	public int modifyBoard(Board board) {
		// 디버깅 코드
		log.debug(Debuging.debug+" modifyBoard board: "+board.toString());
		return boardMapper.updateBoard(board);
	}
	
	//board 삭제 서비스
	public int removeBoard(Board board) {
		// 디버깅 코드
		log.debug(Debuging.debug+" removeBoard board: "+board.toString());
		return boardMapper.deleteBoard(board);
	}
	
	
	// board 등록 서비스
	public int addBoard(Board board) {
		//디버깅 코드
		log.debug(Debuging.debug+" board : "+board);
		
		return boardMapper.insertBoard(board);
	}
	
	//boardOne 자세히보기, 댓글목록 서비스
	public Map<String, Object> getBoardOne(int boardId) {
		//디버깅 코드
		log.debug(Debuging.debug+" boardId : "+boardId);
		//1. 상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);	
		//2. 댓글 목록
		log.debug(Debuging.debug+"map : "+boardMap);
		List<Comment> commentList =commentMapper.selectCommentListByBoard(boardId);
		log.debug(Debuging.debug+"list size() :" + commentList.size());
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardMap", boardMap);
		map.put("commentList", commentList);
		return map;
	}
	
	// boardList 출력 서비스
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord){
		// 1. 
		int boardTotal = boardMapper.selectBoardTotal(searchWord); // 총 게시물 수(searchWord)
		int lastPage = boardTotal/rowPerPage;	// 마지막페이지
		if(boardTotal % rowPerPage != 0) { // rowPerPage에 딱 나눠 떨어지지 않으면 마지막페이지에 1을 더한다.
			lastPage ++;
		}
		
		//디버깅 코드
		log.debug(Debuging.debug+" boardToTal : "+boardTotal);
		log.debug(Debuging.debug+" lastPage : "+lastPage); 
		
		// 2.
		Page page = new Page(); // page 변수에 시작행, 찾는 단어, 보여줄 행의 수 탑재
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setSearchWord(searchWord);
		page.setRowPerPage(rowPerPage);
		
		List<Board> boardList = boardMapper.selectBoardList(page);  // controller에서 받아온 매개변수로 boardList 생성
	
		Map<String, Object> map = new HashMap<>(); // Map 타입의 map에 컨트롤러에 필요한 데이터 저장
		map.put("boardTotal", boardTotal);
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		
		// 디버깅 코드
		log.debug(Debuging.debug+" page : "+page);
		log.debug(Debuging.debug+" boardList : "+boardList);
		log.debug(Debuging.debug+" map : "+map);
			
		return map;
	}
	

}	
