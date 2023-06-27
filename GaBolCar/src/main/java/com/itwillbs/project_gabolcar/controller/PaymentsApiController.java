package com.itwillbs.project_gabolcar.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.http.HttpClient;
import java.security.Principal;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.itwillbs.project_gabolcar.service.PaymentApiService;
import com.itwillbs.project_gabolcar.vo.PaymentVO;
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
	@PostMapping("cancelPayments")
	@ResponseBody
	public ResponseEntity<?> cancelPayments(@RequestBody Map<String, String> map) throws Exception {
		
		System.out.println("취소 정보" + map);
		
		HashMap<String, String> response = new HashMap<>();
        // 캔슬 데이터
		CancelData cancelData = new CancelData(map.get("merchant_uid"), false);
        // 캔슬
		iamportClientApi.cancelPaymentByImpUid(cancelData);
        // DB 처리(res_cancel insert, pay_info update)
		
		
		response.put("response","success");
		System.out.println("response" + response);
        return ResponseEntity.ok(response);
	}
	
}
