package com.itwillbs.project_gabolcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CarItemController {
	
	//차량 예약 검색
	@GetMapping("carRes")
	public String carRes() {
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
