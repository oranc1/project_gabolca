package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.CarMapper;
import com.itwillbs.project_gabolcar.vo.CarVO;
import com.itwillbs.project_gabolcar.vo.PageInfo;

@Service
public class CarService {
	@Autowired
	private CarMapper mapper;
	
	public int carRegister(CarVO car) {
		return mapper.registerCar(car);
	}
	
	public List<Map<String, Object>> carList() {
		return mapper.selectCarList(null,null);
	}
	
	public List<Map<String, Object>> carList(Map<String,Object> map) {
		PageInfo pageInfo = null;
		if(map != null) {			
			pageInfo = (PageInfo)map.get("pageInfo");
		}
		// mybatis 에서 사칙연산 자제해야됨으로 임시로 map 파라미터에 넣기
		map.put("pageItemStart", pageInfo.getNowPage() * pageInfo.getPageListLimit());
		return mapper.selectCarList(pageInfo,map);
	}
	
	public Map<String, Object> carSelect(CarVO car) {
		return mapper.selectCar(car);
	}

	public int carUpdate(Map<String, String> map) {
		return mapper.updateCar(map);
	}

	public int carDelete(int car_idx) {
		return mapper.deleteCar(car_idx);
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

	public int carOptionRegister(CarVO car) {
		return mapper.insertCarOption(car);
	}
}
