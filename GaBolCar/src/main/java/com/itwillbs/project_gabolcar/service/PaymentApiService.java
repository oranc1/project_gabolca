package com.itwillbs.project_gabolcar.service;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Service
public class PaymentApiService {

	/**
	 * 결제 취소할때 필요한 파라미터들을
	 * CancelData에 셋업해주고 반환함.
	 * @param map
	 * @param impUid
	 * @param bankAccount
	 * @param code
	 * @return
	 * @throws RefundAmountIsDifferent 
	 */
//	@Transactional
//	public CancelData cancelData(Map<String,String> map, 
//			IamportResponse<Payment> lookUp,
//			Principal principal, String code) {
//		//아임포트 서버에서 조회된 결제금액 != 환불(취소)될 금액 이면 예외발생
//		if(lookUp.getResponse().getAmount()!=new BigDecimal(map.get("checksum"))) 		
//		CancelData data = new CancelData(lookUp.getResponse().getImpUid(),true);
//		data.setReason(map.get("reason"));
//		data.setChecksum(new BigDecimal(map.get("checksum")));
//		data.setRefund_holder(map.get("refundHolder"));
//		data.setRefund_bank(code);
//		data.setRefund_account(principal.getBankName());
//		return data;
//	}
}
