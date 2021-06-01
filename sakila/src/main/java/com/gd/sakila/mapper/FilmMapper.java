package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	List<Integer> selectFilmInStock(Map<String, Object> map);
	List<Map<String, Object>> getFilmList(Map<String, Object> map);
	Map<String, Object> selectFilmOne(int FID);
	int selectFilmTotal(Map<String, Object> map);
	int insertFilm(Film film);
	int insertFilmCategory(Map<String, Object> map);
	int updateFilm(Film film);
	int updateFilmCategory(Map<String, Object> map);
}
