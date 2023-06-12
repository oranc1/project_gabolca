package com.itwillbs.project_gabolcar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.project_gabolcar.mapper.BrcMapper;

@Service
public class CarItemService {
	@Autowired
	BrcMapper brcMapper;
	
	public List<String> findBrcList(){
		// 변수 초기화
		List<String> brcList = new ArrayList<String>();
		List<Map<String, Object>> brcMapList = null;
		
		brcMapList = brcMapper.selectBrcList();
		if(brcMapList != null) {
			for(Map<String, Object> map : brcMapList) {
				brcList.add(map.get("brc_name").toString());
			} // for 문 끝
		}// if 문 끝
		return brcList;
	} // findBrcList 끝
}


