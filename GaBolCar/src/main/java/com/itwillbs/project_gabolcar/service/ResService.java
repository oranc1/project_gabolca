package com.itwillbs.project_gabolcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.ResMapper;

@Service
public class ResService {

	@Autowired
	private ResMapper mapper;
	
	public List<Map<String, Object>> dsbBrcMonthlyCount(List<Map<String, Object>> brcList) {
		return mapper.dsbBrcMonthlyCount(brcList);
	}

}
