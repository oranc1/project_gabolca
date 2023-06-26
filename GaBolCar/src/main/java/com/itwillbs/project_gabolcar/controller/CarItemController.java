package com.itwillbs.project_gabolcar.controller;


import java.io.*;
import java.nio.file.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.project_gabolcar.handler.CarResHandler;
import com.itwillbs.project_gabolcar.service.CarItemService;
import com.itwillbs.project_gabolcar.service.CarService;
import com.itwillbs.project_gabolcar.vo.CarVO;
import com.itwillbs.project_gabolcar.vo.PageInfo;
import com.itwillbs.project_gabolcar.vo.ReviewVO;

@Controller
public class CarItemController {
	
	@Autowired
	CarItemService carItemService;

	@Autowired
	CarService carService;

	// 핸들러 객체 생성
	CarResHandler carResHandler = new CarResHandler();
	
	// db 검색 없이 더미 데이터를 사용시
	static final boolean DUMMY_DATA_FLAG = false;
	
	// carRes 페이지 검색시 limit 상수
	static final int CAR_RES_ITEM_LIMIT = 8;
	
	
	//차량 예약 검색
	// 차 타입 하고 차 연료는 값 없는 경우 기본 값으로 받아오기
	@RequestMapping("carRes")
	public ModelAndView carRes(@RequestParam Map<String , String> map
			, @RequestParam(value="car_type", defaultValue="경형/소형,준중형,중형,대형,SUV,승합,수입") String[] car_type
			, @RequestParam(value="car_fuel_type", defaultValue="가솔린,디젤,LPG,전기,하이브리드,가솔린+LPG") String[] car_fuel_type
			, Model model) {
		
		
		// 사용될 변수와 초기값 셋팅
		
		int initHour = 15; // 기본 시간값은 15시
		int rentHour = 0;
		int rentMinute = 0;
		int returnHour = 0;
		int returnMinute = 0;

		// 얘는 null 받아도 상관없음 & 날짜체크 if 문에서 사용
		String date = map.get("rentDate"); 
		String[] dateArr = null; // date split 한 배열 임시저장소
		String rentDate = "";
		String returnDate = "";

		//날짜 포맷 셋팅
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");

		// 날짜 시간 raw값 셋팅(차량 검색시 필요)
		LocalDateTime res_rental_date = null;
		LocalDateTime res_return_date = null;
		
		// 지점 이름 등 데이터 저장할 Map 객체 
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 지점 이름 받을 변수
		List<String> brc_name_list = null;
		
		// 지점이름 더미데이터
		List<String> brcNameDummy = new ArrayList<String>(Arrays.asList("서면역점","해운대역점","광안리역점","부전역점"));
		
		
		// 파라미터로 보내온 지점 이름 넣을 변수
		String brc_rent_name = map.get("brc_rent_name"); 
		String brc_return_name = map.get("brc_return_name"); 
		
		// 차량 타입 , 연료 데이터
		List<String> car_type_list = new ArrayList<String>(Arrays.asList("경형/소형","준중형","중형","대형","SUV","승합","수입"));
		List<String> car_fuel_type_list = new ArrayList<String>(Arrays.asList("가솔린","디젤","LPG","전기","하이브리드","가솔린+LPG"));	

		// 차량 현재 페이지 정보를 담는 PageInfo 객체 추가
		PageInfo pageInfo = new PageInfo();
		
		// null값으로 넘어오는 파라미터가 있는지, 달력체크가 잘못되어있는지 체크후 안맞으면 이전 페이지로 넘어가게 하기
		// 1. 날짜 to 없이 하나만 들어오거나 비어있는경우 and 시간이 영업시간이 ( 8 ~ 21시 사이) 아닌경우 - 하드코딩 가능
		// 2. 지점이 현재 영업하고 있는 지점이 아닌 경우 - db 찾기 작업 필요
		// 3. 차 타입 또는 차 연료타입이 선택지에 없는 항목들이 들어올 경우 - db 찾기 작업 필요? - 물어보기 아마 하드코딩일것 
		
		//=========== 날짜 체크 ===========
		if(map.size() <= 0 || date == null) {
			// 날짜, 시간값 확인 시 아예 파라미터 비어있는 상태면 기본값들로 구성하여 db 검색
			// 날짜가 null이면 무조건 날짜, 시간값 초기화!
			// 현재시간 가져오기
			LocalDateTime nowDate = LocalDateTime.now();
			
			DateTimeFormatter fomatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			
			// 기본 렌트 시간은 현 시간보다 + 2
			int rentTime = nowDate.getHour() + 2;
			// 만약 기본 렌트 시간이 
			// 21 시가 넘는다면 다음날 지점 오픈 시간으로 셋팅
			if(rentTime  >= 21) {
				// 시간 셋팅
				rentHour = 8;
				returnHour = initHour;
				
				//날짜셋팅
				// 시작날짜가 다음날로
				rentDate = nowDate.plusDays(1).format(fomatter);
				returnDate = nowDate.plusDays(3).format(fomatter);
				

		}
			else {
				// 렌트 시간이 0~8 시 사이면 8 시로 고정 (날짜는 오늘날짜 그대로) 
				if(rentTime < 8) {
					rentHour = 8;
				}
				else {
					rentHour = rentTime;	
				}
				returnHour = initHour;								
				
				// 날짜셋팅
				rentDate = nowDate.format(fomatter);
				returnDate = nowDate.plusDays(2).format(fomatter);
			}
			//분은 동일
			rentMinute = 0;
			returnMinute = 0;	
			
			//값 집어넣기
			String[] rentSplit = rentDate.split("-");
			String[] returnSplit = returnDate.split("-");

			 res_rental_date 
			= LocalDateTime.of(
					Integer.parseInt(rentSplit[0]), 
					Integer.parseInt(rentSplit[1]),
					Integer.parseInt(rentSplit[2]),
					rentHour,rentMinute,0);	
			 res_return_date 
			= LocalDateTime.of(
					Integer.parseInt(returnSplit[0]), 
					Integer.parseInt(returnSplit[1]),
					Integer.parseInt(returnSplit[2]),
					returnHour,returnMinute,0);	
			
			if(res_rental_date.isAfter(res_return_date)) {
				// 에러 메시지 추가 후 fail_back 이동
				model.addAttribute("msg", "기간이 허용되지 않는 값 이거나 당일 예약으로 선택되었습니다! 다시 선택해주세요");
				return new ModelAndView("inc/fail_back","map",resultMap);
			}
	
		} // if 문 끝
		else {
			//=========== 날짜 체크 ===========
			// 날짜값 받아오기
			initHour = 15; // 기본 시간값은 15시                            
			rentHour = Integer.parseInt(map.get("rentHour"));        
			rentMinute = Integer.parseInt(map.get("rentMinute"));    
			returnHour = Integer.parseInt(map.get("returnHour"));    
			returnMinute = Integer.parseInt(map.get("returnMinute"));
			
			// 받아온 날짜 split으로 나누기
			dateArr = date.split("to");

			if(	
				//시간 체크
				(rentHour < 8 || rentHour > 21)
				|| (rentMinute > 50 || rentMinute < 0) 
				|| (rentMinute%10 != 0)
				|| (returnHour < 8 || returnHour > 21)
				|| (returnMinute > 50 || returnMinute < 0)
				|| (returnMinute%10 != 0)
					) { 
				
				// 에러 메시지 추가 후 fail_back 이동
				model.addAttribute("msg", "기간이나 시간이 허용되지 않는 값 입니다! 다시 선택해주세요");
				return new ModelAndView("inc/fail_back","map",resultMap);
			}
			
			// 렌트, 반납 날짜, 시간 비교해서
			// 반납 날짜가 렌트 날짜 이전인지 체크
			String[] rentSplit = null;
			String[] returnSplit = null;
			
			// 날짜 오는거 길이체크 해서 당일인지 구분
			if(dateArr.length == 2) {				
				// 날짜 공백 제거
				for(int i = 0; i < dateArr.length; i++) {
					dateArr[i].strip();
				}
				
				// 렌트, 반납 날짜, 시간 비교해서
				// 반납 날짜가 렌트 날짜 이전인지 체크
				rentSplit = dateArr[0].split("-");
				returnSplit = dateArr[1].split("-");
			}
			else if(dateArr.length == 1) {
				rentSplit = dateArr[0].split("-");
				returnSplit = dateArr[0].split("-");
			}
			try {
				
				 res_rental_date 
				= LocalDateTime.of(
						Integer.parseInt(rentSplit[0]), 
						Integer.parseInt(rentSplit[1]),
						Integer.parseInt(rentSplit[2]),
						rentHour,rentMinute,0);	
				 res_return_date 
				= LocalDateTime.of(
						Integer.parseInt(returnSplit[0]), 
						Integer.parseInt(returnSplit[1]),
						Integer.parseInt(returnSplit[2]),
						returnHour,returnMinute,0);	
				
				if(res_rental_date.isAfter(res_return_date) && !res_return_date.isAfter(res_rental_date.plusDays(1))) {
					// 에러 메시지 추가 후 fail_back 이동
					model.addAttribute("msg", "기간이 허용되지 않는 값 이거나 최소 예약일(24시간) 미만으로 선택되었습니다! 다시 선택해주세요");
					return new ModelAndView("inc/fail_back","map",resultMap);
				}
			}catch(Exception e) {	
				e.printStackTrace();
				// 에러 메시지 추가 후 fail_back 이동
				model.addAttribute("msg", "기간이 허용되지 않는 값 입니다! 다시 선택해주세요");
				return new ModelAndView("inc/fail_back","map",resultMap);
			}
			
			

			// 날짜 오는거 길이체크 해서 당일인지 구분해서 값 셋팅
			if(dateArr.length == 2) {				
				rentDate = dateArr[0];
				returnDate = dateArr[1];
			}
			else if(dateArr.length == 1) {

				rentDate = dateArr[0];
				returnDate = dateArr[0];
			}
			
		} // else 문 끝

		//=========== 날짜 체크 끝 ===========

		//=========== 지점 체크 ===========
	
		// 더미데이터 사용 여부 체크후 사용 안하면 데이터 받아오기
		if(!DUMMY_DATA_FLAG) {
			brc_name_list = carItemService.findBrcList();
		}
		else {
			brc_name_list = brcNameDummy;
		}
		
		// 지점리스트에 있는지 없는지 확인
		// 파라미터가 아예 비어있으면 리스트의 가장 첫번째값으로 설정

		// 통과 되었는지 체크하는 변수
		boolean checkResult = true;
		if(brc_name_list != null && !DUMMY_DATA_FLAG) {
			// brc_rent_name 체크
			//파라미터 비어있는지 체크
			if(brc_rent_name != null) {				
				if(!checkListName(brc_rent_name, brc_name_list)) {
					checkResult = false;
				}
			}
			// 파라미터 비어있으면 지점리스트의 가장 첫번째값으로
			else {
				brc_rent_name = brc_name_list.get(0);
			}
			
			// brc_return_name 체크
			//파라미터 비어있는지 체크
			if(brc_return_name != null ) {				
				if(!checkListName(brc_return_name, brc_name_list)) {
					checkResult = false;
				}
			}
			// 파라미터 비어있으면 지점리스트의 가장 첫번째값으로
			else {
					brc_return_name = brc_name_list.get(0);
			}
		}
		else {
			// 더미데이터로 유효성 체크
			
			// brc_rent_name 체크
			//파라미터 비어있는지 체크
			if(brc_rent_name != null) {				
				if(!checkListName(brc_rent_name, brcNameDummy)) {
					checkResult = false;
				}
			}
			// 파라미터 비어있으면 지점리스트의 가장 첫번째값으로
			else {
				brc_rent_name = brcNameDummy.get(0);
			}
			
			// brc_return_name 체크
			//파라미터 비어있는지 체크
			if(brc_return_name != null ) {				
				if(!checkListName(brc_return_name, brcNameDummy)) {
					checkResult = false;
				}
			}
			// 파라미터 비어있으면 지점리스트의 가장 첫번째값으로
			else {
					brc_return_name = brcNameDummy.get(0);
			}
		}
		
		if(!checkResult) {
			// 에러 메시지 추가 후 fail_back 이동
			model.addAttribute("msg", "선택한 지점이 없는 지점입니다! 다시 선택해주세요");
			return new ModelAndView("inc/fail_back","map",resultMap);
		}
		//=========== 지점 체크 끝 ===========
		
		//=========== 차량 타입, 연료 체크 ===========
	
		//파라미터 길이 체크 (너무길면 서버 성능 저하의 요소가 되므로)
		if(car_type.length <= car_type_list.size() || car_fuel_type.length <= car_fuel_type_list.size() ) {
			int countCheckTrue1 = 0;
			for(String str : car_type) {	
				if(checkListName(str, car_type_list)) {
					countCheckTrue1++;
				}
			}
			if(car_type.length != countCheckTrue1) {
				checkResult = false;				
			}
			
			int countCheckTrue2 = 0;
			for(String str : car_fuel_type) {			
				if(checkListName(str, car_fuel_type_list)) {
					countCheckTrue2++;
				}
			}
			if(car_fuel_type.length != countCheckTrue2) {
				checkResult = false;				
			}
		}
		else {
			checkResult = false;		
		}

		if(!checkResult) {
			// 에러 메시지 추가 후 fail_back 이동
			model.addAttribute("msg", "차량 타입 또는 연료가 잘못된 값 입니다! 다시 선택해주세요");
			return new ModelAndView("inc/fail_back","map",resultMap);
		}
		//=========== 차량 타입, 연료 체크 끝 ===========
		
		
		//================ map에 값들 셋팅하기
		resultMap.put("DUMMY_DATA_FLAG", DUMMY_DATA_FLAG);

		// 시간값 넣기
		
		// sql 문으로 날짜,시간 보낼땐 Timestamp로 꼭 변환해서 넣어야함!!
		resultMap.put("res_rental_date",Timestamp.valueOf( res_rental_date));
		resultMap.put("res_return_date", Timestamp.valueOf(res_return_date));
		
		resultMap.put("rentHour",rentHour );
		resultMap.put("rentMinute",rentMinute );
		resultMap.put("returnHour", returnHour);
		resultMap.put("returnMinute", returnMinute);
		resultMap.put("rentDate", rentDate);
		resultMap.put("returnDate", returnDate);
		
		// 렌트 지역값 넣기
		resultMap.put("brc_name_list", brc_name_list);
		resultMap.put("brc_rent_name", brc_rent_name);
		resultMap.put("brc_return_name", brc_return_name);
		
		// 차량 타입 연료 값 넣기
		// String[] 배열 형식으로 넣으면 제대로 된 값이 넘어가지 않으므로
		// new ArrayList(Arrays.asList()) 로 변환해서 넣기
		resultMap.put("car_type", new ArrayList(Arrays.asList(car_type)));
		resultMap.put("car_fuel_type", new ArrayList(Arrays.asList(car_fuel_type)));
		

		//페이지 정보 현황 초기화
		pageInfo.setEndPage(1);
		pageInfo.setListCount(1);
		pageInfo.setPageListLimit(CAR_RES_ITEM_LIMIT);
		pageInfo.setStartPage(0); // sql limit 문의 시작 번호는 배열처럼 0 이 시작
		pageInfo.setMaxPage(8);
		pageInfo.setNowPage(0);// sql limit 문의 시작 번호는 배열처럼 0 이 시작
		
		// 차량 검색 정렬 조건 셋팅
		resultMap.put("car_order_by",map.get("car_order_by"));
		
		// 만약 셋팅 조건이 없을 시 가격순 셋팅
		if(resultMap.get("car_order_by") == null)		
			resultMap.put("car_order_by","price");

		
		//차량 검색 시작
		if(!DUMMY_DATA_FLAG) {
			try {				
				//차량을 일부분씩만 불러오기 때문에 최대 페이지 설정 해주기
				// 최대 차량 대수
				// 차량 검색 조건 적용하여 찾기
				pageInfo.setListCount(carItemService.getCarCount(resultMap));
				pageInfo.setMaxPage((pageInfo.getListCount() / pageInfo.getPageListLimit()) + 1);
				if(resultMap.get("car_order_by").equals("populer")) {					
					//차량 인기순위 검색후 넣기
					resultMap.put("car_populer_list", carItemService.getCarPopuler());
				}
				
				// 페이지 정보 현황 넣기
				resultMap.put("pageInfo", pageInfo);			
				// 현재 car_res 페이지에서 차량을 찾는다는 확인 문구를 넣기
				resultMap.put("carRes", "true");
				// 차량 종류를 정해서 찾는다는 확인 문구 보내기
				resultMap.put("search", "carRes");			
				resultMap.put("car_search_list", carService.carList(resultMap));
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		else {
			// 페이지 정보 현황 넣기(더미)
			resultMap.put("pageInfo", pageInfo);
		}
		
		// ======== JSON 정보 넣기
		
		//JSONObject 객체로 차 검색에 필요한 정보들 만 넣어 보내기
		JSONObject jsonObj = new JSONObject();
		
		if(!DUMMY_DATA_FLAG) {			
			// sql 문으로 날짜,시간 보낼땐 Timestamp로 꼭 변환해서 넣어야함!!
			jsonObj.put("res_rental_date",Timestamp.valueOf( res_rental_date));
			jsonObj.put("res_return_date", Timestamp.valueOf(res_return_date));
			
			jsonObj.put("brc_rent_name", brc_rent_name);
			jsonObj.put("brc_return_name", brc_return_name);
			
			// 차량 타입 연료 값 넣기
			// String[] 배열 형식으로 넣으면 제대로 된 값이 넘어가지 않으므로
			// new ArrayList(Arrays.asList()) 로 변환해서 넣기
			jsonObj.put("car_type", new ArrayList(Arrays.asList(car_type)));
			jsonObj.put("car_fuel_type", new ArrayList(Arrays.asList(car_fuel_type)));
			
			// 페이지 정보 현황 넣기
			// 페이지 정보 현황을 그냥 pageInfo로 넣으면 
			// .toString() 을 쓴것같이 통짜로 들어감
			// 따라서 map으로 바꾸던가 따로 넣어주던가 해야함
			
			// 따로 넣어주기로 함
			carResHandler.pageInfo2JsonObj(jsonObj, pageInfo);
			
			// 차량 검색 정렬 조건 셋팅
			jsonObj.put("car_order_by",resultMap.get("car_order_by"));
			// 현재 car_res 페이지에서 차량을 찾는다는 확인 문구를 넣기
			jsonObj.put("carRes", "true");
			// 차량 종류를 정해서 찾는다는 확인 문구 보내기
			jsonObj.put("search", "carRes");			
			
			// json 타입 객체 전달위해 map에 넣기
			resultMap.put("car_res_JSON", jsonObj);
		}
		
		System.out.println(res_rental_date.getDayOfWeek());
		
		return new ModelAndView("html/car_item/res/car_res","map",resultMap) ;
	}
	
	//=================================================
	// 예약 차량 상세 정보
	@GetMapping("carRes/carResInfo")
	public ModelAndView carIntroduce(@RequestParam Map<String,Object> map,Model model ) {
		
		// 페이지로 보낼 map
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		if(!DUMMY_DATA_FLAG) {
			// 차량 검색을 위한 CarVO
			CarVO car = new CarVO();
			try {			
				car.setCar_idx(Integer.parseInt((String)map.get("car_idx")));
			}
			catch(Exception e) {
				model.addAttribute("msg","유효하지않은 값입니다!");
				return new ModelAndView("inc/fail_back","map",resultMap);
			}
			
			Map<String, Object> carInfo = carService.carSelect(car);
			
			//데이터 넣기
			resultMap.put("car_info", carInfo);
			// 콤마( , ) 로 날짜 분리해서 넣기
			resultMap.put("res_rental_date", map.get("res_rental_date").toString().replace("%",","));
			resultMap.put("res_return_date", map.get("res_return_date").toString().replace("%",","));
			resultMap.put("brc_rent_name", map.get("brc_rent_name"));
			resultMap.put("brc_return_name", map.get("brc_return_name"));
			resultMap.put("car_option", carItemService.getCarOptionList((String)map.get("car_idx")));
			resultMap.put("car_idx", map.get("car_idx"));
			
			// 노용석 START
			String car_model = carInfo.get("car_model").toString();
			List<ReviewVO> reviewListSmall = carItemService.getReviewListSmall(car_model);
			resultMap.put("reviewListS", reviewListSmall);
			// 노용석 END
			
		}
		
		resultMap.put("DUMMY_DATA_FLAG", DUMMY_DATA_FLAG);
		//=================================================
		

		//List<ReviewVO> reviewListSmall = carItemService.getReviewListSmall(car_model);
		//model.addAttribute("reviewListS", reviewListSmall);
		
		return new ModelAndView("html/car_item/res/car_res_info","map",resultMap);
	}
	//=================================================

	// 차량예약 더보기 버튼 누를 시 비동기(ajax) 동작
	
	@RequestMapping(
			value = "carResListLoad.ajax",
			method = RequestMethod.POST,
			produces = "application/text; charset=UTF-8"
			)	
	@ResponseBody
	public String carResListLoad(@RequestParam Map<String,Object> map, Model model) {
		
		
		//JSON 데이터 형태로 담는 객체
		JSONObject jsonObj = new JSONObject();	
		
		//차량 검색 시작
		if(!DUMMY_DATA_FLAG) {
			
			// 차량 타입 연료 값 넣기
			// 페이지에서 json 으로 받아올때 리스트로 제대로 받지 못함
			// 따라서 배열로 만들어 차량 찾기에 사용 될 car_type에 밀어넣기
			int count = 0;
			String carType = "car_type";
			String carTypeFuel = "car_fuel_type";
			
			List<String> carTypeList = new ArrayList();
			List<String> carFuelTypeList = new ArrayList();
			
			PageInfo pageInfo = new PageInfo();

			while(map.get(carType + count) != null) {
				carTypeList.add((String)map.get(carType + count));
				count++;
			}
			count = 0;
			while(map.get(carTypeFuel + count) != null) {
				carFuelTypeList.add((String)map.get(carTypeFuel + count));
				count++;
			}
			
			// new ArrayList(Arrays.asList()) 로 변환해서 넣기
			map.put("car_type", carTypeList);
			map.put("car_fuel_type", carFuelTypeList);
			
			try {				
				
				//차량을 일부분씩만 불러오기 때문에 최대 페이지 설정 해주기		
				// 최대 차량 대수
				
				if(map.get("car_order_by").equals("populer")) {					
					//차량 인기순위 검색후 넣기
					map.put("car_populer_list", carItemService.getCarPopuler());
				}
				
				// 페이지 정보 현황 업데이트
				carResHandler.jsonMap2PageInfo(map, pageInfo);
				
				pageInfo.setPageListLimit(CAR_RES_ITEM_LIMIT);
				
				if(pageInfo.getNowPage() < pageInfo.getMaxPage()) {
					pageInfo.setNowPage(pageInfo.getNowPage() + 1);
				}
				else {
					pageInfo.setNowPage(pageInfo.getMaxPage());		
				}
				
				map.put("pageInfo", pageInfo);
				
				// 현재 car_res 페이지에서 차량을 찾는다는 확인 문구를 넣기
				map.put("carRes", "true");
				// 차량 종류를 정해서 찾는다는 확인 문구 보내기
				map.put("search", "carRes");			
				
				//차량 찾기
				// 차량 찾기 전 현재 car_search_list 초기화
				
				map.put("car_search_list", "");
				
				System.out.println(carService.carList(map));
				map.put("car_search_list", carService.carList(map));
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			// for 문 활용하여 jsonObj에 값 넣어주기
				
			for(Map.Entry<String,Object> et : map.entrySet()) {
				String key = et.getKey();
				Object value = et.getValue();
				jsonObj.put(key, value);
			}		
			
			carResHandler.pageInfo2JsonObj(jsonObj,pageInfo);
		}
		
		System.out.println(jsonObj);
		return jsonObj.toString();
	}
	
	//=================================================
	//차량 소개
	@GetMapping("carInfoList")
	public String carInfo(Model model) {
	    List<Map<String, Object>> carInfoList = carItemService.carInfoList();
	    for (Map<String, Object> carInfo : carInfoList) {
	        int carIdx = (int) carInfo.get("car_idx");
	        List<Map<String, Object>> carOptionList = carItemService.carOptionListInfo(carIdx);
	        carInfo.put("options", carOptionList);
	    }
	    model.addAttribute("carInfoList", carInfoList);
	    return "html/car_item/car_info_list";
	}
	
	//============ 리뷰 ==================
	
		// 리뷰 게시판
		/*@GetMapping("review")
		public String reviewBoard(@RequestParam Map<String, String> map, Model model, PageInfo pageInfo, ReviewVO review) {
			
			int pageNum = 1;
			if(map.get("pageNum") != null) {
				pageNum = Integer.parseInt(map.get("pageNum"));
			}
					
			int listLimit = 10; // 한 페이지에서 표시할 목록 갯수 지정
			int startRow = (pageNum - 1 ) * listLimit; //조회 행번호 지정
		
		List<ReviewVO> reviewList = carItemService.getReviewList(startRow, listLimit);
		int listCount = carItemService.getReviewListCount();
		System.out.println("리스트카운트"+listCount);
			
		int pageListLimit = 3;
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		pageInfo.getListCount();
		pageInfo.setPageListLimit(pageListLimit);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageInfo", pageInfo);
		
		System.out.println(reviewList);
		System.out.println("페이지 인포"+pageInfo);
		
		
			return "html/car_item/review/review_board";
		}*/
		//car_res_info에서 리뷰리스트 3개 가져오기
		
		
		@GetMapping("reviewListSmall")
		public String reviewListSmall(ReviewVO review, Model model, String car_model) {

			List<ReviewVO> reviewListSmall = carItemService.getReviewListSmall(car_model);
			model.addAttribute("reviewListS", reviewListSmall);

		
			return "html/car_item/res/car_res_info";
			
		}
		
		
		// 리뷰게시판 글 목록, 페이지 나눔
		
		
		
	/*	@GetMapping("reviewList")
		public String reviewList(@RequestParam(defaultValue = "") String searchType, 
				@RequestParam(defaultValue = "") String searchKeyword, Model model, Criteria cri) {

			System.out.println("검색타입 : " + searchType);
			System.out.println("검색어 : " + searchKeyword);
			System.out.println("cri"+cri);
			
			List<ReviewVO> reviewListWithPaging = carItemService.getReviewListPaging(searchType, searchKeyword,cri);
		
			
			
			model.addAttribute("reviewListP", reviewListWithPaging);
			
			int total = carItemService.getTotal(searchType, searchKeyword);
			PageDTO pageMaker = new PageDTO(cri, total);
			model.addAttribute("pageMaker", pageMaker);		
			
			return "html/car_item/review/review_board";
			
		}*/
		
		// "BoardList" 서블릿 요청에 대해 글목록 조회 비즈니스 로직 요청
		// => 파라미터 : 검색타입(searchType) => 기본값 널스트링("") 으로 설정
		//               검색어(searchKeyword) => 기본값 널스트링("") 으로 설정
		//               페이지번호(pageNum) => 기본값 0 으로 설정
		//               데이터공유객체(model)
		@GetMapping("reviewList")
		public String reviewList(
				@RequestParam(defaultValue = "") String searchType, 
				@RequestParam(defaultValue = "") String searchKeyword, 
				@RequestParam(defaultValue = "1") int pageNum, 
				Model model) {
			
			System.out.println("검색타입 : " + searchType);
			System.out.println("검색어 : " + searchKeyword);
			// -------------------------------------------------------------------------
			// 페이징 처리를 위해 조회 목록 갯수 조절 시 사용될 변수 선언
			int listLimit = 10; // 한 페이지에서 표시할 목록 갯수 지정
			int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
			// -------------------------------------------------------------------------
			// BoardService - getBoardList() 메서드 호출하여 게시물 목록 조회 요청
			// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수
			// => 리턴타입 : List<BoardVO>(boardList)
			List<ReviewVO> reviewListWithPaging = carItemService.getReviewListPaging(searchType, searchKeyword, startRow, listLimit);
//			System.out.println(boardList);
			// -------------------------------------------------------------------------
			// 페이징 처리를 위한 계산 작업
			// 한 페이지에서 표시할 페이지 목록(번호) 계산
			// 1. BoardService - getBoardListCount() 메서드를 호출하여
			//    전체 게시물 수 조회 요청(페이지 목록 계산에 활용)
			// => 파라미터 : 검색타입, 검색어   리턴타입 : int(listCount)
			int listCount = carItemService.getTotal(searchType, searchKeyword);
//			System.out.println("전체 게시물 수 : " + listCount);
			
			// 2. 한 페이지에서 표시할 목록 갯수 설정(페이지 번호의 갯수)
			int pageListLimit = 10;
			
			// 3. 전체 페이지 목록 갯수 계산
			int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
//			System.out.println("전체 페이지 목록 갯수 : " + maxPage);
			
			// 4. 시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
//			System.out.println(startPage);
			
			// 5. 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
			
			// 6. 만약, 끝 페이지 번호(endPage)가 전체(최대) 페이지 번호(maxPage) 보다
			//    클 경우 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			int nowPage = 0;                                        // nowPage 꼭 있어야 되어 사용(변수 선언용 노용석) 
//			System.out.println(endPage);
			
			// 페이징 처리 정보를 저장할 PageInfoVO 객체에 계산된 데이터 저장
			PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage, nowPage);
			// -----------------------------------------------------------------------------------------
			// 조회된 게시물 목록 객쳬(boardList) 와 페이징 정보 객체(pageInfo) 를 Model 객체에 저장
			
			
			
			model.addAttribute("reviewListP", reviewListWithPaging);
			model.addAttribute("pageInfo", pageInfo);
			
			return "html/car_item/review/review_board";
		}
			
		
		
		
		// 리뷰 상세 글 보기
		@GetMapping("reviewDetail")
		public String reviewDetail(HttpSession session, ReviewVO review, Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue = "") String searchType, 
				@RequestParam(defaultValue = "") String searchKeyword, 
				@RequestParam(defaultValue = "1") int pageNum) {
			
			// 파라미터에 request 없애고 HttpSession 으로 
			ReviewVO reviewResult = carItemService.reviewDetail(review);
			model.addAttribute("reviewDetail", reviewResult);
			String sId = (String)session.getAttribute("sId");
			
			model.addAttribute("sId",sId);
			
			
			return "html/car_item/review/review_detail";
		}
		
		
		
		
		
		@GetMapping("reviewWriteForm")
		public String reviewWriteForm(HttpSession session, Model model, @RequestParam(defaultValue = "") String searchType, 
				@RequestParam(defaultValue = "") String searchKeyword, 
				@RequestParam(defaultValue = "1") int pageNum, 
				@RequestParam(defaultValue = "1") int rev_idx) {
			String sId = (String)session.getAttribute("sId");

			//글쓰기 제어 : admin이 아닐 때 예약이 있을 때
			if(sId == null || sId.length() == 0)
			{
				model.addAttribute("msg", "로그인해 주십시오."); // 로그인 안했을 때
				return "redirect:/login";
			}
			else
			{
				if(!sId.equals("admin@naver.com")) {
					int isBoardWriter = carItemService.isBoardWriter(sId);
					
					if(isBoardWriter == 0 ) {
						model.addAttribute("msg", "권한이 없습니다!");
						return "html/car_item/review/fail_back";
					}
				}
			}

			return "html/car_item/review/review_write_form";
		}
		
		// 리뷰게시판 글 작성
		@PostMapping("reviewWritePro")
		public String reviewWritePro(HttpSession session, ReviewVO review, Model model, @RequestParam Map<String,Object> map,HttpServletRequest request) {
			String sId = (String)session.getAttribute("sId");

			//글쓰기 제어 : admin이 아닐 때 예약이 있을 때
			if(sId == null || sId.length() == 0)
			{
				model.addAttribute("msg", "로그인해 주십시오."); // 로그인 안했을 때
				return "redirect:/login";
			}
			else
			{
				if(!sId.equals("admin@naver.com")) {
					int isBoardWriter = carItemService.isBoardWriter(sId);
					
					if(isBoardWriter == 0 ) {
						model.addAttribute("msg", "권한이 없습니다!");
						return "html/car_item/review/fail_back";
					}
				}
			}

			
			String uploadDir = "/resources/upload";
			//String saveDir = request.getServletContext().getRealPath(uploadDir); // 사용 가능
			String saveDir = session.getServletContext().getRealPath(uploadDir);
//			String saveDir = "C:/Users/linan/git/project_gabolca/GaBolCar/src/main/webapp/resources/upload";
//			System.out.println("실제 업로드 경로 : "+ saveDir);
			// 실제 업로드 경로 :C:/STS4/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/GaBolCar/resources/upload
			
			String subDir = ""; // 서브디렉토리(날짜 구분)
			
			try {
				// ------------------------------------------------------------------------------
				// 업로드 디렉토리를 날짜별 디렉토리로 자동 분류하기
				// => 하나의 디렉토리에 너무 많은 파일이 존재하면 로딩 시간 길어지며 관리도 불편
				// => 따라서, 날짜별 디렉토리 구별 위해 java.util.Date 클래스 활용
				// 1. Date 객체 생성(기본 생성자 호출하여 시스템 날짜 정보 활용)
				Date date = new Date(); // Mon Jun 19 11:26:52 KST 2023
//			System.out.println(date);
				// 2. SimpleDateFormat 클래스를 활용하여 날짜 형식을 "yyyy/MM/dd" 로 지정
				// => 디렉토리 구조로 바로 활용하기 위해 날짜 구분 기호를 슬래시(/)로 지정
				// => 디렉토리 구분자를 가장 정확히 표현하려면 File.pathSeperator 또는 File.seperator 상수 활용
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				// 3. 기존 업로드 경로에 날짜 경로 결합하여 저장
				subDir = sdf.format(date);
				saveDir += "/" + subDir;
				// --------------------------------------------------------------
				// java.nio.file.Paths 클래스의 get() 메서드를 호출하여
				// 실제 경로를 관리하는 java.nio.file.Path 타입 객체 리턴받기
				// => 파라미터 : 실제 업로드 경로
				Path path = Paths.get(saveDir);
				
				// Files 클래스의 createDirectories() 메서드를 호출하여
				// Path 객체가 관리하는 경로 생성(존재하지 않으면 거쳐가는 경로들 중 없는 경로 모두 생성)
				Files.createDirectories(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
			MultipartFile mFile1 = review.getFile1();
			MultipartFile mFile2 = review.getFile2();
			MultipartFile mFile3 = review.getFile3();
			System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
			System.out.println("원본파일명2 : " + mFile2.getOriginalFilename());
			System.out.println("원본파일명3 : " + mFile3.getOriginalFilename());
			
			// 이미지만 업로드 가능
			String filename1 = mFile1.getOriginalFilename();
			String filename2 = mFile2.getOriginalFilename();
			String filename3 = mFile3.getOriginalFilename();
			String fileext1 = filename1.substring(filename1.lastIndexOf(".") + 1);
			String fileext2 = filename2.substring(filename2.lastIndexOf(".") + 1);
			String fileext3 = filename3.substring(filename3.lastIndexOf(".") + 1);
			
			
			if((fileext1 == null || fileext1.length() == 0))
			{	
			}
			else
			{	
				if(fileext1.equals("png") || fileext1.equals("jpg") || fileext1.equals("jpeg"))
				{
				}
				else 
				{
					model.addAttribute("msg", "첫번째 파일 업로드는 이미지만 업로드 가능합니다.");
					return "html/car_item/review/fail_back";
				}
			}
			
			if((fileext2 == null || fileext2.length() == 0))
			{	
			}
			else
			{	
				if(fileext2.equals("png") || fileext2.equals("jpg") || fileext2.equals("jpeg"))
				{
				}
				else 
				{
					model.addAttribute("msg", "두번째 파일 업로드는 이미지만 업로드 가능합니다.");
					return "html/car_item/review/fail_back";
				}
			}
			
			if((fileext3 == null || fileext3.length() == 0))
			{	
			}
			else
			{	
				if(fileext3.equals("png") || fileext3.equals("jpg") || fileext3.equals("jpeg"))
				{
				}
				else 
				{
					model.addAttribute("msg", "세번째 파일 업로드는 이미지만 업로드 가능합니다.");
					return "html/car_item/review/fail_back";
				}
			}
			
			
			// 파일명 중복 방지를 위한 대첵
			// 현재 시스템(서버)에서 랜덤ID 값을 추출하여 파일명 앞에 붙여서
			// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
			// => 랜덤ID 생성은 java.util.UUID 클래스 활용(UUID = 범용 고유 식별자)
			String uuid = UUID.randomUUID().toString();
//			System.out.println("uuid : " + uuid);
			
			// 생성된 UUID 값을 원본 파일명 앞에 결합(파일명과 구분을 위해 _ 기호 추가)
			// => 나중에 사용자 다운로드 시 원본 파일명 표시를 위해 분리할 때 구분자로 사용
			//    (가장 먼저 만나는 _ 기호를 기준으로 문자열 분리하여 처리)
			// => 단, 파일명 길이 조절을 위해 임의로 UUID 중 맨 앞자리 8자리 문자열만 활용
//			System.out.println(uuid.substring(0, 8));
			// 생성된 UUID 값(8자리 추출)과 업로드 파일명을 결합하여 BoardVO 객체에 저장(구분자로 _ 기호 추가)
			// => 단, 파일명이 존재하는 경우에만 파일명 생성(없을 경우를 대비하여 기본 파일명 널스트링으로 처리)
			review.setRev_file1("");
			review.setRev_file2("");
			review.setRev_file3("");
			
			// 파일명을 저장할 변수 선언
			String fileName1 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
			String fileName2 = uuid.substring(0, 8) + "_" + mFile2.getOriginalFilename();
			String fileName3 = uuid.substring(0, 8) + "_" + mFile3.getOriginalFilename();
			
			if(!mFile1.getOriginalFilename().equals("")) {
				review.setRev_file1(subDir + "/" + fileName1);
			}
			
			if(!mFile2.getOriginalFilename().equals("")) {
				review.setRev_file2(subDir + "/" + fileName2);
			}
			
			if(!mFile3.getOriginalFilename().equals("")) {
				review.setRev_file3(subDir + "/" + fileName3);
			}
			
			System.out.println("실제 업로드 파일명1 : " + review.getRev_file1());
			System.out.println("실제 업로드 파일명2 : " + review.getRev_file2());
			System.out.println("실제 업로드 파일명3 : " + review.getRev_file3());
			
			int insertCount = carItemService.insertReview(review);
			
			if(insertCount > 0) {
			 // 성공
				try {
					// 업로드 된 파일은 MultipartFile 객체에 의해 임시 디렉토리에 저장되어 있으며
					// 글쓰기 작업 성공 시 임시 디렉토리 -> 실제 디렉토리로 이동 작업 필요
					// MultipartFile 객체의 transferTo() 메서드를 호출하여 실제 위치로 이동(업로드)
					// => 비어있는 파일은 이동할 수 없으므로(= 예외 발생) 제외
					// => File 객체 생성 시 지정한 디렉토리에 지정한 이름으로 파일이 이동(생성)됨
					//    따라서, 이동할 위치의 파일명도 UUID 가 결합된 파일명을 지정해야한다!
					if(!mFile1.getOriginalFilename().equals("")) {
						mFile1.transferTo(new File(saveDir, fileName1));
					}
					
					if(!mFile2.getOriginalFilename().equals("")) {
						mFile2.transferTo(new File(saveDir, fileName2));
					}
					
					if(!mFile3.getOriginalFilename().equals("")) {
						mFile3.transferTo(new File(saveDir, fileName3));
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
						
			int rev_star = review.getRev_star();
			if(insertCount < 0) {
				model.addAttribute("msg", "등록 실패");
				return "html/car_item/review/fail_back";
			} else if (rev_star <= 0) {
				model.addAttribute("msg", "별점을 입력해주세요");
				return "html/car_item/review/fail_back";
			}				
			return "redirect:/reviewList";
		}
		
		// 리뷰 글 삭제
		@GetMapping("reviewDelete")
		public String reviewDelete(HttpSession session, ReviewVO review, Model model) {
//			String sId = (String)session.getAttribute("sId");
//			if(sId == null || !sId.equals("admin")) {
//				model.addAttribute("msg", "잘못된 접근입니다");
//				return "html/member/review/fail_back";
//			}
			
			int deleteReviewCount = carItemService.deleteReview(review);
			
			if(deleteReviewCount < 0) {
				model.addAttribute("msg", "삭제 실패");
				return "html/car_item/review/fail_back";
			}
			
			int updateCount = carItemService.updateIdx(review);
			if(updateCount < 0) {
				model.addAttribute("msg", "업데이트 실패");
				return "html/car_item/review/fail_back";
			}
			
			return "redirect:/reviewList";
		}
		
		//리뷰게시판 글 수정 폼
		@GetMapping("reviewModify")
		public String reviewModify(HttpSession session, ReviewVO review, Model model, @RequestParam(defaultValue = "") String searchType, 
				@RequestParam(defaultValue = "") String searchKeyword, 
				@RequestParam(defaultValue = "1") int pageNum) {
			String sId = (String)session.getAttribute("sId");

			//글쓰기 제어 : admin이 아닐 때 예약이 있을 때
			if(sId == null || sId.length() == 0)
			{
				model.addAttribute("msg", "로그인해 주십시오."); // 로그인 안했을 때
				return "redirect:/login";
			}
			else
			{
				if(!sId.equals("admin@naver.com")) {
					int isBoardWriter = carItemService.isBoardWriter(sId);
					
					if(isBoardWriter == 0 ) {
						model.addAttribute("msg", "권한이 없습니다!");
						return "html/car_item/review/fail_back";
					}
				}
			}
			
			ReviewVO reviewResult = carItemService.reviewDetail(review);
			model.addAttribute("reviewDetail", reviewResult);
			
			return "html/car_item/review/review_modify_form";
		}
		
		// 리뷰게시판 글 수정
		@PostMapping("reviewModifyPro")
		public String reviewModifyPro(HttpSession session, ReviewVO review, Model model, @RequestParam(defaultValue = "") String searchType, 
				@RequestParam(defaultValue = "") String searchKeyword, 
				@RequestParam(defaultValue = "1") int pageNum) {
			String sId = (String)session.getAttribute("sId");

			//글쓰기 제어 : admin이 아닐 때 예약이 있을 때
			if(sId == null || sId.length() == 0)
			{
				model.addAttribute("msg", "로그인해 주십시오."); // 로그인 안했을 때
				return "redirect:/login";
			}
			else
			{
				if(!sId.equals("admin@naver.com")) {
					int isBoardWriter = carItemService.isBoardWriter(sId);
					
					if(isBoardWriter == 0 ) {
						model.addAttribute("msg", "권한이 없습니다!");
						return "html/car_item/review/fail_back";
					}
				}
			}
			
			
			
			
			
			
			int ModifySuccess = carItemService.modifyReview(review);
			
			int rev_star = review.getRev_star();
			if(ModifySuccess < 0) {
				model.addAttribute("msg", "수정 실패");
				return "html/car_item/review/fail_back";
			} else if (rev_star <= 0) {
				model.addAttribute("msg", "별점을 입력해주세요");
				return "html/car_item/review/fail_back";
			}				
			
			
			return "redirect:/reviewDetail?pageNum=" + pageNum + "&searchType=" + searchType + "&searchKeyword=" + searchKeyword + "&rev_idx=" + review.getRev_idx();
		}
		
		//=================================
		
		
		
	// 지점, 차량 타입, 연료 체크용 내부메서드
	private boolean checkListName(String name, List<String> nameList) {
		boolean result = false;
		for(String str : nameList) {
			if(str.equals(name)) {
				result = true;
				break;
			}
		}
		
		return result;
	}
	

}
