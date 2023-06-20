package com.itwillbs.project_gabolcar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.project_gabolcar.service.DummyDbService;

@Controller
public class DummyController {
	
	@Autowired
	DummyDbService dummyService;
	//더미 만들기
	@GetMapping("dummyCarMakeStart")
	public String dummyCarMakeStart() {
		dummyService.carInfoDummyMaker();
		return "redirect:/";
	}
	@GetMapping("dummyResInfoMakeStart")
	public String dummyResInfoMakeStart() {
		dummyService.resInfoMaker();
		return "redirect:/";
	}
	@GetMapping("dummyCarOptionAdder")
	public String dummyCarOptionAdder() {
		dummyService.carOptionAdder();
		return "redirect:/";
	}
	
}
