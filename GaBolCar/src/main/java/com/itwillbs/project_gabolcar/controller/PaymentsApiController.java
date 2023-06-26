package com.itwillbs.project_gabolcar.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@RestController
public class PaymentsApiController {

	private IamportClient iamportClientApi;
	
	//생성자로 rest api key와 secret을 입력해서 토큰 바로생성.
	public PaymentsApiController() {
		this.iamportClientApi = new IamportClient("2404075720330011", "CBluh7MJ0P26LfayrIotawnJ4VuEpkYbp6EDnGTRR2IGiCglzX7KYWYPA5knYg2gGRHqTkeVDPxLVzn1");
	}
	
//	@Autowired
//	private PaymentServiceApi paymentService;
	
	/*
	 * 결제검증을 위한 메서드
	 */
	@PostMapping("carRes/verifyIamport/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{
		System.out.println(imp_uid);
		return iamportClientApi.paymentByImpUid(imp_uid);
	}
	
	
	
	
	
	
	
}
