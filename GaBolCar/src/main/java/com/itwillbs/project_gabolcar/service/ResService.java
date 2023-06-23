package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.ResMapper;
import com.itwillbs.project_gabolcar.vo.ResInfoVO;

@Service
public class ResService {

	@Autowired
	private ResMapper mapper;
	
	public List<Map<String, Object>> dsbBrcMonthlyCount(List<Map<String, Object>> brcList) {
		return mapper.dsbBrcMonthlyCount(brcList);
	}

	//예약조회 띄우기
	public List<ResInfoVO> getResInfo(String sId) {
		
		return mapper.selectResInfo(sId);
	}

	public ResInfoVO detail(int res_idx) {
		// TODO Auto-generated method stub
		return mapper.selectDetail(res_idx);
	}

	public List<Map<String, Object>> dsbBrcMonthlySale(List<Map<String, Object>> brcList) {
		return mapper.dsbBrcMonthlySale(brcList);
	}



}
