package com.gd.sakila.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.BoardForm;
import com.gd.sakila.vo.Boardfile;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	@Autowired BoardfileMapper boardfileMapper;
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
		//1. 게시글 삭제
		int boardRow = boardMapper.deleteBoard(board);
		log.debug(Debuging.debug+" remove BoardRow : "+boardRow);
		if(boardRow == 0) {  // 게시글 삭제 실패시 0으로 리턴하고 메서드를 끝낸다.
			return 0;
		}
		//2. 댓글 삭제
		int commentRow = commentMapper.deleteCommentByBoardId(board.getBoardId());
		log.debug(Debuging.debug+" remove CommentRow : "+commentRow);
		
		//3. 물리적 파일 삭제(/resource/안에 파일)
		List<Boardfile> boardfileList = boardfileMapper.selectBoardfileByBoardId(board.getBoardId());
		if(boardfileList != null) {
			for(Boardfile f : boardfileList) {
				File temp = new File(""); // 프로젝트 폴더에 빈파일 생성
				String path = temp.getAbsolutePath();// 빈 파일의 경로를 얻어 path 변수에 저장(프로젝트 폴더의 경로가 저장)
				File file = new File(path+"\\src\\main\\webapp\\resource\\"+f.getBoardfileName());
				file.delete();
			}
		}
				
		//4. 파일 테이블 행 삭제
		int boardfileRow = boardfileMapper.deleteBoardfileByBoardId(board.getBoardId());
		log.debug(Debuging.debug+" remove boardfileRow : "+boardfileRow);
		
		return commentRow+boardRow+boardfileRow;
	}
	
	
	// board 등록 서비스
	public void addBoard(BoardForm boardForm) {
		//디버깅 코드
		log.debug(Debuging.debug+" boardForm : "+boardForm);
		
		//1) 
		Board board = boardForm.getBoard(); // boardId 값이 null
		boardMapper.insertBoard(board); // 입력시 만들어진 key값을 리턴받아야 한다. -> 리턴받을수 없다. -> 매개변수 board의 boardId값을 변경해준다.
		
		//2-1)
		List<MultipartFile> list = boardForm.getBoardfile();
		if(list != null) {
			for(MultipartFile f : list) {
				Boardfile boardfile = new Boardfile(); // Boardfile 객체생성
				
				boardfile.setBoardId(board.getBoardId()); // auto increment로 입력된 값
				
				String originalFilename = f.getOriginalFilename(); // list의 받아 온 파일의 원래 파일 이름을 저장
				int p = originalFilename.lastIndexOf(".");	// 파일 이름과 확장자를 구분 짓는 . 의 위치 인덱스 값을 저장
				String ext = originalFilename.substring(p).toLowerCase(); // originalfilename에서 확장자를 추출하고 소문자로 변경
				String prename = UUID.randomUUID().toString().replace("-", ""); // 파일이름 중복방지를 위해 uuid를 이용하여 식별 후 문자로 변환 그리고 - 를 없앤다.
				String filename = prename+ext; // filename변수에 파일명+확장자를 더해 저장
				
				boardfile.setBoardfileName(filename); // boardfile에 filename 저장				
				boardfile.setBoardfileSize(f.getSize()); // boardfile에 파일 크기 저장
				boardfile.setBoardfileType(f.getContentType()); // boardfile에 파일 타입을 저장
				
				log.debug(Debuging.debug+" boardfile : "+boardfile);// 디버깅 코드
				boardfileMapper.insertBoardfile(boardfile);// boardfile 정보를 저장
				
				//2-2) 파일을 저장
				
				try {
					File file = new File(""); // 프로젝트 폴더에 빈파일 생성
					String path = file.getAbsolutePath();// 빈 파일의 경로를 얻어 path 변수에 저장(프로젝트 폴더의 경로가 저장)
					
					f.transferTo(new File(path+"\\src\\main\\webapp\\resource\\"+filename)); // list의 각 파일을 지정한 주소에 저장
				} catch (Exception e) {
					throw new RuntimeException(); // 파일을 저장하다 오류가 나면 컴파일이 안되는 다른 예외 대신 런타임 예외를 일부러 발생시켜 컴파일 되게 한다.
				}
			}		
		}		
	}
	
	//boardOne 자세히보기, 댓글목록 서비스
	public Map<String, Object> getBoardOne(int boardId) {
		//디버깅 코드
		log.debug(Debuging.debug+" boardId : "+boardId);
		//1. 상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);	
		//2. 파일 리스트
		List<Boardfile> boardfileList = boardfileMapper.selectBoardfileByBoardId(boardId);
		log.debug(Debuging.debug+" boardfileList : "+boardfileList);
		//3. 댓글 목록
		log.debug(Debuging.debug+" map : "+boardMap);
		List<Comment> commentList =commentMapper.selectCommentListByBoard(boardId);
		log.debug(Debuging.debug+" list size() :" + commentList.size());

		Map<String, Object> map = new HashMap<>();
		map.put("boardMap", boardMap);
		map.put("boardfileList", boardfileList);
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
		
		List<Map<String, Object>> boardList = boardMapper.selectBoardList(page);  // controller에서 받아온 매개변수로 boardList 생성
		
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
