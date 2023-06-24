package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_gabolcar.vo.*;

public interface CarMapper {

	// 차량 등록
	int registerCar(CarVO car);

	// 차량 리스트
	List<Map<String, Object>> selectCarList(@RequestParam(required = false) @Param("pageInfo") PageInfo pageInfo,@RequestParam(required = false) @Param("map") Map<String, Object> resFindOption);
	
	// 차량 수량 확인 (페이지 최대 항목 계산에 사용)
	int selectCarListCount(@RequestParam(required = false) Map<String,Object> map);
	
	
	// 옵션 선택된 차량 검색
	Map<String, Object> selectCar(CarVO car);

	
	// 기존에 선택된 옵션을 삭제합니다
	int deletUpdateCarOption(int car_idx);

	// 옵션 수정 시 새로 옵션 추가
	int addCarOption(int car_idx, int option_idx);
	
	
	int insertUpdateCarOption(CarOptionVO carOption);
	
	
	
	
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


	List<Integer> selectCarIdxList();

	int insertCarOption(CarVO car);

//	 차량 수정
	int updateCar(CarVO car);

	List<Map<String, Object>> dsbCarStatus();

	List<Map<String, Object>> dsbCarType();

	List<Map<String, Object>> dsbBrcHoldStatus(List<Map<String, Object>> brcList);

	List<CarOptionVO> selectOptionCar(CarOptionVO carOption);
	
	// 자동차 정보 조회
	CarVO selectDriver(int res_idx);

	int selectOptCheck(Map<String, String> map);
	
	// 차에 등록된 옵션 삭제
	int deleteCarOption(int car_idx);
	
	//
	List<Integer> selectCarOptionList(int car_idx);


	

	
	
	//
//	int insertUpdateCarOption(CarOptionVO carOption);
	
	

}
