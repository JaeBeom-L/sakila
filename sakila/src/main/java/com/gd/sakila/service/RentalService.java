package com.gd.sakila.service;

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
	
	public void addRentalAndPayment(Map<String, Object> map) {
		log.debug(Debuging.DEBUG+" map : "+map);
		
		int rentalRow = rentalMapper.insertRental(map);
		int paymentRow = paymentMapper.insertPayment(map);
		
		log.debug(Debuging.DEBUG+" rentalRow : "+rentalRow+" paymentRow : "+paymentRow);
	}
	
	public void modifyReturnDate(int inventoryId) {
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);
		
		rentalMapper.returnFilm(inventoryId);
	}
}
