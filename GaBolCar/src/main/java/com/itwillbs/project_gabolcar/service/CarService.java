package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.CarMapper;
import com.itwillbs.project_gabolcar.vo.CarVO;

@Service
public class CarService {
	@Autowired
	private CarMapper mapper;
	
	public int carRegister(CarVO car) {
		return mapper.registerCar(car);
	}
	
	public List<Map<String, Object>> carList() {
		return mapper.selectCarList();
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
