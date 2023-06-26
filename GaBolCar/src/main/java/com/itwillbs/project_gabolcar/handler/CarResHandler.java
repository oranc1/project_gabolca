package com.itwillbs.project_gabolcar.handler;

import java.time.LocalDateTime;
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
		jsonObj.put("nowPage", pageInfo.getNowPage());	
		
		return true;
	}

	public boolean jsonMap2PageInfo(Map<String,Object> jsonMap, PageInfo pageInfo) {
		pageInfo.setEndPage(Integer.parseInt((String)jsonMap.get("endPage")));
		pageInfo.setListCount(Integer.parseInt((String)jsonMap.get("listCount")));
		pageInfo.setPageListLimit(Integer.parseInt((String)jsonMap.get("pageListLimit")));
		pageInfo.setStartPage(Integer.parseInt((String)jsonMap.get("startPage"))); 
		pageInfo.setMaxPage(Integer.parseInt((String)jsonMap.get("maxPage")));
		pageInfo.setNowPage(Integer.parseInt((String)jsonMap.get("nowPage")));
		
		return true;
	}
	
	public int resPriceCal(LocalDateTime rentalDate , LocalDateTime returnDate
			,int weekdayPrice,int weekendPrice) {
		
		/* 계산방식 : 
		 * 
		 * 1.일단 rentalDate와 returnDate 의 사잇날을 구함
			ex) 렌탈 시작일이 6월 27일이고 반납일이 6월 29 일이면 2박 3일 즉 2박이 사잇날
			
			2. rentalDate와 하루뒤 정각 사이 시간을 구함 
			(27일 15시 예약시작이면 28일 00시 00분)
			2-1. return의 경우는 당일날 정각 시간을 구함
			(29일 15시 반납이면 29일 00시 00분)
			
			3. 사잇날은 for문 돌리기
			LocalDateTime 의 getMonth 를 이용하여 해당 일이 주말인지 아닌지 판단하여
			일당 금액을 계산
			
			4. rental 과 returnDate 는 2 에서 구해놓은 날을 이용하여 
			서로간의 시간,분 차이를 구함 
			그 뒤 rental 과 returnDate 가 주말인지 아닌지 판단하여 금액을 계산함
			단 분은 10분단위로 끊어서 계산
			
		*/ 
		
		LocalDateTime rentalDateP1 = LocalDateTime.of(
				rentalDate.getYear()
				,rentalDate.getMonthValue()
				,rentalDate.getDayOfMonth()
				,00,00,00
				);
		LocalDateTime returnDateP1 = LocalDateTime.of(
				returnDate.getYear()
				,returnDate.getMonthValue()
				,returnDate.getDayOfMonth()
				,00,00,00
				);
		return 0;
	}
}
