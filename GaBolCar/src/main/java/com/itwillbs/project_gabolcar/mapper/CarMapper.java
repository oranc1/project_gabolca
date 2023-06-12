package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

import com.itwillbs.project_gabolcar.vo.CarVO;

public interface CarMapper {

	int registerCarModel(CarVO car);

	int registerCar(CarVO car);
	
	List<Map<String, Object>> selectCarList();

	Map<String, Object> selectCar(int car_idx);

	int updateCar(Map<String, String> map);

	int deleteCar(int car_idx);
}
