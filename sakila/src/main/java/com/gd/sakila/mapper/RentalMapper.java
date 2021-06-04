package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentalMapper {
	int returnFilm(int inventoryId);
}
