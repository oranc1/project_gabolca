package com.itwillbs.project_gabolcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.PaymentMapper;
import com.itwillbs.project_gabolcar.vo.CarVO;
import com.itwillbs.project_gabolcar.vo.DriverVO;
import com.itwillbs.project_gabolcar.vo.MemberVO;
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

	
	
	
	
}
