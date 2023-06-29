<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- 원본 파일 이름 page7 -->
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gabolcar - 이용안내</title>

<%-- css --%>
<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/member/etc/site_guide.css" rel="stylesheet">

<%-- js --%>
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>

<body>

	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="sec_con" class="inr">
		<h1 class="con_title">이용안내</h1>

		<div class="rent_proc rent_int_wrap">
			<h2 class="h2">대여인수 절차</h2>
			<span class="line"></span>

			<div class="mt-5">
				<div class="row_i">
					<div class="col-3">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/member/etc/site_guide/building.png">
						<h4 class="my-3">1. 지점방문</h4>
						<p>직원에게 예약번호 또는<br> 예약자 성명을 말씀해주세요.<br> (외국인일 경우 여권 및 국제면허증
						지참)</p>
					</div>
					<div class="col-3">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/member/etc/site_guide/loyalty-card.png">
						<h4 class="my-3">2. 고객 정보 확인</h4>
						<p>예약사항을 확인 후,<br> 차량임대차 계약서 작성을 위해<br> 면허증을 담당직원에게 제시해
						주세요.<br> (모바일 PASS 면허는 불가)</p>
					</div>
					<div class="col-3">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/member/etc/site_guide/customer.png">
						<h4 class="my-3">3. 대여료 결제</h4>
						<p>대여기간 및 차종, 옵션 등<br> 최종 확인한 후<br> 차량 대여료를 결제해주세요.</p>
					</div>
					<div class="col-3">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/member/etc/site_guide/listing.png">
						<h4 class="my-3">4. 차량 확인 및 계약서 작성</h4>
						<p>직원을 따라 주차장으로 이동하신 후<br> 차량 상태를 확인하시고<br> 차량 임대차 계약서에
						서명해주세요.</p>
					</div>
				</div>
			</div>
		</div>

		<div class="ret_proc rent_int_wrap">
			<h2 class="h2">반납 절차</h2>
			<span class="line"></span>

			<div class="mt-5">
				<div class="row_i">
					<div class="col-3">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/member/etc/site_guide/building.png">
						<h4 class="my-3">1. 지점방문</h4>
						<p>반납지점 주차장에 차량을 주차하고<br> 시동을 완전히 끈 후 차량 Key 와<br> 소지품을 챙겨
						지점 사무실로 들어갑니다.</p>
					</div>
					<div class="col-3">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/member/etc/site_guide/key-features.png">
						<h4 class="my-3">2. 자동차 키 반납</h4>
						<p>담당직원에게<br> 차량 Key를 반납하세요.</p>
					</div>
					<div class="col-3">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/member/etc/site_guide/car.png">
						<h4 class="my-3">3. 차량 확인</h4>
						<p>담당직원과 함께 차량이 주차된 곳으로<br> 이동하여 차량 상태,<br> 유류상태 등을 확인해
						주세요.</p>
					</div>
					<div class="col-3">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/img/member/etc/site_guide/customer.png">
						<h4 class="my-3">4. 추가 비용 정산</h4>
						<p>반납시간 초과, 차량의 손망실,<br> 유류비, 범칙금 등 추가금이<br> 발생한 경우 추가비용을
						정산해주세요.</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="ret_proc rent_int_wrap">
            <h2 class="h2">추가 요금</h2>
            <span class="line"></span>
            <table class="int_table int_t2">

                <tr>
                    <th>차종</th>
                    <th>승용</th>
                    <th>승합,SUV</th>
                    <th>대형차량</th>
                    <th>수입차량</th>
                </tr>

                <tr>
                    <td>1시간</td>
                    <td>5,000원</td>
                    <td>10,000원</td>
                    <td>20,000원</td>
                    <td>20,000원</td>
                </tr>

                </table>
                <p class="add_text">* 추가 이용 시간은 21:00 이전 까지만 가능하며, 이후는 1일 연장 됩니다.</p>
        </div>
		
		<div class="ret_rule rent_int_wrap">
			<h2 class="h2">환불규정</h2>
			<span class="line"></span>
			<label>
				<input type="checkbox" checked="checked" disabled="disabled">&nbsp;&nbsp;
				<b>꼭! 확인하세요</b>
			</label>
			<p class="text_return">＊저희 가볼카는 고객님의 부득이한 사정으로 예약하신 차량의 예약을
				취소할 경우, 다음과 같은 환불규정을 준수합니다.</p>
			<table class="la_table">
				<tr>
					<th>사용개시일로부터 24시간 전 취소시</th>
					<th class="la_noline">24시간 이내 취소시</th>
				</tr>

				<tr>
					<td>전액환불</td>
					<td class="la_noline">환불불가</td>
				</tr>
			</table>
		</div>
	</div>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>
</body>


</html> 