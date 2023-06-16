package com.itwillbs.project_gabolcar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.BrcMapper;
import com.itwillbs.project_gabolcar.mapper.CarMapper;
import com.itwillbs.project_gabolcar.vo.*;


@Service
public class CarItemService {
	@Autowired
	BrcMapper brcMapper;
	
	@Autowired
	CarMapper carMapper;
	
	public List<String> findBrcList(){
		// 변수 초기화
		List<String> brcList = new ArrayList<String>();
		List<Map<String, Object>> brcMapList = null;
		
		brcMapList = brcMapper.selectBrcList();
		if(brcMapList != null) {
			for(Map<String, Object> map : brcMapList) {
				brcList.add(map.get("brc_name").toString());
			} // for 문 끝
		}// if 문 끝
		return brcList;
	} // findBrcList 끝
	
	public void carInfoDummyMaker() {
		String[] carTCMF = {
				"경형/소형,현대,캐스퍼,가솔린",
				"경형/소형,기아,모닝,가솔린",
				"경형/소형,현대,악센트,가솔린",
				"경형/소형,현대,악센트,디젤",
				"준중형,현대,아반떼,가솔린",
				"준중형,기아,K3,가솔린",
				"중형,현대,소나타,가솔린",
				"중형,현대,소나타,LPG",
				"중형,기아,K5,가솔린",
				"대형,현대,그랜저,가솔린",
				"대형,기아,K7,가솔린",
				"대형,제네시스,G80,가솔린",
				"SUV,현대,코나,가솔린",
				"SUV,현대,투싼,가솔린",
				"SUV,현대,싼타페,가솔린",
				"SUV,현대,싼타페,디젤",
				"SUV,기아,셀토스,가솔린",
				"SUV,기아,셀토스,디젤",
				"SUV,기아,스포티지,가솔린",
				"SUV,쌍용,티볼리,가솔린",
				"SUV,쌍용,티볼리에어,가솔린",
				"SUV,르노,XM3,가솔린+LPG",
				"승합,기아,카니발,가솔린",
				"승합,기아,카니발,디젤",
				"수입,벤츠,E클래스,가솔린",
				"수입,벤츠,S클래스,가솔린",
				"수입,BMW,M3,가솔린",
				"수입,BMW,M5,디젤",
				"SUV,현대,아이오닉5,전기",
				"준중형,테슬라,Model3,전기",
				"SUV,테슬라,ModelY,전기"
				};
		String[] carNumber2 = {"하-","허-","호-"};
		String[] carShiftType = {"자동","수동"};
		List<String> brcList = findBrcList();
		String[] car_status = {"신규", "점검", "대여", "가능"};
		
		Random r = new Random();
		for(int i = 0; i < 100; i++) {
			CarVO car = new CarVO();
			String[] tcmf = carTCMF[r.nextInt(carTCMF.length)].split(",");
			
			// 차량 정원
			int riding = 5;
			
			if(tcmf[0].equals("승합")) {
				riding = 7;
			}
			else if(tcmf[1].equals("캐스퍼")) {
				riding = 4;
			}
			
			// 차량 면허 설정
			String license = "2종";
			if("대형 승합".contains(tcmf[0])) {
				license = "1종";
			}
			
			// 나이 ,커리어 제한
			int age = 20;
			int career = 1;
			if("대형 승합 수입 전기".contains(tcmf[0])) {
				age = 25;
				career = 3;
			}

			//대여료
			int rentPrice = 55000;
			switch (tcmf[0]) {
			case "준중형":
				rentPrice = 70000;
				break;
			case "중형":
				rentPrice = 89000;
				break;
			case "대형":
				rentPrice = 119000;
				break;
			case "SUV":
				rentPrice = 89000;
				break;
			case "승합":
				rentPrice = 119000;
				break;
			case "수입":
				rentPrice = 150000;
				break;
			
			}
			
			// 차 상태 랜덤 특정값 아래일때만 변화
			String sc = "신규";
			if(r.nextInt(10)>8) {
				sc = car_status[r.nextInt(car_status.length)];
			}
			
			car.setCar_type(tcmf[0]);
			car.setCar_number(String.format("%03d", r.nextInt(999)) + 
					carNumber2[r.nextInt(carNumber2.length)] + 
					String.format("%04d", r.nextInt(9999)));
			car.setCar_company(tcmf[1]);
			car.setCar_model(tcmf[2]);
			car.setCar_old(2017 + r.nextInt(5));
			car.setCar_shift_type(carShiftType[r.nextInt(2)]);
			car.setCar_fuel_type(tcmf[3]);
			car.setCar_riding(riding);
			car.setCar_age(age);
			car.setCar_career(career);
			car.setCar_license(license);
			car.setCar_weekdays(rentPrice);
			car.setCar_weekend((int)(rentPrice * 1.2));
			car.setBrc_name(brcList.get(r.nextInt(brcList.size())));
			car.setCar_file("/resources/upload/car/"+tcmf[2]+".png");
			car.setCar_file_path(tcmf[2]+".png");
			car.setCar_status(sc);
		
			carMapper.registerCar(car);
		}// for문 끝
		
	}// 메서드 끝
	
//==============리뷰 서비스=============================
	public List<ReviewVO> getReviewList(){
		
		return carMapper.selectReviewList();
	}
	//==========getReviewList() 끝=======
}


