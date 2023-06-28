package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.ResMapper;
import com.itwillbs.project_gabolcar.vo.PageInfo;
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

	// 예약 목록 조회 (관리자)
	public List<ResInfoVO> getResList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectResList(searchType, searchKeyword, startRow, listLimit);
	}
		
	// 목록 갯수 조회 요청 (관리자)
	public int getResListCount(String searchType, String searchKeyword) {
		return mapper.selectResListCount(searchType, searchKeyword);
	}
	// 예약 상세 조회 (관리자)
	public ResInfoVO getResDetail(int res_idx) {
		return mapper.selectResDetail(res_idx);
	}


	


}
