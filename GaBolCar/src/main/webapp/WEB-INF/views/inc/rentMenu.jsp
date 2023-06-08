<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<div class="rent_menu">
  <div>대여지점</div>
  <div class="rent_location">
    <select class="form-select" name="rentLocation" id="rentLocation">
      <option value="서면점">서면점</option>
      <option value="구포역점">구포역점</option>
      <option value="부산역점">부산역점</option>
    </select>
  </div>

  <div>반납지점</div>
  <div class="return_location">
    <select class="form-select" name="returnLocation" id="returnLocation">
      <option value="서면점">서면점</option>
      <option value="구포역점">구포역점</option>
      <option value="부산역점">부산역점</option>
    </select>
  </div>
  <div class="car_type">
    <div>차종</div>
    <ul>
      <li>
        <input
          class="btn-check carType"
          checked="checked"
          type="checkbox"
          name="carType"
          id="carType1"
          value="경형"
        />
        <label class="btn btn-outline-dark" for="carType1">경형</label>
      </li>
      <li>
        <input
          class="btn-check carType"
          checked="checked"
          type="checkbox"
          name="carType"
          id="carType2"
          value="소형"
        /><label class="btn btn-outline-dark" for="carType2">소형</label>
      </li>
      <li>
        <input
          class="btn-check carType"
          checked="checked"
          type="checkbox"
          name="carType"
          id="carType3"
          value="준중형"
        />
        <label class="btn btn-outline-dark" for="carType3">준중형</label>
      </li>
      <li>
        <input
          class="btn-check carType"
          checked="checked"
          type="checkbox"
          name="carType"
          id="carType4"
          value="중형"
        />
        <label class="btn btn-outline-dark" for="carType4">중형</label>
      </li>
      <li>
        <input
          class="btn-check carType"
          checked="checked"
          type="checkbox"
          name="carType"
          id="carType5"
          value="대형"
        />
        <label class="btn btn-outline-dark" for="carType5">대형</label>
      </li>
      <li>
        <input
          class="btn-check carType"
          checked="checked"
          type="checkbox"
          name="carType"
          id="carType6"
          value="suv"
        />
        <label class="btn btn-outline-dark" for="carType6">SUV</label>
      </li>
      <li>
        <input
          class="btn-check carType"
          checked="checked"
          type="checkbox"
          name="carType"
          id="carType7"
          value="전기차"
        />
        <label class="btn btn-outline-dark" for="carType7">전기차</label>
      </li>
    </ul>
  </div>
  <div class="car_fuel">
    <div>연료</div>
    <ul>
      <li>
        <input
          class="btn-check carFure"
          checked="checked"
          type="checkbox"
          name="carFure"
          id="carFure1"
          value="휘발유"
        />
        <label class="btn btn-outline-dark" for="carFure1">휘발유</label>
      </li>
      <li>
        <input
          class="btn-check carFure"
          checked="checked"
          type="checkbox"
          name="carFure"
          id="carFure2"
          value="경유"
        />
        <label class="btn btn-outline-dark" for="carFure2">경유</label>
      </li>
      <li>
        <input
          class="btn-check carFure"
          checked="checked"
          type="checkbox"
          name="carFure"
          id="carFure3"
          value="하이브리드"
        />
        <label class="btn btn-outline-dark" for="carFure3">하이브리드</label>
      </li>
      <li>
        <input
          class="btn-check carFure"
          checked="checked"
          type="checkbox"
          name="carFure"
          id="carFure4"
          value="전기"
        />
        <label class="btn btn-outline-dark" for="carFure4">전기</label>
      </li>
    </ul>
  </div>
  <input class="btn submit_btn" type="submit" value="차량 검색하고 예약하기" />
</div>

<script type="text/javascript">


	// 차량 예약 페이지 열릴때 초기화 과정	
	function initRentMenu(){
		let getParams = new URL(location.href).searchParams;
		
		if(getParams.size > 0){
			let carTypeCheckBox = document.querySelectorAll(".carType");
			let carFureCheckBox = document.querySelectorAll(".carFure");
			let rentLocationSelect = document.querySelector("#rentLocation");
			let returnLocationSelect = document.querySelector("#returnLocation");
			
			for(let d of carTypeCheckBox){
				d.checked = false;
			}		
			
			for(let d of carFureCheckBox){
				d.checked = false;
			}		
			
			if(getParams.get("rentLocation") != null){
				rentLocationSelect.value = getParams.get("rentLocation"); 
			}
			if(getParams.get("returnLocation") != null){
				returnLocationSelect.value = getParams.get("returnLocation");
			}
			
			
			if(getParams.getAll("carType").length > 0){
				let t = getParams.getAll("carType");
				for(let d of carTypeCheckBox){
					for(let k of t){
						if(d.value == k){
							d.checked=true;
							break;
						}
					}
				}		
			}
			else{
				for(let d of carTypeCheckBox){
					d.checked = true;
				}		
			}
			
			if(getParams.getAll("carFure").length > 0){
				let t = getParams.getAll("carFure");
				for(let d of carFureCheckBox){
					for(let k of t){
						if(d.value == k){
							d.checked=true;
							break;
						}
					}
				}
			}				
			else{
				for(let d of carFureCheckBox){
					d.checked = true;
				}		
			}
		}
		
		
	} // initMenu 끝
	
	initRentMenu();
</script>
