package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.ActorMapper;
import com.gd.sakila.vo.Actor;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActorService {
	@Autowired ActorMapper actorMapper;
	
	// 배우입력 서비스
	public int addActor(Actor actor) {
		log.debug(Debuging.debug+" actor : "+actor);
		
		int row = actorMapper.insertActor(actor);
		log.debug(Debuging.debug+" sucess add actor row : "+row);
		
		return row;
	}
	
	// 배우 리스트 출력 서비스
	public Map<String, Object> getActorList(Map<String, Object> controllerMap){
		log.debug(Debuging.debug+" controllerMap : "+controllerMap); // 디버깅 코드
		
		// 페이징 작업을 위한 현재 페이지, 보여줄 행, 시작 행, 총 행, 마지막 페이지 핸들링
		int currentPage = (Integer)controllerMap.get("currentPage");
		int rowPerPage = (Integer)controllerMap.get("rowPerPage");
		String searchWord = (String)controllerMap.get("searchWord");
		int beginRow = (currentPage-1)*rowPerPage;
		int total = actorMapper.selectActorTotal(searchWord);
		int lastPage = total/rowPerPage;
		if(total%rowPerPage != 0) {
			lastPage++;
		}
		
		// page 타입으로 넘겨서 페이징
		Page page = new Page();
		page.setBeginRow(beginRow);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		log.debug(Debuging.debug+" page : "+page);
		
		// actorService 이용하여 list 추출
		List<Map<String, Object>> list = actorMapper.selectActorInfoList(page);
		log.debug(Debuging.debug+" list : "+list);
		
		// 컨트롤러에 전달 할 정보들을 Map 타입의 serviceMap 변수에 담아 저장
		Map<String, Object> serviceMap = new HashMap<>();
		serviceMap.put("list", list);
		serviceMap.put("lastPage", lastPage);
		
		
		return serviceMap;	
	}
}
