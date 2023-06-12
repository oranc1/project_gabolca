package com.itwillbs.project_gabolcar.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.project_gabolcar.service.BrcService;
import com.itwillbs.project_gabolcar.service.CarService;
import com.itwillbs.project_gabolcar.vo.CarVO;

@Controller
public class AdminConroller {

	@Autowired
	private CarService car_service;
	@Autowired
	private BrcService brc_service;
	
	// 대시보드 이동
	@GetMapping("admDash")
	public String admDash() {
		return "html/admin/adm_dash";
	}
	
	// 차량리스트 이동
	@GetMapping("admCarList")
	public ModelAndView admCarList() {
		List<Map<String, Object>> carList = car_service.carList();
		return new ModelAndView("html/admin/adm_car_list","carList",carList);
	}
	
	// 지점리스트 이동
	@GetMapping("admBrcList")
	public ModelAndView admBrcList() {
		List<Map<String, Object>> brcList = brc_service.brcList();
		return new ModelAndView("html/admin/adm_brc_list","brcList",brcList);
	}
	
	// 차량등록폼 이동
	@GetMapping("CarRegister")
	public String carRegister(Model model) {
		List<Map<String, Object>> brcList = brc_service.brcList();
		model.addAttribute("brcList",brcList);
		return "html/admin/car_register";
	}
	
	// 차량등록
	@PostMapping("CarRegisterPro")
	public String carRegisterPro(CarVO car, Model model) {
		int insertCount = car_service.carRegister(car);
		if (insertCount == 0 ) {
			model.addAttribute("msg","등록 실패");
			return "fail_back";
		}
		return "redirect:/admCarList";
	}
	
	// 지점등록폼 이동
	@GetMapping("brcRegister")
	public String brcRegister() {
		return "html/admin/brc_register";
	}
	
	// 지점등록
	@PostMapping("brcRegisterPro")
	public String brcRegisterPro(@RequestParam Map<String, String> map, Model model) {
		int insertCount = brc_service.brcRegister(map);
		if (insertCount == 0) {
			model.addAttribute("msg","등록 실패");
			return "fail_back";
		}
		return "close";
	}
	
	// 지점수정폼 이동
	@GetMapping("brcUpdate")
	public ModelAndView brcUpdate(@RequestParam int brc_idx) {
		Map<String, Object> brc = brc_service.brcSelect(brc_idx);
		return new ModelAndView("html/admin/brc_update","brc",brc);
	}
	
	// 지점수정
	@PostMapping("brcUpdatePro")
	public String brcUpdatePro(@RequestParam Map<String, String> map,Model model) {
		int updateCount = brc_service.brcUpdate(map);
		if (updateCount == 0) {
			model.addAttribute("msg","수정 실패");
			return "fail_back";
		}
		return "close";
	}
	
	// 지점삭제
	@GetMapping("brcDeletePro")
	public String brcDeletePro(int brc_idx,Model model) {
		int deleteCount = brc_service.brcDelete(brc_idx);
		if (deleteCount == 0) {
			model.addAttribute("msg","삭제 실패");
			return "fail_back";
		}
		return "redirect:/admBrcList";
	}
	
	// 차량수정폼 이동
	@GetMapping("carUpdate")
	public String carUpdate(@RequestParam int car_idx,Model model) {
		Map<String, Object> car = car_service.carSelect(car_idx);
		model.addAttribute("car",car);
		List<Map<String, Object>> brcList = brc_service.brcList();
		model.addAttribute("brcList",brcList);
		return "html/admin/car_update";
	}
	
	// 차량수정
	@PostMapping("carUpdatePro")
	public String carUpdatePro(@RequestParam Map<String, String> map, Model model) {
		int updateCount = car_service.carUpdate(map);
		if (updateCount == 0) {
			model.addAttribute("msg","수정 실패");
			return "fail_back";
		}
		return "redirect:/admCarList";
	}
	
	// 차량삭제
	@GetMapping("carDeletePro")
	public String carDeletePro(int car_idx,Model model) {
		int deleteCount = car_service.carDelete(car_idx);
		if (deleteCount == 0) {
			model.addAttribute("msg","삭제 실패");
			return "fail_back";
		}
		return "redirect:/admCarList";
	}
	
	//옵션리스트 이동 - 디자인이 어려움
	@GetMapping("optionList")
	public String optionList() {
		return "html/admin/option_list";
	}
	
}
