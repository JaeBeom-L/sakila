package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Actor;
import com.gd.sakila.vo.Page;

@Mapper
public interface ActorMapper {
	int insertActor(Actor actor);
	int selectActorTotal(String searchWord);
	int deleteActorsByFilmActor(int FID);
	int insertActorsByFilmActor(Map<String, Object> map);
	List<Map<String, Object>> selectActorsByActorId(int FID);
	List<Map<String, Object>> selectActorInfoList(Page page);
}
