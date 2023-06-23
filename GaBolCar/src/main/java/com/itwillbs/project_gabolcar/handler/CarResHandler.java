package com.itwillbs.project_gabolcar.handler;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.itwillbs.project_gabolcar.vo.PageInfo;


public class CarResHandler {
	public boolean pageInfo2JsonObj(JSONObject jsonObj, PageInfo pageInfo) {
		jsonObj.put("endPage", pageInfo.getEndPage());			
		jsonObj.put("listCount", pageInfo.getListCount());			
		jsonObj.put("pageListLimit", pageInfo.getPageListLimit());			
		jsonObj.put("startPage", pageInfo.getStartPage());			
		jsonObj.put("maxPage", pageInfo.getMaxPage());			
		jsonObj.put("pageInfo", pageInfo.getNowPage());	
		
		return true;
	}

	public boolean jsonMap2PageInfo(Map<String,Object> jsonMap, PageInfo pageInfo) {
		pageInfo.setEndPage(Integer.parseInt((String)jsonMap.get("endPage")));
		pageInfo.setListCount(Integer.parseInt((String)jsonMap.get("listCount")));
		pageInfo.setPageListLimit(Integer.parseInt((String)jsonMap.get("pageListLimit")));
		pageInfo.setStartPage(Integer.parseInt((String)jsonMap.get("startPage"))); 
		pageInfo.setMaxPage(Integer.parseInt((String)jsonMap.get("maxPage")));
		pageInfo.setNowPage(Integer.parseInt((String)jsonMap.get("pageInfo")));
		
		return true;
	}
	
	
}
