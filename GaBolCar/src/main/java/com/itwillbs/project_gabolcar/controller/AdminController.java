package com.itwillbs.project_gabolcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	// 관리자) 차량 등록
	@GetMapping("a_carLeg")
	public String admCarLeg() {
		return "html/admin/adm_car_leg";
	}
	// ======================= 수정중 jsp ===========================

	@GetMapping("a_carLegModify")
	public String admCarLegModify() {
		return "html/admin/adm_car_modify";
	}

	@GetMapping("a_carSidebar")
	public String admSidebar() {
		return "html/admin/adm_sidebar";
	}
	

}
