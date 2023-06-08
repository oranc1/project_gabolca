<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<input type="hidden" name="" value="">
	<div class="calender">
		<div class="cal_rent">
		
		
		<!-- 반납일 및 대여일 구역 -->
		
			<div class="cal_rent_day">
				<div class="cal_rent_day_title">대여일</div>
				<div>
					<span class="cal_rent_day_month">5월</span> <span
						class="cal_rent_day_date">13일</span>
				</div>
			</div>
			<!-- 			화살표이미지 -->
			<!-- 			<img alt="▶" src=""> -->
			<div class="cal_return_day">
				<div class="cal_return_day_title">반납일</div>
				<div>
					<span class="cal_return_day_month">5월</span> <span
						class="cal_return_day_date">15일</span>
				</div>
			</div>
		</div>



		<!-- 달력 모듈 요소 ! -->
		<!-- 해당 달력 모듈에선 값을 하나 선택할 경우 그 하나의 날짜만 리턴
			(ex 2021-06-20) 
			날짜 두개를 정상적으로 선택할 경우 to 와 공백으로 구분지어 보냄
			(ex 2021-06-20 to 2021-06-27) -->		
		<input type="hidden" class="flatpicker cal-input" name="rentDate" id="rentDate" 
		 data-id="inline" readonly="readonly" onchange="updateCalRent(this)">



		<!-- 시간 정하는 요소 ! -->
		
		
						<!-- 기본값으로 15시 설정 -->
		<div class="cal_hour">
			<div class="cal_hour_rent">
				<div>대여일시</div>
				<select name="rentHour" id="rentHour">
					<c:forEach var="i" begin="8" end="21">
						<c:choose>
							<c:when test="${ i == 15 }">
								<option value="${ i }" selected="selected">${ i }</option>
							</c:when>
							<c:when test="${ i < 10 }">
								<option value="0${ i }">0${ i }</option>
							</c:when>
							<c:otherwise>
								<option value="${ i }">${ i }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> <label for="rentHour">시</label> 
				
				<!-- 분 설정 -->
				<select name="rentMinute" id="rentMinute">				
					<c:forEach var="i" begin="0" end="50" step="10">
						<option value="${ i }">${ i }</option>
					</c:forEach>
				</select> <label for="rentMinute">분</label>
			</div>

			<!-- 반납일시 -->
			
						<!-- 기본값으로 15시 설정 -->
			<div class="cal_hour_return">
				<div>반납일시</div>

				<select name="returnHour" id="returnHour">
					<c:forEach var="i" begin="8" end="21">
						<c:choose>
						
							<c:when test="${ i == 15 }">
								<option value="${ i }" selected="selected">${ i }</option>
							</c:when>
							<c:when test="${ i < 10 }">
								<option value="${ i }">0${ i }</option>
							</c:when>
							<c:otherwise>
								<option value="${ i }">${ i }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> <label for="returnHour">시</label> 
				
				<!--  분 설정 -->
				<select name="returnMinute" id="returnMinute">
					<c:forEach var="i" begin="0" end="50" step="10">
							<option value="${ i }">${ i }</option>
					</c:forEach>
				</select> <label for="returnMinute">분</label>

			</div>
		</div>
	</div>
	
	<!-- 달력 기능 셋팅을 위한 스크립트 
		달력 태그가 오기전에 스크립트를 넣으면 적용안됨
		반드시 달력 태그 아래에 스크립트 넣기 !!!
	-->
	<script> 
	

	// 현재 날짜 시간 체크해서 이전 시간대이면 검색 안되도록 하기
	
	function menuCheck(){
		let nowDate = new Date();
		let calDate = $("#rentDate").val().split("to").map(e => e.trim());
		if(calDate.length == 2){
			let rentDate = new Date(calDate[0] + " " + $("#rentHour").val() + ":" +  $("#rentMinute").val() + ":00" );
			let returnDate = new Date(calDate[1] + " " + $("#returnHour").val() + ":" +  $("#returnMinute").val() + ":00" );
			
			if(rentDate < nowDate){
				alert("선택한 날짜, 시간이 현재 시간보다 이전시간대 입니다. 다시 선택해 주세요.");			
				return false;		
			}
			
		}
		return true;
	}	
	
	//달력 항목 선택 시 대여일 및 반납일
	
	function updateCalRent(val) {
		// 해당 달력 모듈에선 to 로 선택한 두 날짜를 구분지어 보내옴
		// 따라서 to 로 split 하기
		let strArr = val.value.split('to');
		
		if(strArr.length == 2){
			// to 로 분리 해도 불필요한 공백이 포함되어있으므로
			// 배열에서 받아오는 동시에 trim 으로 공백 제거
			
			//동시에 '-' 로 분리하기위해 다시 split 하기
			let rentD = strArr[0].trim().split('-');
			let returnD = strArr[1].trim().split('-');
			
			// 따라서 배열 첫번째는 년, 두번째는 월, 세번째는 일 로 구성됨
			
			// querySelector 로 대여일 반납일 요소 불러와서 텍스트 넣기
			let rentDayMonth = document.querySelector(".cal_rent_day_month");
			let rentDayDate = document.querySelector(".cal_rent_day_date");
			let returnDayMonth = document.querySelector(".cal_return_day_month");
			let returnDayDate = document.querySelector(".cal_return_day_date");
			
			rentDayMonth.textContent = parseInt(rentD[1]) + "월";
			rentDayDate.textContent = parseInt(rentD[2]) + "일";
			returnDayMonth.textContent = parseInt(returnD[1]) + "월";
			returnDayDate.textContent = parseInt(returnD[2]) + "일";
			
		}

	}
	//첫 시작시 대여일 반납일 초기화 메서드 수행
	
	function initCal() {
		
		let nowDate = new Date();
		let calInput = document.querySelector(".cal-input");
		
		// 만약 파라미터 값이 있을때 체크해서 있으면 파라미터 값으로 항목들 셋팅 
		let getParams = new URL(location.href).searchParams;
		
		
		if(getParams.size > 0){
			let date = getParams.get("rentDate").split("to").map(e => e.trim());
			
			// 시간 항목 체크
			
			$("#rentHour").val(getParams.get("rentHour")).prop("selected",true);
			$("#rentMinute").val(getParams.get("rentMinute")).prop("selected",true);
			$("#returnHour").val(getParams.get("returnHour")).prop("selected",true);
			$("#returnMinute").val(getParams.get("returnMinute")).prop("selected",true);
			
			// date 의 갯수가 2개여야 정상 동작함으로 따로 체크
			if(date.length == 2){
				flatpickr(".cal-input",{
					inline:true,
					mode:"range",
					minDate:"today",
					dateFormat: "Y-m-d",
					//기본 설정 날짜 지정
					defaultDate:[new Date(date[0]) , new Date(date[1])]
				});
			}
			else{	// date의 갯수가 비정상인 경우	
				flatpickr(".cal-input",{
					inline:true,
					mode:"range",
					minDate:"today",
					dateFormat: "Y-m-d",
					//기본 설정 날짜 지정
					defaultDate:[nowDate , new Date().fp_incr(2)]
				});
			}
			
		}	
		else{	
			// 시간값 설정 위한 변수 만들기
			// 현 시간보다 2시간 뒤로 설정
			let initTime = nowDate.getHours()+2;
			
			
			
			//최초 날짜 , 시간값 설정
			// 시간값 설정 시 오픈시간보다 뒤면 다음날 날짜로 지정, 시간은 8시로지정
			if(initTime >= 20) {
				initTime = "08";
				flatpickr(".cal-input",{
					inline:true,
					mode:"range",
					minDate:"today",
					dateFormat: "Y-m-d",
					//기본 설정 날짜 지정
					defaultDate:[new Date().fp_incr(1) , new Date().fp_incr(3)]
				});
			}
			else{
				if(initTime < 10) initTime = "0" + initTime; 
				flatpickr(".cal-input",{
					inline:true,
					mode:"range",
					minDate:"today",
					dateFormat: "Y-m-d",
					//기본 설정 날짜 지정
					defaultDate:[nowDate , new Date().fp_incr(2)]
				});
			}
			$("#rentHour").val(initTime);
		}

		
		updateCalRent(calInput);
		
	}
	initCal();
	
	</script>
	
	