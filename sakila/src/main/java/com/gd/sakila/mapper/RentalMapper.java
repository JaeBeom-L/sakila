package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Rental;

@Mapper
public interface RentalMapper {
	List<Integer> selectOverlapInventoryId(int inventoryId);
	int insertRental(Map<String, Object> map);
	int returnFilm(int inventoryId);
	List<Integer> selectRentalId(int inventoryId);
}
