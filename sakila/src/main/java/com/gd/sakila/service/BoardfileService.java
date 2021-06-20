package com.gd.sakila.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.vo.Boardfile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardfileService {
	@Autowired BoardfileMapper boardfileMapper;
	
	public int addBoardfile(MultipartFile multipartFile, int boardId) {
		log.debug(Debuging.DEBUG+" multipartFile : "+multipartFile);
		log.debug(Debuging.DEBUG+" boardId : "+boardId);
		
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		String ext = multipartFile.getOriginalFilename().substring(p).toLowerCase();
		String prename = UUID.randomUUID().toString().replace("-", "");
		
		Boardfile boardfile = new Boardfile();
			
		boardfile.setBoardId(boardId);
		boardfile.setBoardfileName(prename+ext);
		boardfile.setBoardfileSize(multipartFile.getSize());
		boardfile.setBoardfileType(multipartFile.getContentType());
		
		//1) db 입력
		int row = boardfileMapper.insertBoardfile(boardfile);
		
		//2) 물리적 파일 저장
		if(row == 1) {
			File temp = new File("");
			String path = temp.getAbsolutePath();
			File file = new File(path+"/home/ubuntu/tomcat9/webapps/file/"+prename+ext);
			try {
				multipartFile.transferTo(file);
			} catch (Exception e) {
				throw new RuntimeException();
			}
		}
		
		return row;
	}
	
	public void removeBoardfileOne(Boardfile boardfile) {
		log.debug(Debuging.DEBUG+" remove boardfileId : "+boardfile.getBoardfileId());
		
		//1) 물리적 파일 삭제
		File temp = new File("");
		String path = temp.getAbsolutePath();
		File file = new File(path+"/home/ubuntu/tomcat9/webapps/file/"+boardfile.getBoardfileName());
		if(file.exists()) {
			file.delete();
		}
		
		//2) db삭제
		int removeFileRow = boardfileMapper.deleteBoardfileOne(boardfile.getBoardfileId());
		log.debug(Debuging.DEBUG+"remove removeFileRow : "+removeFileRow);
		
	}
}
