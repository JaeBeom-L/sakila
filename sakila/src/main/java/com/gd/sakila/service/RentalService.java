package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.RentalMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RentalService {
	@Autowired RentalMapper rentalMapper;
	
	public void modifyReturnDate(int inventoryId) {
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);
		
		rentalMapper.returnFilm(inventoryId);
	}
}
