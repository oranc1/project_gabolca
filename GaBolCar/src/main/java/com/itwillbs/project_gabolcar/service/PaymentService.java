package com.itwillbs.project_gabolcar.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.PaymentMapper;
import com.itwillbs.project_gabolcar.vo.CarVO;
import com.itwillbs.project_gabolcar.vo.DriverVO;
import com.itwillbs.project_gabolcar.vo.MemberVO;
import com.itwillbs.project_gabolcar.vo.PaymentVO;
import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Service
public class PaymentService {
	
	@Autowired PaymentMapper mapper;

	public MemberVO getMemberInfo(String id) {
		return mapper.selectMemberInfo(id);
	}

	public int insertDriver(DriverVO driver) {
		return mapper.insertDriver(driver);
	}

	public int insertResInfo(ResInfoVO res) {
		return mapper.insertResInfo(res);
	}

	public Integer getIdx(String id) {
		return mapper.getIdx(id);
	}

	public CarVO getCarName(String string) {
		return mapper.getCarName(string);
	}

	public int getResIdx() {
		return mapper.getResIdx();
	}

	public int insertPayment(PaymentVO payment, int res_idx) {
		return mapper.insertPayment(payment, res_idx);
	}

	public ResInfoVO selectResInfo(int res_idx) {
		return mapper.selectResInfo(res_idx);
	}

	public CarVO selectCarName(int res_idx) {
		return mapper.selectCarName(res_idx);
	}

	public PaymentVO selectPayInfo(int res_idx) {
		return mapper.selectPayInfo(res_idx);
	}

	
	//총금액
	public PaymentVO totalPay(int res_idx) {
		
		return mapper.selectTotal(res_idx);
	}


	
	
	
	
}