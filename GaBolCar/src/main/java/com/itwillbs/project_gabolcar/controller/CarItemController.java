package com.itwillbs.project_gabolcar.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarItemController {
	
	// db 검색 없이 더미 데이터를 사용시
	static final boolean DUMMY_DATA_FLAG = true;
	
	//차량 예약 검색
	// 차 타입 하고 차 연료는 값 없는 경우 기본 값으로 받아오기
	@GetMapping("carRes")
	public String carRes(@RequestParam Map<String , String> map
			, @RequestParam(value="carType", defaultValue="경형,소형,준중형,중형,대형,suv,전기차") String[] carType
			, @RequestParam(value="carFure", defaultValue="휘발유,경유,하이브리드,전기") String[] carFure
			, Model model) {
		
		// 초기값 셋팅
		
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

		System.out.println(date);
		// null값으로 넘어오는 파라미터가 있는지, 달력체크가 잘못되어있는지 체크후 안맞으면 이전 페이지로 넘어가게 하기
		// 1. 날짜 to 없이 하나만 들어오거나 비어있는경우 and 시간이 영업시간이 ( 8 ~ 21시 사이) 아닌경우 - 하드코딩 가능
		// 2. 지점이 현재 영업하고 있는 지점이 아닌 경우 - db 찾기 작업 필요
		// 3. 차 타입 또는 차 연료타입이 선택지에 없는 항목들이 들어올 경우 - db 찾기 작업 필요? - 물어보기 아마 하드코딩일것 
		

		if(map.size() <= 0 || date == null) {
			//=========== 날짜 체크 ===========
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
			System.out.println("rentHour : "+ rentHour +" rentMinute : " + rentMinute +
					" returnHour : " + returnHour +" returnMinute : "+ returnMinute +
					" date : " + date +" dateArr : " + dateArr +" rentDate : " + rentDate +
					" returnDate : " + returnDate);
			//=========== 날짜 체크 끝 ===========
			
			return "html/car_item/res/car_res";
			
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
			
			if(	//날짜 체크
				dateArr.length != 2 
				//시간 체크
				|| (rentHour < 8 || rentHour > 21)
				|| (rentMinute > 50 || rentMinute < 0) 
				|| (rentMinute%10 != 0)
				|| (returnHour < 8 || returnHour > 21)
				|| (returnMinute > 50 || returnMinute < 0)
				|| (returnMinute%10 != 0)
				// 지점 체크는 추후 추가
					) { 
				model.addAttribute("msg","기간이나 시간이 허용되지 않는 값 입니다! 다시 선택해주세요");
				return "redirect:/failPage";
			}
			for(int i = 0; i < dateArr.length; i++) {
				dateArr[i].trim();
			}
			// 날짜 공백 제거
			// 공백제거 후 값 셋팅
			rentDate = dateArr[0];
			returnDate = dateArr[1];
			
		} // else 문 끝
		
		System.out.println("rentHour : "+ rentHour +" rentMinute : " + rentMinute +
				" returnHour : " + returnHour +" returnMinute : "+ returnMinute +
				" date : " + date +" dateArr : " + dateArr +" rentDate : " + rentDate +
				" returnDate : " + returnDate);

		//=========== 날짜 체크 끝 ===========
		
		return "html/car_item/res/car_res";
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
	public String reviewBoard() {
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
	
	
	
}
