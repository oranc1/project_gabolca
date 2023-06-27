package com.itwillbs.project_gabolcar;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.project_gabolcar.service.CarItemService;
import com.itwillbs.project_gabolcar.service.CarService;
import com.itwillbs.project_gabolcar.vo.CarVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	// db 검색 없이 더미 데이터를 사용시
	static final boolean DUMMY_DATA_FLAG = false;
	
	@Autowired
	CarItemService carItemService; // main 의 지점정보와 차량 추천목록 정보 가져올때 사용
	
	@Autowired
	CarService carService; // main 의 지점정보와 차량 추천목록 정보 가져올때 사용
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		// 지점 이름과 차량 추천목록에 쓰일 차량정보 저장할 Map 객체 
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 지점 이름 받을 배열
		List<String> brc_name_list = null;
		
		//인기차량 받을 배열
		List<Map<String,Object>> populerCarList = null;
		
		// 추천차량 정보 받을 배열
		List<Map<String,Object>> pCarDataList = new ArrayList<Map<String,Object>>();
		
		// 차량 이름으로 찾을때 CarVO가 필요함으로 선언
		CarVO car = new CarVO();
		
		// 지점이름 더미데이터
		List<String> brcNameDummy = new ArrayList<String>(Arrays.asList("서면역점","해운대역점","광안리역점","부전역점"));
		

		// 차량정보 받을변수 (추후생성후 구현)
		
		// 더미데이터 사용 여부 체크후 사용 안하면 데이터 받아오기
		if(!DUMMY_DATA_FLAG) {
			brc_name_list = carItemService.findBrcList();
			
			//인기 차량 목록 받아오기
			populerCarList = carItemService.getCarPopuler("true");
			// 인기 차량 대수 체크후 4개 이상이면 4개 아니면 인기차량 댓수만큼 가져오기
			if(populerCarList.size() >= 4) {
				for(int i = 0; i < 4; i++) {
					car.setCar_model((String)populerCarList.get(i).get("car_model"));
					pCarDataList.add(carService.carSelect(car));
				}
			}
			else {
				for(Map<String,Object> populerCar : populerCarList) {
					car.setCar_model((String)populerCar.get("car_model"));
					pCarDataList.add(carService.carSelect(car));
				}
			}
			
			map.put("car_populer_list", pCarDataList);
			
			// 리뷰 항목들 받아오기
			map.put("car_rev_list", carItemService.getReviewForMain());
		}
		else{
			brc_name_list = brcNameDummy;
		}
		
		map.put("DUMMY_DATA_FLAG", DUMMY_DATA_FLAG);
		map.put("isMapHaveParams", false);
		map.put("brc_name_list", brc_name_list);
	
		return new ModelAndView("main","map",map);
	}
	

	
}
