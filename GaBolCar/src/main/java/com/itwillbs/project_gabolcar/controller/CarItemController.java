package com.itwillbs.project_gabolcar.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarItemController {
	
	//차량 예약 검색
	// 차 타입 하고 차 연료는 값 없는 경우 기본 값으로 받아오기
	@GetMapping("carRes")
	public String carRes(@RequestParam Map<String , String> map
			, @RequestParam(value="carType", defaultValue="경형,소형,준중형,중형,대형,suv,전기차") String[] carType
			, @RequestParam(value="carFure", defaultValue="휘발유,경유,하이브리드,전기") String[] carFure
			, Model model) {
		
		// null값으로 넘어오는 파라미터가 있는지, 달력체크가 잘못되어있는지 체크후 안맞으면 이전 페이지로 넘어가게 하기
		// 1. 날짜 to 없이 하나만 들어오거나 비어있는경우 and 시간이 영업시간이 ( 8 ~ 21시 사이) 아닌경우 - 하드코딩 가능
		// 2. 지점이 현재 영업하고 있는 지점이 아닌 경우 - db 찾기 작업 필요
		// 3. 차 타입 또는 차 연료타입이 선택지에 없는 항목들이 들어올 경우 - db 찾기 작업 필요? - 물어보기 아마 하드코딩일것 
		
		int rentHour = Integer.parseInt(map.get("rentHour"));
		int rentMinute = Integer.parseInt(map.get("rentMinute"));
		int returnHour = Integer.parseInt(map.get("returnHour"));
		int returnMinute = Integer.parseInt(map.get("returnMinute"));
		String[] date = map.get("rentDate").split("to");
		
		if(	//날짜 체크
			date.length != 2 
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
		for(int i = 0; i < date.length; i++) {
			date[i].trim();
		}
		
		// 
		
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
