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
import com.itwillbs.project_gabolcar.vo.PaymentVO;
import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Controller
public class PaymentController {
	
	@Autowired PaymentService service;
	
	//차량 예약 정보 작성 폼
	@GetMapping("carRes/resPayment")
	public String resInfo(HttpSession session, Model model, @RequestParam Map<String,String> map) {
		
		// 세션 회원 정보 가져오기
		String id = (String)session.getAttribute("sId");
		
		if(id == null) {
			model.addAttribute("msg", "로그인 후 예약 가능합니다");
			return "html/member/notice/fail_back";
		}
		
		MemberVO member = service.getMemberInfo(id);
		model.addAttribute("member", member);
		
		// 파라미터로 넘긴 예약 정보 저장
		model.addAttribute("map", map);
		
		// 선택한 자동차 정보 가져오기
		CarVO carInfo = service.getCarName(map.get("car_idx"));
		model.addAttribute("carInfo", carInfo);
		
//		System.out.println(map);
		
		return "html/payment/res_info_form";
	}
	
	
	
	// 결제 완료 시
	@PostMapping("carRes/resInfoPro")
	public String resInfoPro(PaymentVO payment, ResInfoVO res, DriverVO driver, Model model, HttpSession session, @RequestParam String merchant_uid) {
		
		System.out.println(merchant_uid);
		
		String id = (String)session.getAttribute("sId");
		
		if(id == null) {
			model.addAttribute("msg", "접근 권한이 없습니다");
			return "html/member/notice/fail_back";
		}
//		System.out.println("id" + id);
		
		// 운전자 정보 저장
		int insertCount = service.insertDriver(driver);
		if(insertCount == 0) {
			model.addAttribute("msg", "예약 실패(운전자 정보)");
			return "html/member/notice/fail_back";
		}
		
		// 예약 정보 저장
		res.setMem_idx(service.getIdx(id)); // mem_idx 저장
		int resInsertCount = service.insertResInfo(res);
		
		if(resInsertCount == 0) {
			model.addAttribute("msg", "예약 실패(예약 정보)");
			return "html/member/notice/fail_back";
		}
		
		// 예약 번호 가져오기
		int res_idx = service.getResIdx();
		
		// 결제 정보 저장
//		System.out.println(payment);
		int paymentInsert = service.insertPayment(payment, res_idx);
		if(paymentInsert == 0) {
			model.addAttribute("msg", "예약 실패(결제 정보)");
			return "html/member/notice/fail_back";
		}
		
		// 완료 페이지에 출력할 정보 저장
		ResInfoVO resInfo = service.selectResInfo(res_idx);
		model.addAttribute("resInfoCom", resInfo);
		CarVO resCarInfo = service.selectCarName(res_idx);
		model.addAttribute("resCarInfo", resCarInfo);
		PaymentVO resPayInfo = service.selectPayInfo(res_idx);
		model.addAttribute("resPayInfo", resPayInfo);
		
		System.out.println(resInfo);
		
		
		

		return "html/payment/res_com";
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

	// 예약 취소 페이지
	@GetMapping("ResCancel")
	public String resCancel(@RequestParam int res_idx, Model model, HttpSession session) {

		String sId = (String) session.getAttribute("sId");

		if (sId == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "inc/fail_back";
		}

		ResInfoVO resInfo = service.selectResInfo(res_idx);
		model.addAttribute("resInfoCom", resInfo);
		CarVO resCarInfo = service.selectCarName(res_idx);
		model.addAttribute("resCarInfo", resCarInfo);
		PaymentVO resPayInfo = service.selectPayInfo(res_idx);
		model.addAttribute("resPayInfo", resPayInfo);

		return "html/payment/res_cancel";
	}

}

