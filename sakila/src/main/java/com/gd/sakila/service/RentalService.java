package com.gd.sakila.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.PaymentMapper;
import com.gd.sakila.mapper.RentalMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RentalService {
	@Autowired RentalMapper rentalMapper;
	@Autowired PaymentMapper paymentMapper;
	
	// 지난달 best film list 출력
	public List<Map<String, Object>> lastMonthBestFilm(){
		
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		
		log.debug(Debuging.DEBUG+" map : "+map);
		
		return rentalMapper.selectLastMonthBestFilmList(map);
	}
	
	//film rental 중복 검사
	public int overlapInventoryId(int inventoryId) {
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);// 디버깅 코드
		
		int overlapRow = rentalMapper.selectOverlapInventoryId(inventoryId).size();// 이미 빌려간 film이라면 1 재고가 있는 film이면 0
		
		return overlapRow;
	}
	
	// film대여 서비스
	public void addRentalAndPayment(Map<String, Object> map) {
		log.debug(Debuging.DEBUG+" map : "+map);
		
		int rentalRow = rentalMapper.insertRental(map); // rental table에 insert
		int paymentRow = paymentMapper.insertPayment(map);// payment table에 insert
		
		log.debug(Debuging.DEBUG+" rentalRow : "+rentalRow+" paymentRow : "+paymentRow);// 디버깅 코드
	}
	
	// film 반납 서비스
	public void modifyReturnDate(Map<String, Object> map) {
		log.debug(Debuging.DEBUG+" map : "+map);// 디버깅 코드
		
		List<Integer> rentalIdList = rentalMapper.selectRentalId((Integer)map.get("inventoryId")); //미반납이며 inventoryId에 맞는 rentalId 정보를 불러온다.
		int rentalId = rentalIdList.get(0);// rental테이블을 업데이트할 rentalId를 가져온다.
		log.debug(Debuging.DEBUG+" rentalId : "+rentalId);// 디버깅코드
		map.put("rentalId", rentalId);
		
		int rentalRow = rentalMapper.returnFilm((Integer)map.get("inventoryId"));// rental table에 return_date를 바꾼다.	
		int paymentRow = paymentMapper.updateAmount(map);// overdue에 따라 1일에 1$씩 더해서 변경
		
		log.debug(Debuging.DEBUG+" rentalRow : "+rentalRow+" paymentRow : "+paymentRow);// 디버깅코드
	}
}
