<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 조회</title>
<link
	href="${pageContext.request.contextPath }/resources/css/common.css"
	rel="styleSheet">
<link
	href="${pageContext.request.contextPath }/resources/css/member/mem_page/mem_res_inq.css"
	rel="styleSheet">
<link
	href="${pageContext.request.contextPath }/resources/css/inc/top.css"
	rel="styleSheet">
<link
	href="${pageContext.request.contextPath }/resources/css/inc/footer.css"
	rel="styleSheet">
<script type="text/javascript"></script>

</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<form action="MemberResInq" method="post" name="fr">
		<section id="sec_con" class="inr">
			<h1 class="con_title">예약 조회</h1>
			<div class="inq_container">
				<!-- 사이드바 -->
				<jsp:include page="../../../inc/mem_sidebar.jsp"></jsp:include>

				<!-- 예약 조회 -->
				<div class="inq_list">
					<ul>
						<c:forEach items="${resinfo }" var="resinfo">

							<li>
								<div class="res_car_img">
									<div>

										<c:forEach items="${car }" var="car">

											<c:if test="${resinfo.car_idx eq car.car_idx }">
												<img
													src="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file1}"
													alt="${car.car_model}" />
											</c:if>

										</c:forEach>
									</div>
								</div>
								<div class="list_car_info">
									<div class="list_res_car">
										<c:forEach items="${car }" var="car">
											<c:if test="${resinfo.car_idx eq car.car_idx }">
												<p>${car.car_model }(${car.car_company })</p>
											</c:if>
										</c:forEach>
										<c:set var="today" value="<%=new java.util.Date()%>" />
										<c:set var="targetDate" value="${resinfo.res_return_date}" />
										<c:set var="rentDate" value="${resinfo.res_rental_date}" />

										<c:choose>
											<c:when test="${today ge targetDate}">
												<p class="ret_car">반납 완료</p>
											</c:when>
											<c:when test="${resinfo.pay_status eq '취소' }">
												<p class="ret_car">취소된 예약</p>
											</c:when>
											<c:when test="${today ge rentDate and today lt targetDate}">
												<p class="ret_car" style="background-color: #FF6600">렌트중</p>
											</c:when>
											<c:otherwise>
												<p>결제 완료</p>
											</c:otherwise>
										</c:choose>

									</div>
									<div class="list_res_date">
										<dl>
											<dt>예약일자</dt>
											<dd>
												<fmt:formatDate value="${resinfo.res_rental_date}"
													pattern="yyyy-MM-dd HH:mm" />
												~
												<fmt:formatDate value="${resinfo.res_return_date}"
													pattern="yyyy-MM-dd HH:mm" />
											</dd>
										</dl>
										<dl>
											<dt>예약번호</dt>
											<dd>${resinfo.res_idx}</dd>
										</dl>
										<dl>
											<dt>대여일자/지점</dt>
											<dd>
												<fmt:formatDate value="${resinfo.res_rental_date}"
													pattern="yyyy-MM-dd HH:mm" />
												/ ${resinfo.brc_rent_name }
											</dd>
										</dl>
										<dl>
											<dt>반납일자/지점</dt>
											<dd>
												<fmt:formatDate value="${resinfo.res_return_date}"
													pattern="yyyy-MM-dd HH:mm" />
												/ ${resinfo.brc_return_name}
											</dd>
										</dl>
									</div>
									${payment.pay_status}
									<div class="inq_btn">


										<c:set var="today" value="<%=new java.util.Date()%>" />

										<c:set var="targetDate" value="${resinfo.res_return_date}" />

										<c:choose>
											<c:when test="${resinfo.pay_status eq '취소' }">
												<button type="button" id="resc"
													onclick="location.href='resDetail?res_idx=${resinfo.res_idx}'">취소상세조회</button>
											</c:when>
											<c:when test="${today ge targetDate}">
												<button type="button"
													onclick="location.href='resDetail?res_idx=${resinfo.res_idx}'">예약상세조회</button>
												<button type="button" class="ret_rev"
													onclick="location.href='reviewWriteForm?res_idx=${resinfo.res_idx}'">리뷰
													작성</button>
											</c:when>
											<c:when test="${today ge rentDate and today lt targetDate}">
												<button type="button"
													onclick="location.href='resDetail?res_idx=${resinfo.res_idx}'"
													style="width: 100%">예약상세조회</button>
											</c:when>
											<c:otherwise>
												<button type="button"
													onclick="location.href='resDetail?res_idx=${resinfo.res_idx}'">예약상세조회</button>
												<button type="button"
													onclick="location.href='ResCancel?res_idx=${resinfo.res_idx}'">예약취소</button>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</section>

		<script>
			$('.menu_tit').click(function() {
				$(this).children('span').addClass('on');
				if ($(this).siblings('.side_sub').is(':hidden')) {
					$(this).siblings('.side_sub').slideDown();
					$(this).children('span').removeClass('on');
				} else {
					$(this).siblings('.side_sub').slideUp();
				}
			});
		</script>
	</form>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>
</body>

</html>