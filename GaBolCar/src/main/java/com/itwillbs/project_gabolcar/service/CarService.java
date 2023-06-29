package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.project_gabolcar.mapper.CarMapper;
import com.itwillbs.project_gabolcar.vo.CarOptionVO;
import com.itwillbs.project_gabolcar.vo.CarVO;
import com.itwillbs.project_gabolcar.vo.PageInfo;

@Service
public class CarService {
	
	@Autowired
	private CarMapper mapper;
	
	// --------------------------------------차량등록, 수정, 삭제------------------------------------------------

	// 차량등록
	public int carRegister(CarVO car) {
		return mapper.registerCar(car);
	}
	
	// 차량삭제 - 차량옵션 삭제
	public int carOptionDelete(int car_idx) {
		return mapper.deleteCarOption(car_idx);
	}

	// 차량삭제 
	public int carDelete(int car_idx) {
		return mapper.deleteCar(car_idx);
	}
	
	// 차량등록 - 선택된 옵션이 있는 차량 검색
	public Map<String, Object> carSelect(CarVO car) {
		return mapper.selectCar(car);
	}
	
//	// 차량수정 폼 - 선택된 옵션이 있는 차량 검색
//	public Map<String, Object> carSelect(CarVO car) {
//		return mapper.selectCar(car);
//	}
	
	// 차량수정 폼
	public List<Integer> getSelectedOptionList(int car_idx) {
		return mapper.selectCarOptionList(car_idx);
	}
	
	
	// 차량 수정 
	public int carUpdate(CarVO car) {
		return mapper.updateCar(car);
	}
	
	// 차량수정 - 수정할 해당 차량 car_file1..6 배열로 들고오기
	public List<CarVO> selectCarfiles(CarVO car) {
		return mapper.selectCarFiles(car);
	}
	
	// 차량수정 - 기존에 선택된 옵션을 삭제합니다
	public int deleteCarOptionsByCarIdx(int car_idx) {
		return mapper.deletUpdateCarOption(car_idx);
		
	}
	
	// 차량수정 - 차량수정시 새로 옵션 넣기
	public int carUpdateOptionRegister(CarOptionVO carOption) {
	    return mapper.insertUpdateCarOption(carOption);
	}
	
	// 차량 등록 - 차에 옵션 등록 
	public int carOptionRegister(CarVO car) {
		return mapper.insertCarOption(car);
	}
	
	
	//차량 정보 조회
	public CarVO carInfo(int res_idx) {
		
		return mapper.selectDriver(res_idx);
	}
	
	
	// 차량 수정 차 파일 삭제
	public int removeBoardFile(CarVO car) {
		 return mapper.deleteCarFile(car);
	}
	
	
	// --------------------------------------------------------------------------------------------------------------

	
	
	// 차량리스트 조회
	public List<Map<String, Object>> carList(Map<String, Object> map) {
		PageInfo pageInfo = null;
		if(map.get("pageInfo") != null) {			
			pageInfo = (PageInfo)map.get("pageInfo");
			map.put("pageItemStart", pageInfo.getNowPage() * pageInfo.getPageListLimit());
		}
		
		return mapper.selectCarList(pageInfo,map);
	}
	
	
	public int optionRegister(String option_name, String option_image_url) {
        return mapper.registerOption(option_name, option_image_url);
	}

	public List<Map<String, Object>> optionList() {
		return mapper.selectOptionList();
	}

	public Map<String, Object> optionSelect(int option_idx) {
		return mapper.selectOption(option_idx);
	}

	public int deleteOptionFile(int option_idx) {
		return mapper.deleteOptionFile(option_idx);
	}

	public int optionUpdate(Map<String, Object> map) {
		return mapper.updateOption(map);
	}

	public int optionDelete(int option_idx) {
		return mapper.deleteOption(option_idx);
	}
	


	public List<Map<String, Object>> dsbCarStatus() {
		return mapper.dsbCarStatus();
	}

	public List<Map<String, Object>> dsbCarType() {
		return mapper.dsbCarType();
	}

	public List<Map<String, Object>> dsbBrcHoldStatus(List<Map<String, Object>> brcList) {
		return mapper.dsbBrcHoldStatus(brcList);
	}

	public List<CarOptionVO> carOptionList(CarOptionVO carOption) {
		return mapper.selectOptionCar(carOption);
	}


	public int isOptNameCheck(Map<String, String> map) {
		return mapper.selectOptCheck(map);
	}

	public List<Map<String, Object>> carList() {
		return mapper.selectUpdateCar();
	}

	public List<Integer> insertCar(List<Integer> collect) {
		
		return mapper.selectCarInfo(collect);
	}

	public List<CarVO> selectCarInfo(List<Integer> carIdxList) {
		
		return mapper.selectCarIdx(carIdxList);
	}

	public int getCarBrcNameCount(int brc_idx) {
		return mapper.selectCarBrcNameCount(brc_idx);
	}

	
	public CarVO carDetails(int car_idx) {
		// TODO Auto-generated method stub
        return mapper.carDetails(car_idx);

	}

	public int isCarNumberCheck(Map<String, String> map) {
		return mapper.selectCarCheck(map);
	}






	


		
//	    if (resultCarVO != null) {
//	        return resultCarVO.toString(); // CarVO에서 필요한 String 값을 가져옵니다.
//	    }
//	    return null;
	}



	




	


	
