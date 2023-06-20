<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="rent_menu">
  <div>대여지점</div>
  
  <div class="rent_location">
    <select class="form-select" name="brc_rent_name" id="brc_rent_name">
	
		<c:choose>
			<c:when test="${!empty map.brc_name_list }">
		      	<c:forEach var="brc" items="${map.brc_name_list}">
		      		<option value="${brc }">${brc }</option>
		    	</c:forEach>
			</c:when>
			<c:otherwise>
		      <option value="서면점">서면역점</option>
		      <option value="구포역점">해운대역점</option>
		      <option value="부산역점">광안리역점</option>
		      <option value="부산역점">부전역점</option>
			</c:otherwise>
		</c:choose>
    </select>
  </div>

  <div>반납지점</div>
  <div class="return_location">
    <select class="form-select" name="brc_return_name" id="brc_return_name">
		<c:choose>
			<c:when test="${!empty map.brc_name_list }">
		      	<c:forEach var="brc" items="${map.brc_name_list}">
		      		<option value="${brc }">${brc }</option>
		    	</c:forEach>
			</c:when>
			<c:otherwise>
		      <option value="서면점">서면역점</option>
		      <option value="구포역점">해운대역점</option>
		      <option value="부산역점">광안리역점</option>
		      <option value="부산역점">부전역점</option>
			</c:otherwise>
		</c:choose>
    </select>
  </div>
  <div class="car_type">
    <div>차종</div>
    <ul>
      <li>
        <input
          class="btn-check car_type"
          checked="checked"
          type="checkbox"
          name="car_type"
          id="car_type1"
          value="경형/소형"
        />
        <label class="btn btn-outline-dark" for="car_type1">경형/소형</label>
      </li>
      <li>
        <input
          class="btn-check car_type"
          checked="checked"
          type="checkbox"
          name="car_type"
          id="car_type2"
          value="준중형"
        />
        <label class="btn btn-outline-dark" for="car_type2">준중형</label>
      </li>
      <li>
        <input
          class="btn-check car_type"
          checked="checked"
          type="checkbox"
          name="car_type"
          id="car_type3"
          value="중형"
        />
        <label class="btn btn-outline-dark" for="car_type3">중형</label>
      </li>
      <li>
        <input
          class="btn-check car_type"
          checked="checked"
          type="checkbox"
          name="car_type"
          id="car_type4"
          value="대형"
        />
        <label class="btn btn-outline-dark" for="car_type4">대형</label>
      </li>
      <li>
        <input
          class="btn-check car_type"
          checked="checked"
          type="checkbox"
          name="car_type"
          id="car_type5"
          value="SUV"
        />
        <label class="btn btn-outline-dark" for="car_type5">SUV</label>
      </li>
      <li>
        <input
          class="btn-check car_type"
          checked="checked"
          type="checkbox"
          name="car_type"
          id="car_type6"
          value="승합"
        /><label class="btn btn-outline-dark" for="car_type6">승합</label>
      </li>
      <li>
        <input
          class="btn-check car_type"
          checked="checked"
          type="checkbox"
          name="car_type"
          id="car_type7"
          value="수입"
        />
        <label class="btn btn-outline-dark" for="car_type7">수입</label>
      </li>
    </ul>
  </div>
  <div class="car_fuel">
    <div>연료</div>
    <ul>
      <li>
        <input
          class="btn-check car_fuel_type"
          checked="checked"
          type="checkbox"
          name="car_fuel_type"
          id="car_fuel_type1"
          value="가솔린"
        />
        <label class="btn btn-outline-dark" for="car_fuel_type1">가솔린</label>
      </li>
      <li>
        <input
          class="btn-check car_fuel_type"
          checked="checked"
          type="checkbox"
          name="car_fuel_type"
          id="car_fuel_type2"
          value="디젤"
        />
        <label class="btn btn-outline-dark" for="car_fuel_type2">디젤</label>
      </li>
      <li>
        <input
          class="btn-check car_fuel_type"
          checked="checked"
          type="checkbox"
          name="car_fuel_type"
          id="car_fuel_type3"
          value="LPG"
        />
        <label class="btn btn-outline-dark" for="car_fuel_type3">LPG</label>
      </li>
      <li>
        <input
          class="btn-check car_fuel_type"
          checked="checked"
          type="checkbox"
          name="car_fuel_type"
          id="car_fuel_type4"
          value="전기"
        />
        <label class="btn btn-outline-dark" for="car_fuel_type4">전기</label>
      </li>
      <li>
        <input
          class="btn-check car_fuel_type"
          checked="checked"
          type="checkbox"
          name="car_fuel_type"
          id="car_fuel_type5"
          value="하이브리드"
        />
        <label class="btn btn-outline-dark" for="car_fuel_type5">하이브리드</label>
      </li>
      <li>
        <input
          class="btn-check car_fuel_type"
          checked="checked"
          type="checkbox"
          name="car_fuel_type"
          id="car_fuel_type6"
          value="가솔린+LPG"
        />
        <label class="btn btn-outline-dark" for="car_fuel_type6">가솔린+LPG</label>
      </li>
    </ul>
  </div>
  <input class="btn submit_btn" type="submit" value="차량 검색하고 예약하기" />
</div>

<script type="text/javascript">


	// 차량 예약 페이지 열릴때 초기화 과정(get)
	function initRentMenu(){
		let getParams = new URL(location.href).searchParams;

		// 파라미터 체크 후 파라미터 값대로 체크박스 버튼들 셋팅하기
		
		
		
		// 만약 없을때에는 기본값(전체선택) 그대로
		if(getParams.size > 0){
			
			// 사용될 변수 등 초기화
			let car_typeCheckBox = document.querySelectorAll(".car_type");
			let car_fuel_typeCheckBox = document.querySelectorAll(".car_fuel_type");
			let brc_rent_nameSelect = document.querySelector("#brc_rent_name");
			let brc_return_nameSelect = document.querySelector("#brc_return_name");
			
			//체크박스 체크해제
			for(let d of car_typeCheckBox){
				d.checked = false;
			}		
			
			for(let d of car_fuel_typeCheckBox){
				d.checked = false;
			}		
			
			// ============= 지점명 체크 =============
			
			if(getParams.get("brc_rent_name") != null){
				brc_rent_nameSelect.value = getParams.get("brc_rent_name"); 
			}
			if(getParams.get("brc_return_name") != null){
				brc_return_nameSelect.value = getParams.get("brc_return_name");
			}
			
			 // ============= 차량타입, 연료 체크 =============
			
			if(getParams.getAll("car_type").length > 0){
				let t = getParams.getAll("car_type");
				for(let d of car_typeCheckBox){
					for(let k of t){
						if(d.value == k){
							d.checked=true;
							break;
						}
					}
				}		
			}
			else{ // 만약 차량타입 파라미터값 없을때 전부 체크로 되돌리기
				for(let d of car_typeCheckBox){
					d.checked = true;
				}		
			}
			
			if(getParams.getAll("car_fuel_type").length > 0){
				let t = getParams.getAll("car_fuel_type");
				for(let d of car_fuel_typeCheckBox){
					for(let k of t){
						if(d.value == k){
							d.checked=true;
							break;
						}
					}
				}
			}				
			else{ // 만약 차량연료 파라미터값 없을때 전부 체크로 되돌리기
				for(let d of car_fuel_typeCheckBox){
					d.checked = true;
				}		
			}
		}
		
		
	} // initMenu 끝
	
	function initRentMenuPost(){
		// 사용될 변수 등 초기화
		let car_typeCheckBox = document.querySelectorAll(".car_type");
		let car_fuel_typeCheckBox = document.querySelectorAll(".car_fuel_type");
		let brc_rent_nameSelect = document.querySelector("#brc_rent_name");
		let brc_return_nameSelect = document.querySelector("#brc_return_name");
		
		//체크박스 체크해제
		for(let d of car_typeCheckBox){
			d.checked = false;
		}		
		
		for(let d of car_fuel_typeCheckBox){
			d.checked = false;
		}		
		
		// ============= 지점명 체크 =============
			
		brc_rent_nameSelect.value = "${map.brc_rent_name}"; 

		brc_return_nameSelect.value = "${map.brc_return_name}";
		
		 // ============= 차량타입, 연료 체크 =============
		
		let type = "${map.car_type}".split(",").map(e => e.replace("[","").replace("]","").trim());
		for(let d of car_typeCheckBox){
			for(let k of type){
				if(d.value == k){
					d.checked=true;
					break;
				}
			}
		}		
		
		
		let fure = "${map.car_fuel_type}".split(",").map(e => e.replace("[","").replace("]","").trim());;
		
		for(let d of car_fuel_typeCheckBox){
			for(let k of fure){
				if(d.value == k){
					d.checked=true;
					break;
				}
			}
		}
	
	} //initRentMenuPost 끝
	
	// home 에서는 Map 에 파라미터들이 없기때문에 
	// 파라미터가 있는지 없는지에따라 초기화 방식 변경
	if("${map.isMapHaveParams}" == "false"){
		initRentMenu();	
	}
	else{
		initRentMenuPost();	
	}	
	
	
</script>
