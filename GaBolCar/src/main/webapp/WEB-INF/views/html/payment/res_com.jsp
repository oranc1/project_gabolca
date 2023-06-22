<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	  		<h1>예약이 완료 되었습니다.</h1>
	  		<p>예약한 내용을 확인해주세요.</p>
		</div>
			
		<div class="res_info_wrapper">
		
			<div class="res_info com_wrap">
				<h3>예약 정보</h3>
				<ul>
					<li>
						<em>예약 번호</em>
						<span>ADKE-51531564</span>
					</li>
					<li>
						<em>예약 일자</em>
						<span>2023. 05. 17 ~ 2023. 05. 18</span>
					</li>
					<li>
						<em>차종</em>
						<span>캐스퍼(현대)</span>
					</li> 
					<li>
						<em>총 결제 금액</em>
						<span><b>100,000</b>원</span>
					</li> 
					
				</ul>
			</div>
		  
		  	<hr class="com_line">
		
			<div class="payment_info com_wrap">
				<h3>결제 정보</h3>
				<ul>
					<li>
						<em>결제 수단</em>
						<span>신용/체크카드</span>
					</li>
					<li>
						<em>결제 금액</em>
						<span><b>100,000</b>원</span>
					</li>
				</ul>
			</div>
		
	
			<div class="finish_btn" align="center">
				<a href="./"><button>메인으로</button></a>
				<a href="${pageContext.request.contextPath }/MemberRes"><button>예약내역조회</button></a>
			</div>
			
		</div>
	</section>
	
	<footer>
		<jsp:include page="../../inc/footer.jsp"></jsp:include>
	</footer>


</body>
</html>