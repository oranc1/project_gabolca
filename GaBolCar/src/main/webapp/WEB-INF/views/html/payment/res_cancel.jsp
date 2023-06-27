<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 완료</title>
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/payment/res_com.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">

<%-- 	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script> --%>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript">
    	function removeRes() {
        	var text = document.getElementsByName("cancel_reason")[0].value;
        	if (text == null || text.trim() == '') { 
           	alert("환불 사유를 작성하여주세요!");
            return false;
       	}
        return true;
    }
	
	
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
		  	
		  	<script>
				function cancelPayments() {
					alert('cancelPayments');
					var reason = document.querySelector('.cancel_reason').value;
					$.ajax({
						url:"cancelPayments",
						type: "POST",
						data:JSON.stringify({
							merchant_uid: ${resPayInfo.merchant_uid},
							amount: ${resPayInfo.pay_total},
							reason: reason
						}),
						contentType:"application/json; charset=utf-8",
						success: function(result){
							alert("결제금액 환불완료");
							//결제 취소화면으로 이동해주기.
						},
						error: function(result){
							alert("환불 불가 : "+result.responseText);
						}
					});
				}
			</script>
		
			<div class="payment_info com_wrap">
				<h3>환불 정보</h3>
				<ul>
					<li>
						<em>환불 사유</em>
							<span><input type="text" name="cancel_reason" placeholder="환불사유를 입력해주세요" required="required" class="cancel_reason"></span>
					</li>
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
						<span>
                <c:set var="refundFee" value="${resPayInfo.pay_total}" /> <!-- 기본 환불 수수료 -->
                <c:set var="refundFeePercentage" value="0.5" /> <!-- 총 결제 금액의 50% -->

                <!-- 예약일자와 현재 시간 비교 -->
                <c:set var="reservationDateStr" value="${resInfoCom.res_rental_date }" /> <!-- 예약일자를 해당 변수에 할당 -->
                <fmt:parseDate var="reservationDate" value="${reservationDateStr}" pattern="yyyy-MM-dd" />

                <c:set var="currentTime" value="<%= new java.util.Date() %>" />

                <!-- 예약일자와 현재 시간을 밀리초 단위로 변환하여 비교 -->
                <c:set var="oneDayInMillis" value="86400000" /> <!-- 24시간을 밀리초로 변환 -->
                <c:set var="timeDifference" value="${reservationDate.time - currentTime.time}" />

                <!-- 조건에 따라 환불 수수료 결정 -->
                <c:choose>
                    <c:when test="${timeDifference <= oneDayInMillis}">
                        <!-- 24시간 이내인 경우: 환불 수수료를 총 결제 금액의 50%로 설정 -->
                        <c:set var="refundFee" value="${resPayInfo.pay_total * refundFeePercentage}" />
                    </c:when>
                    <c:otherwise>
                        <!-- 24시간 이상인 경우: 환불 수수료를 0원으로 설정 -->
                        <c:set var="refundFee" value="0" />
                    </c:otherwise>
                </c:choose>

                <b><fmt:formatNumber value="${refundFee}" pattern="###,###" /></b>원
            </span>
					</li>
					<li>
						<em>총 환불 금액</em>
						  <span><b><fmt:formatNumber value="${resPayInfo.pay_total - refundFee}" pattern="###,###" /></b>원</span>
        
					</li>
				</ul>
			</div>
			
		
	
			<div class="finish_btn" align="center">
				<a href="MemberRes"><button>이전으로</button></a>
				<a href="javascript:;"><button onclick="cancelPayments()">취소하기</button></a>
			</div>
			
			
		</div>
	</section>
	
	<footer>
		<jsp:include page="../../inc/footer.jsp"></jsp:include>
	</footer>


</body>
</html>