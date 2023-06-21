package com.itwillbs.project_gabolcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.PaymentMapper;
import com.itwillbs.project_gabolcar.vo.DriverVO;
import com.itwillbs.project_gabolcar.vo.MemberVO;

@Service
public class PaymentService {
	
	@Autowired PaymentMapper mapper;

	public MemberVO getMemberInfo(String id) {
		return mapper.selectMemberInfo(id);
	}

	public int insertDriver(DriverVO driver) {
		return mapper.insertDriver(driver);
	}
	
	
	
}
