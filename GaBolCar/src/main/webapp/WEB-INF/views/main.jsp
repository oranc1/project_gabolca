<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gabolcar</title>

<!-- css -->
<link
	href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/resources/css/inc/top.css"
	rel="styleSheet">
<link
	href="${pageContext.request.contextPath }/resources/css/inc/footer.css"
	rel="styleSheet">
<link
	href="${pageContext.request.contextPath }/resources/css/inc/side_inquiry_btn.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/resources/css/inc/flatpickr.min.css"
	rel="styleSheet">
<link
	href="${pageContext.request.contextPath }/resources/css/inc/calender.css"
	rel="styleSheet">

<link
	href="${pageContext.request.contextPath }/resources/css/inc/rentMenu.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/css/main.css"
	rel="stylesheet">

<!-- js -->
<script
	src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/inc/flatpickr.js"></script>

</head>
<body>
	<nav>
		<jsp:include page="inc/top1.jsp"></jsp:include>
	</nav>
	

		<form id="car_search_form" action="carRes" method="post" onsubmit="return menuCheck()">

			<div class="main_visual">
				<div class="main_cont inr">
					<div class="main_txt">
						<p class="top_t">
							<span>똑똑한</span> 선택! &nbsp;<span>즐거운</span> 여행!
						</p>
						<p class="main_t">
							<span>믿고 타는 <br>
							<b>GABOLCAR</b>,
							</span><br> 지금 바로 떠나세요!
						</p>
						<div class="txt_op">
							<p>신차급차량/공항에서 5분 거리</p>
							<p>다양한 전기차 라인업&충전료 무료</p>
							<p>부산 여행 렌트는 가볼카에서</p>
						</div>
					</div>
					<div class="main_cal">
					
							<div class="main_wrap cal_box">
								<div class="cal_wrap">
									<jsp:include page="inc/calender.jsp"></jsp:include>
								</div>
								<div class="rentMenu_wrap">
									<jsp:include page="inc/rentMenu.jsp"></jsp:include>
								</div>
							</div>
						
					</div>
				</div>

			</div>
		</form>
<!-- 	</main> -->

	<%-- 부트스트랩 그리드를 사용하여 컨텐츠 위치 설정
	1. 맨 앞 태그 class 부분에
	container 또는 container-fluid 를 넣기 (container-fluid는 width 가 항상 100%)
	
	2. 다음 태그 class 부분에 row 를 넣어
	이 태그 안쪽부분을 행으로 쓸것이다 선언
	
	3. 다음 태그에  col-n(1~12) 를 넣어 차지할 공간을 설정함
	
	# offset-n(1~11) 를 넣어 일정 크기만큼 띄워줄수 있으며
	order-n 등등 다양한 그리드 관련 클래스를 사용할 수 있음
	--%>

	<!-- 렌트 추천 구역 -->
	<article class="car_recom_warp">
		<div class="">
			<div class="car_recom_title">이달의 추천 차량</div>
		</div>
		<div class="car_recom_list_wrap">
			<c:choose>
				<c:when test="${!empty map.car_populer_list and fn:length(map.car_populer_list) <= 4}">
					<c:forEach var="populer_car"  items="${map.car_populer_list }" varStatus="i">			
					<div class="car_recom_item${i.index + 1 }">
						<a href="javascript:populerCarSearch('${populer_car.car_type }', '${populer_car.car_fuel_type }')">
							<div>
								<div class="car_img_wrap_box">
									<p class="img_tit">인기</p>
									<img class="car_recom_img" alt=""
										src="${pageContext.request.contextPath}/resources/upload/car/${populer_car.car_file_path}/${populer_car.car_file1}" >
								</div>
								<div class="car_recom_info_wrap">
									<p class="car_recom_into_company">${populer_car.car_company}</p>
									<p class="car_recom_info_model">
										${populer_car.car_model}
										<span>${populer_car.car_old}년식 / </span><span>${populer_car.car_fuel_type}</span>
									</p>
<!-- 									<div class="car_recom_info_list"> -->
<!-- 									</div> -->
									<p class="car_recom_info_price">일 <span>${populer_car.car_weekdays}</span> 원</p>
								</div>
							</div>
						</a>
					</div>
					</c:forEach>
				</c:when> <%-- map.car_populer_list 있을때 --%>
				<c:otherwise> <%-- 더미값 --%>
				<div class="car_recom_item1">
					<div>
						<img class="car_recom_img" alt=""
							src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/캐스퍼.png">
						<div class="car_recom_info_wrap">
							<p class="car_recom_into_company">현대</p>
							<p class="car_recom_info_model">
								캐스퍼 1.0 NA 인스퍼레이션
							</p>
							<div class="car_recom_info_list">
								<span>21년식 / </span><span>가솔린</span>
							</div>
							<p class="car_recom_info_price">일 <span>50,000</span> 원</p>
						</div>
					</div>
				</div>
				<div class="car_recom_item2">
					<div>
						<img class="car_recom_img" alt=""
							src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/캐스퍼.png">
						<div class="car_recom_info_wrap">
							<p class="car_recom_into_company">현대</p>
							<p class="car_recom_info_model">
								캐스퍼 1.0 NA 인스퍼레이션
							</p>
							<div class="car_recom_info_list">
								<span>21년식 / </span><span>가솔린</span>
							</div>
							<p class="car_recom_info_price">일 <span>50,000</span> 원</p>
						</div>
					</div>
				</div>
				<div class="car_recom_item3">
					<div>
						<img class="car_recom_img" alt=""
							src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/캐스퍼.png">
						<div class="car_recom_info_wrap">
							<p class="car_recom_into_company">현대</p>
							<p class="car_recom_info_model">
								캐스퍼 1.0 NA 인스퍼레이션
							</p>
							<div class="car_recom_info_list">
								<span>21년식 / </span><span>가솔린</span>
							</div>
							<p class="car_recom_info_price">일 <span>50,000</span> 원</p>
						</div>
					</div>
				</div>
				<div class="car_recom_item4">
					<div>
						<img class="car_recom_img" alt=""
							src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/캐스퍼.png">
						<div class="car_recom_info_wrap">
							<p class="car_recom_into_company">현대</p>
							<p class="car_recom_info_model">
								캐스퍼 1.0 NA 인스퍼레이션
							</p>
							<div class="car_recom_info_list">
								<span>21년식 / </span><span>가솔린</span>
							</div>
							<p class="car_recom_info_price">일 <span>50,000</span> 원</p>
						</div>
					</div>
				</div>
				</c:otherwise>
			</c:choose>
		</div>
	</article>

	<!--  고객 리뷰 구역 !  -->
	<article class="review_wrap">
		<div class="review_inn_box">
			<div class="review_tit_box">
				<div class="review_title">고객 리뷰</div>
				<input type="button"
					class="review_list_btn"
					value="더보기"
					onclick="location.href='${pageContext.request.contextPath }/reviewList'">
			</div>
			<div
				class="review_list_wrap">
				<%--	리뷰 컨텐츠들을 가로 세로 전부 중앙에 오도록 설정하기
			
				d-flex : display:flex 와 동일한 동작 
					- 현 요소가 col 을 설정하고 있을시
					 css 에 display:flex를 넣어도 동작을 하지 않음
					 따라서 d-flex 로 지정하여 사용
					 flex box 의 설정값들도 css 가 아닌 부트스트랩을 사용해서 지정해야함 	
			align-items-center :  align-items:center 와 동일
			justify-content-center : justify-content:center 와 동일  --%>
	
				<c:choose>
					<c:when test="${!empty map.car_rev_list}">
						<c:forEach var="rev_car"  items="${map.car_rev_list }" varStatus="i">
							<div class="review-wrap${i.index + 1 }">
								<div class="">
									<span class="review-star">
										<c:forEach var="star" begin="1" end="${rev_car.rev_star }" >
											<span class="fill">★</span>
										</c:forEach>	
	<%-- 									<c:forEach var="unStar" begin="1" end="${ 5 - rev_car.rev_star }" > --%>
	<!-- 										<span>★</span> -->
	<%-- 									</c:forEach>	 --%>
									</span> <br>
									<span class="review-car-name">${rev_car.car_model }(${rev_car.car_company })</span>
									<div class="review-content">
										<p>${rev_car.rev_subject}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					
					<c:otherwise>
					
<!-- 						<div -->
<!-- 							class="review-wrap1"> -->
<!-- 							<div class=""> -->
<!-- 								<span class="review-star">5.0</span> <span class="review-car-name">차량이름</span> -->
<!-- 								<div class="review-content"> -->
<!-- 									<p>리뷰내용 21313</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div -->
<!-- 							class="mt-2 col-2  d-flex align-items-center justify-content-center review-wrap2"> -->
<!-- 							<div class=""> -->
<!-- 								<span class="review-star">5.0</span> <span class="review-car-name">차량이름2</span> -->
<!-- 								<div class="review-content"> -->
<!-- 									<p>리뷰내용 21313</p> -->
<!-- 								</div> -->
			
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div -->
<!-- 							class="mt-2 col-2  d-flex align-items-center justify-content-center review-wrap3"> -->
<!-- 							<div class=""> -->
<!-- 								<span class="review-star">5.0</span> <span class="review-car-name">차량이름3</span> -->
<!-- 								<div class="review-content"> -->
<!-- 									<p>리뷰내용 21313</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div -->
<!-- 							class="mt-2 col-2  d-flex align-items-center justify-content-center review-wrap4"> -->
<!-- 							<div class=""> -->
<!-- 								<span class="review-star">5.0</span> <span class="review-car-name">차량이름3</span> -->
<!-- 								<div class="review-content"> -->
<!-- 									<p>리뷰내용 21313</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</c:otherwise>
				</c:choose>		
			</div>
		</div>
	</article>



	<!-- QnA 구역 ! -->
	<article class="qna_wrap ">

		<div class="qna_title_wrap">
			<div class="qna_title">자주 묻는 질문</div>
			<input
				class="qna_title_btn"
				type="button" value="더보기"
				onclick="location.href='${pageContext.request.contextPath }/siteFAQ'">
		</div>

		<div class="qna_list_wrap">

			<div>
				<span>Q</span>
				<a href="${pageContext.request.contextPath }/siteFAQ?FAQ=2"
					class="">카시트 등 부가서비스는
					어떻게 이용하나요?</a>
<!-- 					<input type="button" value="▶" -->
<!-- 					class="btn_typeB2 qna_btn" -->
<%-- 					onclick="location.href='${pageContext.request.contextPath }/siteFAQ?FAQ=2'"> --%>
			</div>
			<div>
				<span>Q</span>
				<a href="${pageContext.request.contextPath }/siteFAQ?FAQ=3"
					class="">해외에 거주하고 있는데 예약 및 이용이 가능한가요?</a>
<!-- 					<input type="button" value="▶" -->
<!-- 					class="btn_typeB2 qna_btn" -->
<%-- 					onclick="location.href='${pageContext.request.contextPath }/siteFAQ?FAQ=3'"> --%>
			</div>
			<div>
				<span>Q</span>
				<a href="${pageContext.request.contextPath }/siteFAQ?FAQ=4"
					class="">사고 또는 고장 발생시 어떻게
					해야하나요?</a>
<!-- 					<input type="button" value="▶" -->
<!-- 					class="btn_typeB2 qna_btn" -->
<%-- 					onclick="location.href='${pageContext.request.contextPath }/siteFAQ?FAQ=4'"> --%>
			</div>
			<div>
				<span>Q</span>
				<a href="${pageContext.request.contextPath }/siteFAQ?FAQ=1"
					class="">예약취소 했는데 언제 환불
					되나요?</a>
<!-- 					<input type="button" value="▶" -->
<!-- 					class="btn_typeB2 qna_btn" -->
<%-- 					onclick="location.href='${pageContext.request.contextPath }/siteFAQ?FAQ=1'"> --%>
			</div>

		</div>
	</article>


	<jsp:include page="inc/footer.jsp"></jsp:include>

	<jsp:include page="inc/side_inquiry_btn.jsp"></jsp:include>

	<%-- 추천 차량 항목 선택시 해당 차 타입에 맞춰서 검색하도록 구현 --%>
	<script type="text/javascript">
	function populerCarSearch(carType, carFuelType){
		let form = document.querySelector("#car_search_form");
		let submitBtn = document.querySelector(".submit_btn");
		let car_typeCheckBox = document.querySelectorAll(".car_type");
		let car_fuel_typeCheckBox = document.querySelectorAll(".car_fuel_type");
		
		console.log(carType + carFuelType);
		
		//체크박스 체크해제
		for(let d of car_typeCheckBox){
			d.checked = false;
		}		
		
		for(let d of car_fuel_typeCheckBox){
			d.checked = false;
		}		
		
		 // ============= 차량타입, 연료 체크 =============
		
		if(carType.length > 0){
			for(let d of car_typeCheckBox){
				if(d.value == carType){
					d.checked = true;
					break;
				}	
			}		
		}
		else{ // 만약 차량타입 파라미터값 없을때 전부 체크로 되돌리기
			for(let d of car_typeCheckBox){
				d.checked = true;
			}		
		}
		
		if(carFuelType.length > 0){
			for(let d of car_fuel_typeCheckBox){
				if(d.value == carFuelType){
					d.checked = true;
					break;
				}
			}
		}				
		else{ // 만약 차량연료 파라미터값 없을때 전부 체크로 되돌리기
			for(let d of car_fuel_typeCheckBox){
				d.checked = true;
			}		
		}
		form.submit();
	}
	</script>
</body>
</html>