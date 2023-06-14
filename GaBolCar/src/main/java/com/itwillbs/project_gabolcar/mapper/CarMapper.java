package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.project_gabolcar.vo.CarVO;

public interface CarMapper {

	// 차량 등록
	int registerCar(CarVO car);

	// 차량 리스트
	List<Map<String, Object>> selectCarList();

	// 차량 검색
	Map<String, Object> selectCar(int car_idx);

	// 차량 수정
	int updateCar(Map<String, String> map);

	// 차량 삭제
	int deleteCar(int car_idx);
	
	// 옵션 등록
	int registerOption(@Param("option_name") String option_name,@Param("option_image_url") String option_image_url);

	// 옵션 리스트
	List<Map<String, Object>> selectOptionList();
	
	// 옵션 검색
	Map<String, Object> selectOption(int option_idx);

	// 옵션 파일삭제
	int deleteOptionFile(int option_idx);

	// 옵션 수정
	int updateOption(Map<String, Object> map);

	// 옵션 삭제
	int deleteOption(int option_idx);
}
