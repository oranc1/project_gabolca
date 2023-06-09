<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	

		<form action="carRes" method="get" onsubmit="return menuCheck()">

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
	<article class="container-fluid mx-auto car_recom_warp">
		<div class="row">
			<div class="col-5  car_recom_title">이달의 추천 차량</div>
		</div>
		<div
			class="row align-items-center car_recom_list_wrap justify-content-center">
			<div
				class="mt-2 col-2 d-flex align-items-center justify-content-center car_recom_item1">
				<div>
					<img class="car_recom_img" alt=""
						src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/캐스퍼.png">
					<div class="car_recom_info_wrap">
						<p class="car_recom_info_model">캐스퍼 1.0 NA 인스퍼레이션</p>
						<div class="car_recom_info_list">
							<span>21년식</span><span>가솔린</span>
						</div>
						<p class="car_recom_info_price">일 50,000 원</p>
					</div>
				</div>
			</div>
			<div
				class="mt-2 col-2 d-flex align-items-center justify-content-center car_recom_item2">
				<div>
					<img class="car_recom_img" alt=""
						src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/캐스퍼.png">
					<div class="car_recom_info_wrap">
						<p class="car_recom_info_model">캐스퍼 1.0 NA 인스퍼레이션</p>
						<div class="car_recom_info_list">
							<span>21년식</span><span>가솔린</span>
						</div>
						<p class="car_recom_info_price">일 50,000 원</p>
					</div>
				</div>
			</div>
			<div
				class="mt-2 col-2 d-flex align-items-center justify-content-center car_recom_item3">
				<div>
					<img class="car_recom_img" alt=""
						src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/캐스퍼.png">
					<div class="car_recom_info_wrap">
						<p class="car_recom_info_model">캐스퍼 1.0 NA 인스퍼레이션</p>
						<div class="car_recom_info_list">
							<span>21년식</span><span>가솔린</span>
						</div>
						<p class="car_recom_info_price">일 50,000 원</p>
					</div>
				</div>
			</div>
			<div
				class="mt-2 col-2 d-flex align-items-center justify-content-center car_recom_item4">
				<div>
					<img class="car_recom_img" alt=""
						src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/캐스퍼.png">
					<div class="car_recom_info_wrap">
						<p class="car_recom_info_model">캐스퍼 1.0 NA 인스퍼레이션</p>
						<div class="car_recom_info_list">
							<span>21년식</span><span>가솔린</span>
						</div>
						<p class="car_recom_info_price">일 50,000 원</p>
					</div>
				</div>
			</div>
		</div>
	</article>



	<!--  고객 리뷰 구역 !  -->
	<article class="container-fluid mx-auto review_wrap">
		<div class="row">
			<div class="col-3  review_title">고객리뷰</div>
			<input type="button"
				class="offset-sm-6  offset-lg-8  offset-md-7 col-1 btn btn-outline-warning review_list_btn"
				value="더보기"
				onclick="location.href='${pageContext.request.contextPath }/review'">
		</div>
		<div
			class="row align-items-center review_list_wrap justify-content-center">
			<%--	리뷰 컨텐츠들을 가로 세로 전부 중앙에 오도록 설정하기
		
			d-flex : display:flex 와 동일한 동작 
				- 현 요소가 col 을 설정하고 있을시
				 css 에 display:flex를 넣어도 동작을 하지 않음
				 따라서 d-flex 로 지정하여 사용
				 flex box 의 설정값들도 css 가 아닌 부트스트랩을 사용해서 지정해야함 	
		align-items-center :  align-items:center 와 동일
		justify-content-center : justify-content:center 와 동일  --%>


			<div
				class="mt-2 col-2  d-flex align-items-center justify-content-center review-wrap1">
				<div class="">
					<span class="review-star">5.0</span> <span class="review-car-name">차량이름</span>
					<div class="review-content">
						<p>리뷰내용 21313</p>
					</div>
				</div>
			</div>
			<div
				class="mt-2 col-2  d-flex align-items-center justify-content-center review-wrap2">
				<div class="">
					<span class="review-star">5.0</span> <span class="review-car-name">차량이름2</span>
					<div class="review-content">
						<p>리뷰내용 21313</p>
					</div>

				</div>
			</div>
			<div
				class="mt-2 col-2  d-flex align-items-center justify-content-center review-wrap3">
				<div class="">
					<span class="review-star">5.0</span> <span class="review-car-name">차량이름3</span>
					<div class="review-content">
						<p>리뷰내용 21313</p>
					</div>
				</div>
			</div>
			<div
				class="mt-2 col-2  d-flex align-items-center justify-content-center review-wrap4">
				<div class="">
					<span class="review-star">5.0</span> <span class="review-car-name">차량이름3</span>
					<div class="review-content">
						<p>리뷰내용 21313</p>
					</div>
				</div>
			</div>
		</div>
	</article>



	<!-- QnA 구역 ! -->
	<article class="container-fluid mx-auto qna_wrap ">

		<div class="row qna_title_wrap">
			<div class="col-sm-4 col-md-3 qna_title">자주 묻는 질문</div>
			<input
				class="offset-sm-4 offset-md-7 offset-lg-8 col-1 btn btn-outline-warning qna_title_btn"
				type="button" value="더보기"
				onclick="location.href='${pageContext.request.contextPath }/siteFAQ'">
		</div>

		<div class="row align-items-center qna_list_wrap">

			<div>
				<a href="${pageContext.request.contextPath }/siteFAQ?FAQ=2"
					class="col-xs-8 col-sm-5  col-md-4 col-xl-3 offset-1">Q. 카시트 등 부가서비스는
					어떻게 이용하나요?</a> <input type="button" value="▶"
					class=" btn btn-outline-warning col-1 offset-xs-1 offset-sm-2 offset-md-5 offset-xl-6 btn_typeB2 qna_btn"
					onclick="location.href='${pageContext.request.contextPath }/siteFAQ?FAQ=2'">
			</div>
			<div>
				<a href="${pageContext.request.contextPath }/siteFAQ?FAQ=3"
					class="col-xs-8 col-sm-5 col-md-4 col-xl-3 offset-1">Q. 해외에 거주하고 있는데 예약
					및 이용이 ...</a> <input type="button" value="▶"
					class="btn btn-outline-warning col-1 offset-xs-1 offset-sm-2 offset-md-5 offset-xl-6 btn_typeB2 qna_btn"
					onclick="location.href='${pageContext.request.contextPath }/siteFAQ?FAQ=3'">
			</div>
			<div>
				<a href="${pageContext.request.contextPath }/siteFAQ?FAQ=4"
					class="col-xs-8 col-sm-5 col-md-4 col-xl-3 offset-1">Q. 사고 또는 고장 발생시 어떻게
					해야하나요?</a> <input type="button" value="▶"
					class="btn btn-outline-warning col-1 offset-xs-1 offset-sm-2 offset-md-5 offset-xl-6 btn_typeB2 qna_btn"
					onclick="location.href='${pageContext.request.contextPath }/siteFAQ?FAQ=4'">
			</div>
			<div>
				<a href="${pageContext.request.contextPath }/siteFAQ?FAQ=1"
					class="col-xs-8 col-sm-5 col-md-4 col-xl-3 offset-1">Q. 예약취소 했는데 언제 환불
					되나요?</a> <input type="button" value="▶"
					class="btn btn-outline-warning col-1 offset-xs-1 offset-sm-2 offset-md-5 offset-xl-6 btn_typeB2 qna_btn"
					onclick="location.href='${pageContext.request.contextPath }/siteFAQ?FAQ=1'">
			</div>

		</div>
	</article>


	<jsp:include page="inc/footer.jsp"></jsp:include>

	<jsp:include page="inc/side_inquiry_btn.jsp"></jsp:include>


</body>
</html>