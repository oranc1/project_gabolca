package com.itwillbs.project_gabolcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	
	//차량 예약 정보 작성 폼
	@GetMapping("resPayment")
	public String resInfo() {
		return "html/payment/res_info_form";
	}
	
	// 차량 예약 완료 페이지
	@GetMapping("resCom")
	public String resResult() {
		return "html/payment/res_com";
	}
	
	// 차량 예약 완료 페이지
	@GetMapping("resCancelCom")
	public String resCancelCom() {
		return "html/payment/res_cancel_com";
	}
}
