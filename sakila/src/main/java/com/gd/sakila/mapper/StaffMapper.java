package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Staff;

@Mapper // mapper.xml을 찾아서 메서드명과 mapper의 id명의 같으면 합쳐서 메서드를 구현 클래스 생성시 오버라이딩
public interface StaffMapper {
	Staff selectStaffByLogin(Staff staff);
	List<Map<String, Object>> selectStaff(Integer staffSID);
}
