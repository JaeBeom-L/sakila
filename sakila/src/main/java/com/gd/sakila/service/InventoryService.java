package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.InventoryMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	
	public List<Map<String, Object>> getRentalListByInventoryId(int inventoryId){
		log.debug(Debuging.DEBUG+ " inventoryId : "+inventoryId);
		List<Map<String, Object>> rentalList = inventoryMapper.selectRentalListByInventoryId(inventoryId);
		
		return rentalList;
	}
	
	public Map<String, Object> getInventoryList(Map<String, Object> controllerMap){
		log.debug(Debuging.DEBUG+" controllerMap : "+controllerMap);
		
		int currentPage = (Integer)controllerMap.get("currentPage");
		int rowPerPage = (Integer)controllerMap.get("rowPerPage");
		int beginRow = (currentPage-1)*rowPerPage;
		
		
		String searchWord = (String)controllerMap.get("searchWord");
		log.debug(Debuging.DEBUG+" searchWord : "+searchWord);
		if(searchWord == "") {
			searchWord = null;
		}
		String storeId = (String)controllerMap.get("storeId");
		log.debug(Debuging.DEBUG+" storeId : "+storeId);
		if(storeId == "") {
			storeId = null;
		}
		String inventoryId = (String)controllerMap.get("inventoryId");
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);
		if(inventoryId == "") {
			inventoryId = null;
		}
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("rowPerPage", rowPerPage);
		map.put("beginRow", beginRow);
		map.put("searchWord", searchWord);
		map.put("storeId", storeId);
		map.put("inventoryId", inventoryId);
		log.debug(Debuging.DEBUG+" map : "+map);
		
		List<Map<String, Object>> inventoryList = inventoryMapper.selectInventoryList(map);
		
		int totalRow = inventoryMapper.selectInventoryTotal(map);
		log.debug(Debuging.DEBUG+" totalRow : "+totalRow);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage !=0) {
			lastPage++;
		}
		
		Map<String, Object> serviceMap = new HashMap<>();
		serviceMap.put("inventoryList", inventoryList);
		serviceMap.put("currentPage", currentPage);
		serviceMap.put("lastPage", lastPage);
		serviceMap.put("searchWord", searchWord);
		serviceMap.put("storeId", storeId);
		serviceMap.put("inventoryId", inventoryId);
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap);
		
		return serviceMap;
		
	}
}
