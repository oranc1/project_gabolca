package com.itwillbs.project_gabolcar.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
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

import com.google.protobuf.*;
import com.itwillbs.project_gabolcar.service.CarItemService;
import com.itwillbs.project_gabolcar.vo.*;

@Controller
public class CarItemController {
	
	@Autowired
	CarItemService carItemService;
	
	// db 검색 없이 더미 데이터를 사용시
	static final boolean DUMMY_DATA_FLAG = true;
	
	//차량 예약 검색
	// 차 타입 하고 차 연료는 값 없는 경우 기본 값으로 받아오기
	@RequestMapping("carRes")
	public ModelAndView carRes(@RequestParam Map<String , String> map
			, @RequestParam(value="carType", defaultValue="경형/소형,준중형,중형,대형,SUV,승합,수입") String[] carType
			, @RequestParam(value="carFure", defaultValue="가솔린,디젤,LPG,전기,하이브리드,가솔린+LPG") String[] carFure
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

		// 지점 이름 등 데이터 저장할 Map 객체 
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 지점 이름 받을 변수
		List<String> brcNameList = null;
		
		// 지점이름 더미데이터
		List<String> brcNameDummy = new ArrayList<String>(Arrays.asList("서면점","구포역점","부산역점"));
		
		
		// 파라미터로 보내온 지점 이름 넣을 변수
		String rentLocation = map.get("rentLocation"); 
		String returnLocation = map.get("returnLocation"); 
		
		// 차량 타입 , 연료 데이터
		List<String> carTypeList = new ArrayList<String>(Arrays.asList("경형/소형","준중형","중형","대형","SUV","승합","수입"));
		List<String> carFureList = new ArrayList<String>(Arrays.asList("가솔린","디젤","LPG","전기","하이브리드","가솔린+LPG"));	
		
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
			
			System.out.println(nowDate);
			// 기본 렌트 시간은 현 시간보다 + 2
			int rentTime = nowDate.getHour() + 2;
			System.out.println(rentTime);
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
				
				LocalDateTime rentDateTime 
				= LocalDateTime.of(
						Integer.parseInt(rentSplit[0]), 
						Integer.parseInt(rentSplit[1]),
						Integer.parseInt(rentSplit[2]),
						rentHour,rentMinute,0);	
				LocalDateTime returnDateTime 
				= LocalDateTime.of(
						Integer.parseInt(returnSplit[0]), 
						Integer.parseInt(returnSplit[1]),
						Integer.parseInt(returnSplit[2]),
						returnHour,returnMinute,0);	
				
				if(rentDateTime.isAfter(returnDateTime)) {
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
			brcNameList = carItemService.findBrcList();
		}
		else {
			brcNameList = brcNameDummy;
		}
		
		// 지점리스트에 있는지 없는지 확인
		// 파라미터가 아예 비어있으면 리스트의 가장 첫번째값으로 설정

		// 통과 되었는지 체크하는 변수
		boolean checkResult = true;
		if(brcNameList != null && !DUMMY_DATA_FLAG) {
			// rentLocation 체크
			//파라미터 비어있는지 체크
			if(rentLocation != null) {				
				if(!checkListName(rentLocation, brcNameList)) {
					checkResult = false;
				}
			}
			// 파라미터 비어있으면 지점리스트의 가장 첫번째값으로
			else {
				rentLocation = brcNameList.get(0);
			}
			
			// returnLocation 체크
			//파라미터 비어있는지 체크
			if(returnLocation != null ) {				
				if(!checkListName(returnLocation, brcNameList)) {
					checkResult = false;
				}
			}
			// 파라미터 비어있으면 지점리스트의 가장 첫번째값으로
			else {
					returnLocation = brcNameList.get(0);
			}
		}
		else {
			// 더미데이터로 유효성 체크
			
			// rentLocation 체크
			//파라미터 비어있는지 체크
			if(rentLocation != null) {				
				if(!checkListName(rentLocation, brcNameDummy)) {
					checkResult = false;
				}
			}
			// 파라미터 비어있으면 지점리스트의 가장 첫번째값으로
			else {
				rentLocation = brcNameDummy.get(0);
			}
			
			// returnLocation 체크
			//파라미터 비어있는지 체크
			if(returnLocation != null ) {				
				if(!checkListName(returnLocation, brcNameDummy)) {
					checkResult = false;
				}
			}
			// 파라미터 비어있으면 지점리스트의 가장 첫번째값으로
			else {
					returnLocation = brcNameDummy.get(0);
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
		if(carType.length <= carTypeList.size() || carFure.length <= carFureList.size() ) {
			int countCheckTrue1 = 0;
			for(String str : carType) {	
				if(checkListName(str, carTypeList)) {
					countCheckTrue1++;
				}
				System.out.println(str  + " / " + countCheckTrue1);
			}
			if(carType.length != countCheckTrue1) {
				checkResult = false;				
			}
			
			int countCheckTrue2 = 0;
			for(String str : carFure) {			
				if(checkListName(str, carFureList)) {
					countCheckTrue2++;
				}
				System.out.println(str  + " / " + countCheckTrue2);
			}
			if(carFure.length != countCheckTrue2) {
				checkResult = false;				
			}
		}
		else {
			checkResult = false;		
		}
		System.out.println(carType.length + " / " + carTypeList.size()  + " / " +  carFure.length  + " / " +  carFureList.size());
		if(!checkResult) {
			// 에러 메시지 추가 후 fail_back 이동
			model.addAttribute("msg", "차량 타입 또는 연료가 잘못된 값 입니다! 다시 선택해주세요");
			return new ModelAndView("inc/fail_back","map",resultMap);
		}
		//=========== 차량 타입, 연료 체크 끝 ===========
		
		
		//================ map에 값들 셋팅하기
		resultMap.put("DUMMY_DATA_FLAG", DUMMY_DATA_FLAG);

		// 시간값 넣기
		resultMap.put("rentHour",rentHour );
		resultMap.put("rentMinute",rentMinute );
		resultMap.put("returnHour", returnHour);
		resultMap.put("returnMinute", returnMinute);
		resultMap.put("rentDate", rentDate);
		resultMap.put("returnDate", returnDate);
		
		// 렌트 지역값 넣기
		resultMap.put("brcNameList", brcNameList);
		resultMap.put("rentLocation", rentLocation);
		resultMap.put("returnLocation", returnLocation);
		
		// 차량 타입 연료 값 넣기
		// String[] 배열 형식으로 넣으면 제대로 된 값이 넘어가지 않으므로
		// new ArrayList(Arrays.asList()) 로 변환해서 넣기
		resultMap.put("carType", new ArrayList(Arrays.asList(carType)));
		resultMap.put("carFure", new ArrayList(Arrays.asList(carFure)));
		
		
		return new ModelAndView("html/car_item/res/car_res","map",resultMap) ;
	}
	// 예약 차량 상세 정보
	@GetMapping("carRes/carResInfo")
	public String carIntroduce() {
		return "html/car_item/res/car_res_info";
	}

	//차량 소개
	@GetMapping("carInfoList")
	public String carInfo() {
		return "html/car_item/car_info_list";
	}
	
	//============ 리뷰 =================
	
	// 리뷰 게시판
	@GetMapping("review")
	public String reviewBoard(Model model) {
	
	List<ReviewVO> reviewList = carItemService.getReviewList();
	
	model.addAttribute("reviewList", reviewList);
	
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
	
	//더미 만들기
	@GetMapping("dummyCarMakeStart")
	public String dummyCarMakeStart() {
		carItemService.carInfoDummyMaker();
		return "redirect:/";
	}
	
}
