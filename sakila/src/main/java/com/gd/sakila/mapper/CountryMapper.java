package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Country;

@Mapper
public interface CountryMapper {
	List<Country> selectCountry();
}
