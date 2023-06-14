<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량예약</title>
<%-- css --%>

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


<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="styleSheet">
<link href="${pageContext.request.contextPath }/resources/css/car_item/res/car_res.css" rel="styleSheet">

<%-- js --%>
<script
	src="${pageContext.request.contextPath }/resources/js/inc/flatpickr.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>

<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<section id="sec_con" class="inr">
		<h1 class="con_title">차량예약</h1>

		<!-- 정렬 방법 -->
		<div class="car_sort">
			<button class="on">가격순</button>
			<button>인기순</button>
		</div>
		<div class="container-fluid mx-auto">
			<div class="row inq_container">

				<!-- 0531 달력 추가 -->
				<!-- 달력 섹션 -->
				<div class="col-3">
					<form action="" method="post" onsubmit="return menuCheck();">
						<div class="res_calendar ">
							<div class="res_cal_wrap ">
								<jsp:include page="../../../inc/calender.jsp"></jsp:include>
							</div>
							<div class=" res_rentMenu_wrap ">
								<jsp:include page="../../../inc/rentMenu.jsp"></jsp:include>
							</div>
						</div>
					</form>
				</div>

				<!-- 검색 목록 리스트 -->
				<div class="col-md-12 col-lg-8 res_list">
					<ul>
					<%-- 검색 결과 출력 --%>
					<jsp:include page="../inc/car_res_item.jsp"></jsp:include>
				
					<jsp:include page="../inc/car_res_item.jsp"></jsp:include>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<script>
		$(".car_sort button").click(function() {
			$(this).addClass("on");
			$(this).siblings("button").removeClass("on");
		});
	</script>

	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>

</body>

</html>