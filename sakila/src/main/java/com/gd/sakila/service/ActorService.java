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
	// 영화 자세히 보기 페이지에서 배우 수정 서비스
	public void modifyFilmActor(int FID, int[] ck) {
		log.debug(Debuging.DEBUG+" FID : "+FID);
		log.debug(Debuging.DEBUG+" ck : "+ck.length);
		
		int deleteRow = actorMapper.deleteActorsByFilmActor(FID); // FID에 출연하는 배우 모두 삭제	
		int insertRow = 0;
		for(int i : ck) { // ck로 넘어온 actor_id를 FID에 맞는 출여하는 배우들을 다시 등록과정을 반복한다.
			Map<String, Object> map = new HashMap<>();
			map.put("FID", FID);
			map.put("actorId", i);
			
			insertRow = actorMapper.insertActorsByFilmActor(map);			
		}
		
		log.debug(Debuging.DEBUG+" deleteRow : "+deleteRow);
		log.debug(Debuging.DEBUG+" insertRow : "+insertRow);
		
	}
	 
	
	// 배우추가 페이지 배우 출력 서비스
	public List<Map<String, Object>> getActorsListForAdd(int FID){
		log.debug(Debuging.DEBUG+" FID : "+FID);
		
		List<Map<String, Object>> list = actorMapper.selectActorsByActorId(FID);
		log.debug(Debuging.DEBUG+" list : "+list);
		
		return list;
	}
	
	// 배우입력 서비스
	public int addActor(Actor actor) {
		log.debug(Debuging.DEBUG+" actor : "+actor);
		
		int row = actorMapper.insertActor(actor);
		log.debug(Debuging.DEBUG+" sucess add actor row : "+row);
		
		return row;
	}
	
	// 배우 리스트 출력 서비스
	public Map<String, Object> getActorList(Map<String, Object> controllerMap){
		log.debug(Debuging.DEBUG+" controllerMap : "+controllerMap); // 디버깅 코드
		
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
		log.debug(Debuging.DEBUG+" page : "+page);
		
		// actorService 이용하여 list 추출
		List<Map<String, Object>> list = actorMapper.selectActorInfoList(page);
		log.debug(Debuging.DEBUG+" list : "+list);
		
		// 컨트롤러에 전달 할 정보들을 Map 타입의 serviceMap 변수에 담아 저장
		Map<String, Object> serviceMap = new HashMap<>();
		serviceMap.put("list", list);
		serviceMap.put("lastPage", lastPage);
		
		
		return serviceMap;	
	}
}
