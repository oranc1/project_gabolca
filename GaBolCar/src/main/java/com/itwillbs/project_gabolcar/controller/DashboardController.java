package com.itwillbs.project_gabolcar.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.project_gabolcar.service.BrcService;
import com.itwillbs.project_gabolcar.service.CarService;
import com.itwillbs.project_gabolcar.service.MemberService;
import com.itwillbs.project_gabolcar.service.ResService;

@Controller
public class DashboardController {
	
	@Autowired
	private CarService car_service;
	@Autowired
	private BrcService brc_service;
	@Autowired
	private MemberService mem_service;
	@Autowired
	private ResService res_service;
	
	@ResponseBody
    @RequestMapping(value = "dsbCarStatus",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String dsbCarStatus() {
    	List<Map<String, Object>> carStatus = car_service.dsbCarStatus();
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject col1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONObject col2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	
    	col1.put("id", "");
    	col1.put("label", "차량상태");
    	col1.put("pattern", "");
    	col1.put("type", "string");
    	 
    	col2.put("id", "");
    	col2.put("label", "통계");
    	col2.put("pattern", "");
    	col2.put("type", "number");

    	cols.put(col1);
    	cols.put(col2);

    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (Map<String, Object>map : carStatus){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
    	    JSONObject legend = new JSONObject();
    	    legend.put("v", map.get("car_status"));
//    	    legend.put("f", null);
    	    
    	    JSONObject value = new JSONObject();
    	    value.put("v", map.get("state_total"));
//    	    value.put("f", null);
    	 
    	    JSONArray cValueArry = new JSONArray();
    	    cValueArry.put(legend);
    	    cValueArry.put(value);
    	 
    	    JSONObject cValueObj = new JSONObject();
    	    cValueObj.put("c", cValueArry);
    	 
    	    rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    
    @ResponseBody
    @RequestMapping(value = "dsbCarType",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String dsbCarType() {
    	List<Map<String, Object>> carType = car_service.dsbCarType();
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject col1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONObject col2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	
    	col1.put("id", "");
    	col1.put("label", "차종");
    	col1.put("pattern", "");
    	col1.put("type", "string");
    	
    	col2.put("id", "");
    	col2.put("label", "통계");
    	col2.put("pattern", "");
    	col2.put("type", "number");
    	
    	cols.put(col1);
    	cols.put(col2);
    	
    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (Map<String, Object>map : carType){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
    		JSONObject legend = new JSONObject();
    		legend.put("v", map.get("car_type"));
//    	    legend.put("f", null);
    		
    		JSONObject value = new JSONObject();
    		value.put("v", map.get("count"));
//    	    value.put("f", null);
    		
    		JSONArray cValueArry = new JSONArray();
    		cValueArry.put(legend);
    		cValueArry.put(value);
    		
    		JSONObject cValueObj = new JSONObject();
    		cValueObj.put("c", cValueArry);
    		
    		rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    @ResponseBody
    @RequestMapping(value = "dsbUserAges",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String userAges() {
    	List<Map<String, Object>> userAges = mem_service.dsbUserAges();
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject col1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONObject col2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	
    	col1.put("id", "");
    	col1.put("label", "연령대");
    	col1.put("pattern", "");
    	col1.put("type", "string");
    	
    	col2.put("id", "");
    	col2.put("label", "이용통계");
    	col2.put("pattern", "");
    	col2.put("type", "number");
    	
    	cols.put(col1);
    	cols.put(col2);
    	
    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (Map<String, Object>map : userAges){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
    		JSONObject legend = new JSONObject();
    		legend.put("v", map.get("ages"));
//    	    legend.put("f", null);
    		
    		JSONObject value = new JSONObject();
    		value.put("v", map.get("count"));
//    	    value.put("f", null);
    		
    		JSONArray cValueArry = new JSONArray();
    		cValueArry.put(legend);
    		cValueArry.put(value);
    		
    		JSONObject cValueObj = new JSONObject();
    		cValueObj.put("c", cValueArry);
    		
    		rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    
    @ResponseBody
    @RequestMapping(value = "dsbBrcMonthlyCount",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String brcMonthlyCount() {
    	List<Map<String, Object>> brcList = brc_service.brcList();
    	List<Map<String, Object>> brcMonthlyCount = res_service.dsbBrcMonthlyCount(brcList);
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject colt = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	// colt 설정
    	colt.put("id", "");
    	colt.put("label", "월");
    	colt.put("pattern", "");
    	colt.put("type", "string");
    	cols.put(colt);
    	// 아래 for문이 돌면서 column 지점명컬럼 자동생성 및 B
    	String[] brcName = new String[brcList.size()];
    	for (int i=0; i < brcList.size(); i++) {
    		Map<String,Object> brc = brcList.get(i);
    		JSONObject col = new JSONObject();    //cols에 담을 JSONObject
    		col.put("id", "");
    		col.put("label", brc.get("brc_name"));
    		col.put("pattern", "");
    		col.put("type", "number");
    		cols.put(col);
    		brcName[i] = (String) brc.get("brc_name");
    	}
    	
    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (int i=0; i < brcMonthlyCount.size(); i++){        //brcMonthlyCount의 size만큼 실행
    		Map<String, Object> map = brcMonthlyCount.get(i);
    		JSONObject legend = new JSONObject();
    		legend.put("v", map.get("월"));
    		
    		JSONArray cValueArry = new JSONArray();
    		cValueArry.put(legend);
    		
    		for (int j=0; j < brcList.size(); j++) { // brcList 만큼 실행
    			JSONObject value = new JSONObject();
    			value.put("v", map.get(brcName[j]));
        		cValueArry.put(value);
    		}
    		
    		JSONObject cValueObj = new JSONObject();
    		cValueObj.put("c", cValueArry);
    		rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    
    @ResponseBody
    @RequestMapping(value = "dsbBrcMonthlySale",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String brcMonthlySale() {
    	List<Map<String, Object>> brcList = brc_service.brcList();
    	List<Map<String, Object>> brcMonthlySale = res_service.dsbBrcMonthlySale(brcList);
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject colt = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	// colt 설정
    	colt.put("id", "");
    	colt.put("label", "월");
    	colt.put("pattern", "");
    	colt.put("type", "string");
    	cols.put(colt);
    	// 아래 for문이 돌면서 column 지점명컬럼 자동생성 및 B
    	String[] brcName = new String[brcList.size()];
    	for (int i=0; i < brcList.size(); i++) {
    		Map<String,Object> brc = brcList.get(i);
    		JSONObject col = new JSONObject();    //cols에 담을 JSONObject
    		col.put("id", "");
    		col.put("label", brc.get("brc_name"));
    		col.put("pattern", "");
    		col.put("type", "number");
    		cols.put(col);
    		brcName[i] = (String) brc.get("brc_name");
    	}
    	
    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (int i=0; i < brcMonthlySale.size(); i++){        //brcMonthlyCount의 size만큼 실행
    		Map<String, Object> map = brcMonthlySale.get(i);
    		JSONObject legend = new JSONObject();
    		legend.put("v", map.get("월"));
    		
    		JSONArray cValueArry = new JSONArray();
    		cValueArry.put(legend);
    		
    		for (int j=0; j < brcList.size(); j++) { // brcList 만큼 실행
    			JSONObject value = new JSONObject();
    			value.put("v", map.get(brcName[j]));
    			cValueArry.put(value);
    		}
    		
    		JSONObject cValueObj = new JSONObject();
    		cValueObj.put("c", cValueArry);
    		rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    
    // 지점별 차종 보유현황
    @ResponseBody
    @RequestMapping(value = "dsbBrcHoldStatus",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
    public String brcHoldStatus() {
    	List<Map<String, Object>> brcList = brc_service.brcList();
    	List<Map<String, Object>> brcHoldStatus = car_service.dsbBrcHoldStatus(brcList);
    	// 전달데이터
    	JSONObject data = new JSONObject();
    	// cols 설정
    	JSONObject colt = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
    	// colt 설정
    	colt.put("id", "");
    	colt.put("label", "차종");
    	colt.put("pattern", "");
    	colt.put("type", "string");
    	cols.put(colt);
    	// 아래 for문이 돌면서 column 지점명컬럼 자동생성 및 B
    	String[] brcName = new String[brcList.size()];
    	for (int i=0; i < brcList.size(); i++) {
    		Map<String,Object> brc = brcList.get(i);
    		JSONObject col = new JSONObject();    //cols에 담을 JSONObject
    		col.put("id", "");
    		col.put("label", brc.get("brc_name"));
    		col.put("pattern", "");
    		col.put("type", "number");
    		cols.put(col);
    		brcName[i] = (String) brc.get("brc_name");
    	}
    	
    	// rows 설정
    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
    	for (int i=0; i < brcHoldStatus.size(); i++){        //brcMonthlyCount의 size만큼 실행
    		Map<String, Object> map = brcHoldStatus.get(i);
    		JSONObject legend = new JSONObject();
    		legend.put("v", map.get("차종"));
    		
    		JSONArray cValueArry = new JSONArray();
    		cValueArry.put(legend);
    		
    		for (int j=0; j < brcList.size(); j++) { // brcList 만큼 실행
    			JSONObject value = new JSONObject();
    			value.put("v", map.get(brcName[j]));
    			cValueArry.put(value);
    		}
    		
    		JSONObject cValueObj = new JSONObject();
    		cValueObj.put("c", cValueArry);
    		rows.put(cValueObj);
    	}
    	
    	// 전달데이터 cols, rows 추가
    	data.put("rows", rows);
    	data.put("cols", cols);
    	System.out.println(data.toString());
    	return data.toString();
    }
    
    // 지점 보유차량  
//    @ResponseBody
//    @RequestMapping(value = "dsbBrcHoldStatus",method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
//    public String brcHoldStatus() {
//    	List<Map<String, Object>> brcHoldStatus = car_service.dsbBrcHoldStatus();
//    	// 전달데이터
//    	JSONObject data = new JSONObject();
//    	// cols 설정
//    	JSONObject col1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
//    	JSONObject col2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
//    	JSONArray cols = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
//    	
//    	col1.put("id", "");
//    	col1.put("label", "지점명");
//    	col1.put("pattern", "");
//    	col1.put("type", "string");
//    	
//    	col2.put("id", "");
//    	col2.put("label", "보유현황");
//    	col2.put("pattern", "");
//    	col2.put("type", "number");
//    	
//    	cols.put(col1);
//    	cols.put(col2);
//    	
//    	// rows 설정
//    	JSONArray rows = new JSONArray();        //row JSONObject를 담을 JSONArray
//    	for (Map<String, Object>map : brcHoldStatus){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
//    		JSONObject legend = new JSONObject();
//    		legend.put("v", map.get("brc_name"));
////    	    legend.put("f", null);
//    		
//    		JSONObject value = new JSONObject();
//    		value.put("v", map.get("count"));
////    	    value.put("f", null);
//    		
//    		JSONArray cValueArry = new JSONArray();
//    		cValueArry.put(legend);
//    		cValueArry.put(value);
//    		
//    		JSONObject cValueObj = new JSONObject();
//    		cValueObj.put("c", cValueArry);
//    		
//    		rows.put(cValueObj);
//    	}
//    	
//    	// 전달데이터 cols, rows 추가
//    	data.put("rows", rows);
//    	data.put("cols", cols);
//    	System.out.println(data.toString());
//    	return data.toString();
//    }
}
