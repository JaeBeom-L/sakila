package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface RentalMapper {
	List<Map<String, Object>> selectLastMonthBestFilmList(Map<String, Object> map);
	List<Map<String, Object>> selectCountRental(int year);
	List<Integer> selectOverlapInventoryId(int inventoryId);
	int insertRental(Map<String, Object> map);
	int returnFilm(int inventoryId);
	List<Integer> selectRentalId(int inventoryId);
}
