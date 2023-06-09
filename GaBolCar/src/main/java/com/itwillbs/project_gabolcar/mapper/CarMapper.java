package com.itwillbs.project_gabolcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_gabolcar.vo.*;

public interface CarMapper {
	
	// --------------------------------------차량등록, 수정, 삭제------------------------------------------------
	
	// 차량 등록
	int registerCar(CarVO car);
	
	// 차량 수정 폼 - 옵션 선택된 차량 검색
	Map<String, Object> selectCar(CarVO car);



	// 차량수정 - 수정할 해당 차량 car_file1..6 배열로 들고오기
	List<CarVO> selectCarFiles(CarVO car);
	
	// 차량수정 - 차량에 옵션 추가
	int insertUpdateCarOption(CarOptionVO carOption);
	
	// 차량 삭제
	int deleteCar(int car_idx);
	
	// 차량 등록 - 차에 옵션 등록 
	int insertCarOption(CarVO car);
	
	//	차량 수정 
	int updateCar(CarVO car);
	
	// 차에 등록된 옵션 삭제
	int deleteCarOption(int car_idx);
	
	// 차량 수정 - 등록된 파일 삭제
	int deleteCarFile(CarVO car);
	
	// --------------------------------------------------------------------------------------------------------------
	
	
	// 차량 수량 확인 (페이지 최대 항목 계산에 사용)
	int selectCarListCount(@RequestParam(required = false) Map<String,Object> map);
	
	// 차량 리스트
	List<Map<String, Object>> selectCarList(@RequestParam(required = false) @Param("pageInfo") PageInfo pageInfo,@RequestParam(required = false) @Param("map") Map<String, Object> resFindOption);
	
	// 차량수정 폼
	List<Integer> selectCarOptionList(int car_idx);
	
	// 옵션 등록
	int registerOption(@Param("option_name") String option_name,@Param("option_image_url") String option_image_url);

	// 옵션 리스트
	List<Map<String, Object>> selectOptionList();
	
	// 옵션 검색
	Map<String, Object> selectOption(int option_idx);

	// 옵션 파일삭제
	int deleteOptionFile(int option_idx);

	// 옵션 수정 - 옵션 이미지 수정
	int updateOption(Map<String, Object> map);

	// 옵션 삭제
	int deleteOption(int option_idx);


	List<Integer> selectCarIdxList();

	List<Map<String, Object>> dsbCarStatus();

	List<Map<String, Object>> dsbCarType();

	List<Map<String, Object>> dsbBrcHoldStatus(List<Map<String, Object>> brcList);
	
	// 차에 등록된 옵션 셀렉 
	List<CarOptionVO> selectOptionCar(CarOptionVO carOption);
	
	// 자동차 정보 조회
	int selectOptCheck(Map<String, String> map);
	
	
	// 차량 예약 - 
	CarVO selectDriver(int res_idx);

	List<Map<String, Object>> selectUpdateCar();

	List<Integer> selectCarInfo(List<Integer> collect);

	List<CarVO> selectCarIdx(List<Integer> carIdxList);

	int selectCarBrcNameCount(int brc_name);

	CarVO carDetails(int car_idx);

	int selectCarCheck(Map<String, String> map);
	
	// 차량수정 - 기존에 선택된 옵션을 삭제합니다

	int deletUpdateCarOption(int car_idx);
}

	





	

