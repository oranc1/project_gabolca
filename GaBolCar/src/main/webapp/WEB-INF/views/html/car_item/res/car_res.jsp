<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량 예약</title>
<%-- css --%>

<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/inc/top.css"
	rel="styleSheet">
<link
	href="${pageContext.request.contextPath }/resources/css/inc/footer.css"
	rel="styleSheet">

<link
	href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css"
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


<link
	href="${pageContext.request.contextPath }/resources/css/common.css"
	rel="styleSheet">
<link
	href="${pageContext.request.contextPath }/resources/css/car_item/res/car_res.css"
	rel="styleSheet">

<%-- js --%>
<script
	src="${pageContext.request.contextPath }/resources/js/inc/flatpickr.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/car_item/res/car_res.js"></script>
</head>

<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<section id="sec_con" class="inr">
		<h1 class="con_title">차량 예약</h1>

		
		<form action="" method="post" onsubmit="return menuCheck();">
		<!-- 정렬 방법 -->
		<!-- 0618 경인 수정 -->
		<!-- 가격순 인기순 클릭시 버튼 동작 추가 
			및 id 를 추가하여 
			가격순, 인기순 파라미터에 따라 버튼 클래스 on 이 들어가도록 하기-->
		<div class="car_sort">
			<input id="car_order" name="car_order_by" type="hidden" value="price">
			<button id="car_btn_price" class="on" onclick="$('#car_order').val('price')">가격순</button>
			<button id="car_btn_populer"  onclick="$('#car_order').val('populer')">인기순</button>
		</div>
		<div class="container-fluid mx-auto">
			<div class="row inq_container">

				<!-- 0531 달력 추가 -->
				<!-- 달력 섹션 -->
				<div class="col-3 car_menu_warp">
						<div class="res_calendar ">
							<div class="res_cal_wrap ">
								<jsp:include page="../../../inc/calender.jsp"></jsp:include>
							</div>
							<div class=" res_rentMenu_wrap ">
								<jsp:include page="../../../inc/rentMenu.jsp"></jsp:include>
							</div>
						</div>
				</div>

					
				<!-- 검색 목록 리스트 -->
				<div class="col-md-12 col-lg-8 res_list">
						<%-- 검색 결과 출력 --%>
						<c:choose>
							<c:when test="${!empty map.car_search_list  }">
								<ul class="res_list_ul">
									<c:forEach var="car" items="${map.car_search_list }">
									<li> <%-- 0620 경인 추가 주소 설정 --%>
										<a href="carRes/carResInfo?car_idx=${fn:split(car.car_idx_list,',')[0] }
										&res_rental_date=${map.res_rental_date}&res_return_date=${map.res_return_date}
										&brc_rent_name=${map.brc_rent_name}&brc_return_name=${map.brc_return_name}">
											<div class="res_list_img">
												<img
													src="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file1}" 
													alt="${car.car_model}">
											</div>
											<div class="res_list_txt">
												<h4>${car.car_model}(${car.car_company})</h4>
												<p class="car_info_p">${car.car_old} 년식 / ${car.car_shift_type} / ${car.car_riding} 인승 / ${car.car_fuel_type} / 만 ${car.car_age}세 이상</p>
												<p class="car_amount_p">
													<span>최저가</span> <span><b><fmt:formatNumber value="${car.car_weekdays}" pattern="#,###" /></b>원</span>
												</p>
											</div>
											<p class="res_btn">예약 하러가기</p>
										</a>
									</li>
									</c:forEach>
					 			</ul>
							</c:when>

							<c:otherwise>
							
								<div align="center">
									<p class="con_title">해당 조건의 차량이 현재 없거나 예약중입니다.</p>
									<p>불편을 드려 죄송합니다.</p>
								</div>
						
							</c:otherwise>
						</c:choose>

				</div><!-- 검색목록 리스트 끝 -->
				
			</div><!-- div row 끝 -->
			<div class="row inq_container">
				<div class="col-2 res_addCar_btn">
					<a href="javascript:dataObj=onClickAjax(dataObj)">
						<p class="res_btn res_load_btn" >더보기</p>
					</a>
				</div>
			</div>
		</div>
		</form>

	</section>

	<script>
	
		// =========0618 경인 추가=============
		// map.car_order_by 값을 확인하여 가격순, 인기순 버튼 셋팅하기			
		if("${map.car_order_by}" == "populer"){
			$("#car_btn_price").removeClass("on");
			$("#car_btn_populer").addClass("on");
		}
		//=====================================
			
		$(".car_sort button").click(function() {
			$(this).addClass("on");
			$(this).siblings("button").removeClass("on");
		});
		
		<%-- ajax로 보낼 데이터 만들어주기 --%>
		let dataObj = ${map.car_res_JSON};
		
		<%-- ajax 데이터로 페이지 항목 추가시 사용될 contextPath 값 
			js에 쓸수있도록 변수 지정 --%>
		let contextPath = "${pageContext.request.contextPath}";
	</script>

	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>

</body>

</html>