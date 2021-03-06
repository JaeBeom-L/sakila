package com.gd.sakila.restapi;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.Debuging;
import com.gd.sakila.mapper.CityMapper;
import com.gd.sakila.mapper.CountryMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.mapper.InventoryMapper;
import com.gd.sakila.mapper.PaymentMapper;
import com.gd.sakila.mapper.RentalMapper;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.Country;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RestApi {
	@Autowired CountryMapper countryMapper;
	@Autowired CityMapper cityMapper;
	@Autowired InventoryMapper inventoryMapper;
	@Autowired FilmMapper filmMapper;
	@Autowired RentalMapper rentalMapper;
	@Autowired PaymentMapper paymentMapper;
	
	
	
	@GetMapping("/sumPayment")
	public List<Map<String, Object>> sumPaymentList(@RequestParam(value="year", defaultValue = "2021") int year){
		log.debug(Debuging.DEBUG+" year : "+year);
		return paymentMapper.selectSumPayment(year);
	}
	
	@GetMapping("/countRental")
	public List<Map<String, Object>> countRentalList(@RequestParam(value="year", defaultValue = "2021") int year){
		log.debug(Debuging.DEBUG+" year : "+year);
		return rentalMapper.selectCountRental(year);
	}
	
	@GetMapping("/filmCategory")
	public List<Map<String, Object>> filmCategoryList(){
		return filmMapper.selectFilmCategoryList();
	}
	
	@GetMapping("/amount")
	public List<Map<String, Object>> amount(@RequestParam(value="inventoryId", required = true) int inventoryId){
		log.debug(Debuging.DEBUG+" inventoryId : "+inventoryId);
		
		return inventoryMapper.selectAmountByInventoryId(inventoryId);
	}
	
	@GetMapping("/country")
	public List<Country> country() {
		return countryMapper.selectCountry();
	}
	
	@GetMapping("/city")
	public List<City> city(@RequestParam(value = "countryId") int countryId) {
		log.debug(Debuging.DEBUG+" countryId : "+countryId);
		return cityMapper.selectCity(countryId);
	}

}
