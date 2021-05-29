package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerMapper {
	int updateCustomerActiveByScheduler();
	int selectCustomerTotal(Map<String, Object> map);
	Map<String, Object> selectCustomerOne(int customerId);
	List<Map<String, Object>> selectRentalListByCustomerId(int customerId);
	List<Map<String, Object>> selectCustomerList(Map<String, Object> map);
}
