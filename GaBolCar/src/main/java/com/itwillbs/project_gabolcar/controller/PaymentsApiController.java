package com.itwillbs.project_gabolcar.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.http.HttpClient;
import java.security.Principal;
import java.util.Locale;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.itwillbs.project_gabolcar.service.PaymentApiService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@RestController
public class PaymentsApiController {
	
	private IamportClient iamportClientApi;
	
	@Autowired
	private PaymentApiService paymentService;

	//생성자로 rest api key와 secret을 입력해서 토큰 바로생성.
	public PaymentsApiController() {
		this.iamportClientApi = new IamportClient("2404075720330011", "CBluh7MJ0P26LfayrIotawnJ4VuEpkYbp6EDnGTRR2IGiCglzX7KYWYPA5knYg2gGRHqTkeVDPxLVzn1");
	}
	
	 // 결제검증을 위한 메서드
	@PostMapping("carRes/verifyIamport/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{
		return iamportClientApi.paymentByImpUid(imp_uid);
	}
	
	// 결제 환불
//	@PostMapping("cancelPayments")
//	public IamportResponse<Payment> cancelPayments(@RequestBody Map<String,String> map,
//			@AuthenticationPrincipal Principal principal) throws IamportResponseException, IOException {
//		
//		//조회
//		IamportResponse<Payment> lookUp = null;
//		if(map.containsKey("impUid")) lookUp = paymentLookup(map.get("impUid"));//들어온 정보에 imp_uid가 있을때
//		else if(map.containsKey("paymentsNo")) lookUp = paymentLookup(map.get("paymentsNo"));//imp_uid가 없을때
//		 
//		String code = paymentService.code(principal.getBankName());//은행코드
//		CancelData data = paymentService.cancelData(map,lookUp,principal,code);//취소데이터 셋업
//		IamportResponse<Payment> cancel = iamportClientApi.cancelPaymentByImpUid(data);//취소
//		
//		return cancel;
//	}
	
}
