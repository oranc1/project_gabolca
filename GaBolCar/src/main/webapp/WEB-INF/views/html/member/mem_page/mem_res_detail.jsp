<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import="java.util.Date" %>
    
    <%-- 원본 파일 res_detail --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link  href="${pageContext.request.contextPath }/resources/css/member/mem_page/mem_res_detail.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">

<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>


</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp" />
	</header>
	
	<section id="sec_con" class="inr detail_p">
		<h1 class="con_title">예약 상세 정보</h1>
		<div class="inq_container">
		
			<jsp:include page="../../../inc/mem_sidebar.jsp"></jsp:include>
			
			<div class="res-detail-cont">
				<article class="res_detail_article1">
					<div>
						<img alt=""
							src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/casper.jpg">
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<c:set var="targetDate" value="${resinfo.res_return_date}" />
						<c:choose>
							<c:when test="${today ge targetDate}">
								<b>반납 완료</b>
							</c:when>
							<c:when test="${payment.pay_status eq '취소' }">
							<p></p>
							</c:when>
							<c:otherwise>
								<b>결제 완료</b>
							</c:otherwise>
						</c:choose>
					</div>
				</article>
				
				
				<article class="res_detail_article2">
					<ul class="side_menu">
						<li>
							<div class="menu_tit">
								<span>예약 정보</span>
							</div>
							<div class="res_con_wrap">
								<ul class="side_sub ss_t">
									<li>예약 번호<br>
									<br></li>
									<li>대여 지점</li>
									<li>대여 날짜<br>
									<br></li>
									<li>반납 지역</li>
									<li>반납 날짜<br>
									<br></li>
									<li class="res_detail_totalcost">총 결제 비용(보험포함)</li>
								</ul>

								<ul class="side_sub ss_r">
									<li>${resinfo.res_idx}<br><br></li>
									<li>${resinfo.brc_rent_name }</li>
									<li><fmt:formatDate value="${resinfo.res_rental_date}"
													pattern="yyyy-MM-dd HH:mm" /><br>
									<br></li>
									<li>${resinfo.brc_rent_name }</li>
									<li><fmt:formatDate value="${resinfo.res_return_date}"
													pattern="yyyy-MM-dd HH:mm" /><br>
									<br></li>
									<li class="res_detail_totalcost"><fmt:formatNumber value="${payment.pay_total}" pattern="###,###" /> 원</li>

								</ul>
						
							</div>
						</li>
						<li>
							<div class="menu_tit">
								<span>차량 정보</span>
							</div>
							<div class="res_con_wrap">
								<ul class="side_sub ss_t">
									<li>차량 이름</li>
									<li>연료</li>
									<li>차종</li>
									<li>변속기</li>
									<li>정원</li>
									
								</ul>
								<ul class="side_sub ss_r">
									<li>${car.car_model}</li>
									<li>${car.car_fuel_type }</li>
									<li>${car.car_type }</li>
									<li>${car.car_shift_type }</li>
									<li>${car.car_riding } 인승</li>
							
								</ul>
							</div>
						</li>
						<li>
							<div class="menu_tit">
								<span>운전자 정보</span>
							</div>
							<div class="res_con_wrap">							
								<ul class="side_sub ss_t">
									<li>운전자명</li>
									<li>생년월일</li>
									<li>전화번호</li>
									<li>면허종류</li>
								</ul>
								<ul class="side_sub ss_r">
									<li>${driver.dri_name}</li>
									<li>${driver.dri_birthday }</li>
									<li>${driver.dri_tel }</li>
									<li>${driver.lic_info }</li>
								</ul>
							</div>
						</li>
						<li>
							<div class="menu_tit">
								<span>보험 정보</span>
							</div>
							<div id="insu_s" class="res_con_wrap">
								<ul class="side_sub ss_t">
									<li>선택한 보험</li>
									<li>보험비</li>
									
								</ul>
								<ul class="side_sub ss_r">
									<li>${resinfo.car_insurance }</li>
									<li class="insuAmount"></li>
								</ul>
							</div>
							<script type="text/javascript">

								var selectedValue = "${resinfo.car_insurance}";

								var notSelect = 0;
								var insuSelect = 10000;
								
								
								if (selectedValue == '선택안함') {

									document.querySelector('.insuAmount').innerText = 0;
								} else {

									 var formattedAmount = insuSelect.toLocaleString(); 
									 document.querySelector('.insuAmount').innerText = formattedAmount;
								}
							</script>
						</li>
					</ul>
					<script src="${pageContext.request.contextPath }/resources/js/member/mem_page/mem_res_detail.js"></script>
				</article>
			</div>
		</div>
	</section>
	
    <footer>
		<jsp:include page="../../../inc/footer.jsp" />
	</footer>
</body>
</html>