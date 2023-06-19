package com.itwillbs.project_gabolcar.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.project_gabolcar.service.CarItemService;

import com.itwillbs.project_gabolcar.service.CarService;
import com.itwillbs.project_gabolcar.vo.*;

@Controller
public class CarItemController {
	
	@Autowired
	CarItemService carItemService;

	@Autowired
	CarService carService;
	
	
	
	// db 검색 없이 더미 데이터를 사용시
	static final boolean DUMMY_DATA_FLAG = false;
	
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
				
				if(res_rental_date.isAfter(res_return_date)) {
					// 에러 메시지 추가 후 fail_back 이동
					model.addAttribute("msg", "기간이 허용되지 않는 값 이거나 당일 예약으로 선택되었습니다! 다시 선택해주세요");
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
		resultMap.put("res_rental_date",Timestamp.valueOf( res_rental_date) );
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
		pageInfo.setEndPage(returnMinute);
		pageInfo.setListCount(1);
		pageInfo.setPageListLimit(8);
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
				pageInfo.setMaxPage((carItemService.getCarCount()/pageInfo.getPageListLimit())+1);
				
				if(resultMap.get("car_order_by").equals("populer")) {					
					//차량 인기순위 검색후 넣기
					resultMap.put("car_populer_list", carItemService.getCarPopuler());
				}
				
				// 페이지 정보 현황 넣기
				resultMap.put("pageInfo", pageInfo);			
				
				// 현재 car_res 페이지에서 차량을 찾는다는 확인 문구를 넣기
				resultMap.put("carRes", "true");
				// 차량 종류를 정해서 찾는다는 확인 문구 보내기
				resultMap.put("car_search", "true");			
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
		
		return new ModelAndView("html/car_item/res/car_res","map",resultMap) ;
	}
	// 예약 차량 상세 정보
	@GetMapping("carRes/carResInfo")
	public String carIntroduce() {
		return "html/car_item/res/car_res_info";
	}

	//차량 소개
	@GetMapping("carInfoList")
	public ModelAndView carInfo() {
	List<Map<String, Object>> carInfoList = carItemService.carInfoList();
	return new ModelAndView("html/car_item/car_info_list","carInfoList",carInfoList);
	}
	
	//============ 리뷰 =================
	
	// 리뷰 게시판
	@GetMapping("review")
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
	}
	
	// 리뷰 글 자세히 보기
	@GetMapping("review/detail")
	public String reviewDetail() {
		return "html/car_item/review/review_detail";
	}
	
	// 리뷰 쓰기 폼
	@GetMapping("review/write")
	public String reviewWrite() {
		return "html/car_item/review/review_write_form";
	}
	
	// 리뷰 수정 폼 
	@GetMapping("review/modify")
	public String reviewModify() {
		return "html/car_item/review/review_modify_form";
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
