package com.gd.sakila.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {
	int updateAmount(Map<String, Object> map);
	int insertPayment(Map<String, Object> map);
}
