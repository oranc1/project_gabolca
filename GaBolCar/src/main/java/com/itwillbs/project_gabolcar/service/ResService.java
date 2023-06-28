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

	// 예약 목록 조회
	public List<Map<String, Object>> resList(Map<String, Object> map) {
		PageInfo pageInfo = null;
		if(map.get("pageInfo") != null) {			
			pageInfo = (PageInfo)map.get("pageInfo");
			map.put("pageItemStart", pageInfo.getNowPage() * pageInfo.getPageListLimit());
		}
		
		return mapper.selectResList(pageInfo,map);
	}

	


}
