package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Random;

import com.itwillbs.project_gabolcar.vo.CarVO;
import com.itwillbs.project_gabolcar.vo.ResInfoVO;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.BrcMapper;
import com.itwillbs.project_gabolcar.mapper.CarMapper;
import com.itwillbs.project_gabolcar.mapper.ResMapper;

@Service
public class DummyDbService {
	
	@Autowired
	CarItemService carItemService;
	
	@Autowired
	BrcMapper brcMapper;
	
	@Autowired
	CarMapper carMapper;
	@Autowired
	ResMapper resMapper;

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
		List<String> brcList = carItemService.findBrcList();
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
	
	public void resInfoMaker() {
		// 랜덤 객체
		Random r = new Random();
		List<String> brcList = carItemService.findBrcList();
		List<Integer> carIdxList = carItemService.getCarIndexList();
		for(int i = 0; i < 100; i++) {
			// 현재시간 불러와서 예약 시간 설정
			LocalDateTime res_time = LocalDateTime.now().plusDays(r.nextInt(100)+1);
			LocalDateTime res_rental_date = res_time.plusDays(r.nextInt(10)+1);
			LocalDateTime res_return_date = res_rental_date.plusDays(r.nextInt(30)+1);
			
			// 대여 반납장소 받아와서 값 넣기
			String brc_rent_name = brcList.get(r.nextInt(brcList.size()));
			String brc_return_name = brcList.get(r.nextInt(brcList.size()));
			
			// 차량코드
			int car_idx = carIdxList.get(i);
			// 보험
			String car_insurance = "일반자차";
			// 면허증 번호
			String lic_num =String.format("%02d",(r.nextInt(19) + 11) )  + "-" 
			+ String.format("%02d",r.nextInt(23) ) + "-"
			+String.format("%06d", r.nextInt(999999))  + "-" 
			+String.format("%02d", r.nextInt(19));
			// 회원번호
			int mem_idx = r.nextInt(8);

			ResInfoVO resInfo = new ResInfoVO();
			
			resInfo.setRes_time(Timestamp.valueOf(res_time));
			resInfo.setRes_rental_date(Timestamp.valueOf(res_rental_date));
			resInfo.setRes_return_date(Timestamp.valueOf(res_return_date));
			resInfo.setBrc_rent_name(brc_rent_name);
			resInfo.setBrc_return_name(brc_return_name);
			resInfo.setCar_idx(car_idx);
			resInfo.setCar_insurance(car_insurance);
			resInfo.setLic_num(lic_num);
			resInfo.setMem_idx(mem_idx);
			
			resMapper.insertResInfo(resInfo);
		}

		
	}
	
}
