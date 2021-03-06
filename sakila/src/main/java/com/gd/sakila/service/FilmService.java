package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.mapper.LanguageMapper;
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.Film;
import com.gd.sakila.vo.FilmForm;
import com.gd.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	@Autowired CategoryMapper categoryMapper;
	@Autowired LanguageMapper languageMapper;
	
	public void modify(FilmForm filmForm) {
		log.debug(Debuging.DEBUG+" filmForm : "+filmForm);
		filmMapper.updateFilm(filmForm.getFilm());
		
		Map<String, Object> modifyCategoryMap = new HashMap<>();
		modifyCategoryMap.put("categoryId", filmForm.getCategory().getCategoryId());
		modifyCategoryMap.put("filmId", filmForm.getFilm().getFilmId());
		
		log.debug(Debuging.DEBUG+" category modify map : "+modifyCategoryMap);
		
		filmMapper.updateFilmCategory(modifyCategoryMap);
			
	}
	
	// addFilm에 category, language list 전달 서비스
	public Map<String, Object> selectMap(){
		List<Category> categoryList = categoryMapper.selectCategoryName();
		List<Language> languageList = languageMapper.selectLanguageName();
		
		Map<String, Object> map = new HashMap<>();
		map.put("categoryList", categoryList);
		map.put("languageList", languageList);
		log.debug(Debuging.DEBUG+" selectMap : "+map);
		
		return map;
		
	}
	
	// addFilm 서비스 입력한 filmId를 리턴
	public int addFilm(FilmForm filmForm) {
		log.debug(Debuging.DEBUG+" filmForm : "+filmForm);
		
		Film film = filmForm.getFilm();
		filmMapper.insertFilm(film); // filmId가 생성된 후 film.setFilmId호출
		
		Map<String, Object> map = new HashMap<>();
		map.put("categoryId", filmForm.getCategory().getCategoryId());
		map.put("filmId", film.getFilmId());
		
		log.debug(Debuging.DEBUG+" insertFilm map : "+map);
		
		filmMapper.insertFilmCategory(map);
		
		return film.getFilmId();
	}
	
	// FilmOne 출력 서비스
	public Map<String, Object> getFilmOne(int FID){
		log.debug(Debuging.DEBUG+" FID : "+FID);  // 디버깅 코드
		
		// FID에 맞는 정보를 Map타입 변수에 저장
		Map<String, Object> map = filmMapper.selectFilmOne(FID);
		log.debug(Debuging.DEBUG+" map : "+map);  // 디버깅 코드
		return map;
		
	}
	
	// FilmList 출력 서비스
	public Map<String, Object> getFilmList(Map<String, Object> controllerMap) {
		log.debug(Debuging.DEBUG+" getFilmList parm map : "+controllerMap); // 디버깅 코드
		
		int currentPage = (Integer)controllerMap.get("currentPage");
		int rowPerPage = (Integer)controllerMap.get("rowPerPage");
		
		// 아무런 파라미터가 넘겨오지 않으면 null값으로 치환해서 쿼리에서 null인식 할 수 있도록 지정
		String titleSearch = (String)controllerMap.get("titleSearch");
		if(titleSearch == "") {
			titleSearch = null;
		}
		String actorSearch = (String)controllerMap.get("actorSearch");
		if(actorSearch == "") {
			actorSearch = null;
		}
		String category = (String)controllerMap.get("category");
		if(category == "") {
			category = null;
		}
		String price = (String)controllerMap.get("price");
		if(price == "") {
			price = null;
		}
		String rating = (String)controllerMap.get("rating");
		if(rating == "") {
			rating = null;
		}			
		int beginRow = (currentPage-1)*rowPerPage;
		
		// 컨트롤러에서 받아온 파라미터들을 가공후 매퍼로 보내기 위해 Map 타입에 저장
		Map<String, Object> serviceMap = new HashMap<>();
		serviceMap.put("titleSearch", titleSearch);
		serviceMap.put("rowPerPage", rowPerPage);
		serviceMap.put("category", category);
		serviceMap.put("price", price);
		serviceMap.put("beginRow", beginRow);
		serviceMap.put("rating", rating);
		serviceMap.put("actorSearch", actorSearch);
		
		log.debug(Debuging.DEBUG+" serviceMap : "+serviceMap); // 디버깅 코드
		
		int totalRow = filmMapper.selectFilmTotal(serviceMap);
		int lastPage = totalRow/rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage++;
		}
		log.debug(Debuging.DEBUG+" totalRow : "+totalRow); // 디버깅 코드
		log.debug(Debuging.DEBUG+" lastPage : "+lastPage); // 디버깅 코드
		
		List<Map<String, Object>> getFilmList = filmMapper.getFilmList(serviceMap);
		log.debug(Debuging.DEBUG+" getFilmList : "+getFilmList); // 디버깅 코드
		
		List<Category> categoryList = categoryMapper.selectCategoryName();
		log.debug(Debuging.DEBUG+ " categoryList : "+categoryList); // 디버깅코드
		
		// 컨트롤러에서 사용하기 위한 맵
		Map<String, Object> map = new HashMap<>();
		map.put("getFilmList", getFilmList);
		map.put("lastPage", lastPage);
		map.put("category", category);
		map.put("price", price);
		map.put("titleSearch", titleSearch);
		map.put("actorSearch", actorSearch);
		map.put("rating", rating);
		map.put("categoryList", categoryList);
		
		return map;
		
	}
	
	// 가게 필름 재고 프로시저 서비스
	public int getFilmCount(int filmId, int storeId){
		log.debug(Debuging.DEBUG+" filmId : "+filmId); // 디버깅코드
		log.debug(Debuging.DEBUG+" sotreId : "+storeId); // 디버깅코드
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("filmId", filmId); // 프로시저 in 매개변수
		paramMap.put("storeId", storeId);//프로시저 in 매개변수
		int filmCount = 0;//프로시저 out 매개변수
		paramMap.put("filmCount", filmCount);
		
		List<Integer> list = filmMapper.selectFilmInStock(paramMap);// 프로시저 실행
		filmCount = (int) paramMap.get("filmCount");// 프로시저에서 out매개변수 filmCount 추출
		log.debug(Debuging.DEBUG+" filmCount :"+filmCount); // 디버깅코드
		log.debug(Debuging.DEBUG+" list :"+list); // 디버깅코드
		
		return filmCount;
	}
}
