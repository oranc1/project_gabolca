package com.itwillbs.project_gabolcar.handler;

import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

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
	
	// Timestamp 를 LocalDateTime 로 변환
	public LocalDateTime tStamp2Ldt(Timestamp timestamp) {
		if(timestamp == null) {
			return null;
		}
		return LocalDateTime.ofInstant(Instant.ofEpochSecond(timestamp.getTime())
				,TimeZone.getDefault().toZoneId());
	}
	
	
	// 날짜 문자열 시간 문자열 , 그리고 각각 구분되는 문자(ex 2022-03-21 일때 중간에 "-" 문자)
	// 를 입력받아 분리하고 LocalDateTime 으로 반환해주는 핸들러
	// 단! 날짜는 년,월,일 시간은 시,분,초 로 받음
	public LocalDateTime str2Ldt(String day,String daySplitStr,String time, String timeSplitStr) {
		if(day == null || daySplitStr == null || time == null || timeSplitStr == null
				|| day.equals("")|| daySplitStr.equals("")|| time.equals("")|| timeSplitStr.equals("")) {
			return null;
		}
		String[] daySplit = day.split(daySplitStr);
		String[] timeSplit = time.split(timeSplitStr);
		return LocalDateTime.of(
				Integer.parseInt(daySplit[0]), 
				Integer.parseInt(daySplit[1]),
				Integer.parseInt(daySplit[2]),
				Integer.parseInt(timeSplit[0]),
				Integer.parseInt(timeSplit[1]),
				Integer.parseInt(timeSplit[2].replace(".",""))
				);	
	}
	
	// 차량 주간,주말을 고려한 예약 비용 계산
	public int resPriceCal(LocalDateTime rentalDate , LocalDateTime returnDate
			,int weekdayPrice,int weekendPrice) {
		
		/* 계산방식 : 
		 * 
		 * 1.일단 rentalDate와 returnDate 의 사잇날을 구함
			ex) 렌탈 시작일이 6월 27일이고 반납일이 6월 29 일이면 2박 3일
			이중 사이에 낀 날이 하루임으로 1일
			
			
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
		
		//사잇날 구하기 (ChronoUnit 사용)
		int betweenDay = (int)ChronoUnit.DAYS.between(rentalDate.toLocalDate(), returnDate.toLocalDate()) - 1;
		System.out.println(betweenDay);
		// 사잇날을 제외한 시작,반납 일의 비용을 계산
		LocalDateTime rentalDateP1 = rentalDate.plusDays(1);
		LocalDateTime rd1 = LocalDateTime.of(
				rentalDateP1.getYear()
				,rentalDateP1.getMonthValue()
				,rentalDateP1.getDayOfMonth()
				,00,00,00
				);
		LocalDateTime rd2 = LocalDateTime.of(
				returnDate.getYear()
				,returnDate.getMonthValue()
				,returnDate.getDayOfMonth()
				,00,00,00
				);
		
		// 시작일-다음날 정각까지 시간
        int rentalMinuteRaw = (int)ChronoUnit.MINUTES.between(rentalDate, rd1);
        int rentalHour = rentalMinuteRaw / 60;
        int rentalMinute = rentalMinuteRaw - (rentalHour * 60);
        
        int returnMinuteRaw = (int)ChronoUnit.MINUTES.between(rd2, returnDate);
        int returnHour = returnMinuteRaw / 60;
        int returnMinute = returnMinuteRaw - (returnHour * 60);
        
        //주말 체크하는 변수
        // 1~7 까지 반복 6, 7 이 주말!
        // 초기값은 렌트 시작(retalDate) 다음날로!
        int weekCount = rentalDate.getDayOfWeek().getValue() + 1; 
      
        // 최종 금액 리턴해주는 변수
        int result = 0;
        
        // 사잇날 금액을 구하기
        // 만약 사잇날이 0 이하면 패스
        for(int i = 0; i < betweenDay; i++ ) {       
        	if(weekCount > 7) weekCount = 1;
        
        	//주말이면 주말가로 더하기
        	if(weekCount == 6 || weekCount == 7) {
        		result += weekendPrice;
        	}
        	// 아니면 주중가로 더하기
        	else {
        		result += weekdayPrice;
        	}
        	weekCount++;
        	
        }
        
        // 시작 당일, 반납 당일 비용 구하기
        int rentalWeek = rentalDate.getDayOfWeek().getValue();
        if(rentalWeek == 6 || rentalWeek == 7) {
        	result += (weekendPrice/24) * rentalHour;
        	result += (weekendPrice/24/60) * rentalMinute;
        }
        else {
        	result += (weekdayPrice/24) * rentalHour;
        	result += (weekdayPrice/24/60) * rentalMinute;
        }
        int returnWeek = returnDate.getDayOfWeek().getValue();
        if(returnWeek == 6 || returnWeek == 7) {
        	result += (weekendPrice/24) * returnHour;
        	result += (weekendPrice/24/60) * returnMinute;
        }
        else {
        	result += (weekdayPrice/24) * returnHour;
        	result += (weekdayPrice/24/60) * returnMinute;
        }
        
        // 10의 자리수는 버리고 리턴
		return (result/100)*100;
	}
}
