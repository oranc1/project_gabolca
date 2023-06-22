package com.itwillbs.project_gabolcar.controller;

import java.time.LocalDate;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.project_gabolcar.service.PaymentService;
import com.itwillbs.project_gabolcar.vo.CarVO;
import com.itwillbs.project_gabolcar.vo.DriverVO;
import com.itwillbs.project_gabolcar.vo.MemberVO;
import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Controller
public class PaymentController {
	
	@Autowired PaymentService service;
	
	//차량 예약 정보 작성 폼
	@GetMapping("carRes/resPayment")
	public String resInfo(HttpSession session, Model model, @RequestParam Map<String,String> map) {
		
		String id = (String)session.getAttribute("sId");
		MemberVO member = service.getMemberInfo(id);
		model.addAttribute("member", member);
		
		model.addAttribute("map", map);
		
		CarVO carInfo = service.getCarName(map.get("car_idx"));
		model.addAttribute("carInfo", carInfo);
		
		System.out.println(map);
		
		return "html/payment/res_info_form";
	}
	
	
	
	// 결제 완료 시
	@PostMapping("carRes/resInfoPro")
	public String resInfoPro(ResInfoVO res, DriverVO driver, Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("sId");
		System.out.println("id" + id);
		
		int insertCount = service.insertDriver(driver);
		if(insertCount < 0) {
			model.addAttribute("msg", "운전자 정보 insert 실패");
			return "html/notice/fail_back";
		}

		
		res.setMem_idx(service.getIdx(id));
		int resInsertCount = service.insertResInfo(res);
		
		
		
		
		
		
		return "redirect:/carRes/resCom";
	}
	
	// 차량 예약 완료 페이지
	@GetMapping("carRes/resCom")
	public String resResult() {
		
		return "html/payment/res_com";
	}
	
	// 차량 예약 완료 페이지
	@GetMapping("resCancelCom")
	public String resCancelCom() {
		return "html/payment/res_cancel_com";
	}
}
