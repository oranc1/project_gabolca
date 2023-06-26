<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 완료</title>
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/payment/res_com.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">

	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../../inc/top1.jsp"></jsp:include>
	</header>
	<section id="sec_con" class="inr com_cont">
		<div class="res_com_txt" align="center">
			<img alt="" src = "${pageContext.request.contextPath }/resources/img/payment/res_com/yes.png" width ="70px"/>
	  		<h1>예약을 취소합니다.</h1>
	  		<p>취소할 예약 내용을 확인해주세요.</p>
		</div>
			
		<div class="res_info_wrapper">
		
			<div class="res_info com_wrap">
				<h3>예약 정보</h3>
				<ul>
					<li>
						<em>예약 번호</em>
						<span>${resInfoCom.res_idx }</span>
					</li>
					<li>
						<em>예약 일자</em>
						<span>
							<fmt:formatDate value="${resInfoCom.res_rental_date }" pattern="yyyy-MM-dd HH:mm" />
						 	~
							<fmt:formatDate value="${resInfoCom.res_return_date }" pattern="yyyy-MM-dd HH:mm" />
						</span>
					</li>
					<li>
						<em>차종</em>
						<span>${resCarInfo.car_model}(${resCarInfo.car_company})</span>
					</li> 
					<li>
						<em>총 결제 금액</em>
						<span><b><fmt:formatNumber value="${resPayInfo.pay_total}" pattern="###,###" /></b>원</span>
					</li> 
					
					
				</ul>
			</div>
		  
		  	<hr class="com_line">
		
			<div class="payment_info com_wrap">
				<h3>환불 정보</h3>
				<ul>
					<li>
						<em>환불 수단</em>
						<span>신용/체크카드</span>
					</li>
					<li>
						<em>총 결제 금액</em>
					<span><b><fmt:formatNumber value="${resPayInfo.pay_total}" pattern="###,###" /></b>원</span>
					</li>
					<li>
						<em>환불 수수료</em>
						<span><b>20000</b>원</span>
					</li>
					<li>
						<em>총 환불 금액</em>
						<span><b>100,000</b>원</span>
					</li>
				</ul>
			</div>
		
	
			<div class="finish_btn" align="center">
				<a href="MemberRes"><button>이전으로</button></a>
				<a href="./"><button>취소하기</button></a>
			</div>
			
		</div>
	</section>
	
	<footer>
		<jsp:include page="../../inc/footer.jsp"></jsp:include>
	</footer>


</body>
</html>