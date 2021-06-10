package com.gd.sakila.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {
	int updateAmount(Map<String, Object> map);
	int insertPayment(Map<String, Object> map);
	List<Map<String, Object>> selectSumPayment(int year);
	List<Map<String, Object>> selectLastMonthBestStaff(Map<String, Object> map);
}
