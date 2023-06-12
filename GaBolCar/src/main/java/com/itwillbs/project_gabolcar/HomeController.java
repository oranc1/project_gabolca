package com.itwillbs.project_gabolcar;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "main";
	}
	
	// =========== 0610 경인 추가
	// 어떤 작업을 실패했을때 alert() 띄우고 이전페이지로 이동하게 해주는 페이지
	// redirect 시 파라미터 name 을 msg 로 설정해서 보내면 해당 파라미터안 문자열이 띄워짐 
	@GetMapping("failPage")
	public String failPage() {
		return "inc/fail_page";
	}

	
}
