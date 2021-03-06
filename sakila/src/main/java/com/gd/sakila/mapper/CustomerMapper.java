package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Customer;

@Mapper
public interface CustomerMapper {
	int insertCustomer(Customer customer);
	int updateCustomerActiveByScheduler();
	int selectCustomerTotal(Map<String, Object> map);
	int selectRentalListByCustomerIdTotal(int customerId);
	Map<String, Object> selectCustomerOne(int customerId);
	List<Map<String, Object>> selectRentalListByCustomerId(Map<String, Object> map);
	List<Map<String, Object>> selectCustomerList(Map<String, Object> map);
}
