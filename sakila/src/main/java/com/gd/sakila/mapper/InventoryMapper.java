package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Inventory;

@Mapper
public interface InventoryMapper {
	List<Double> selectAmountByInventoryId(int inventoryId);
	int insertInventory(Map<String, Object> map);
	List<Map<String, Object>> selectInventoryList(Map<String, Object> map);
	int selectInventoryTotal(Map<String, Object> map);
	List<Map<String, Object>> selectRentalListByInventoryId(int inventoryId);
}
