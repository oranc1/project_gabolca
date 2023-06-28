<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gabolcar - 자동차대여약관</title>

<%-- css --%>
<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/member/etc/clause.css" rel="stylesheet">

<%-- js --%>
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>

<body>

	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<section id="sec_con" class="inr out_con">
		<h1 class="con_title">자동차대여약관</h1>
		<div id="out_wrapper">
			<div id="content">
				<div class="c_delete">
					<p class="coment">제1조(목적)</p>
					<br>
					이 약관은 대여용자동차 임대인(이하 “회사”라 합니다)과임차인(이하 “고객”이라 합니다) 사이의 대여용자동차 임대차계약(이하 “대여계약”이라합니다)상의 권리․의무에 관한 사항을 규정함을 목적으로 합니다.
					<br><br>
					<p class="coment">제2조(예약의 체결)</p>
					<br>
					①대여용자동차(이하 “렌터카”라 합니다)를 임차하려는자는 미리 차종, 대여요금, 지연손해금, 임차예정일시, 임차장소, 임차기간, 반환장소, 운전자, 기타 임차조건 등을 확인하여 예약을 할 수 있으며, 회사는대여예정요금의 10%범위 내에서 예약금을 청구할 수 있습니다.
					<br>
					②고객이 예약내용을 변경하고자 할 때에는 사전에 회사와 합의하여야합니다.
					<br><br>
					<p class="coment">제3조(예약의 취소)</p>
					<br>
					①임차예정 시간을 1시간 이상 경과하여도 대여계약이체결되지 아니한 경우에는 예약은 취소된 것으로 합니다. 이 경우 예약금은 반환하지 아니합니다.
					<br>
					②고객이 자신의 사정으로 임차예정일시로부터 24시간 이전에 예약을취소하는 경우에는 예약금 전액을 반환합니다.
					<br>
					③고객이 자신의 사정으로 임차예정일시 직전 24시간 내에 예약을 취소하는경우에는 예약금을 반환하지 아니합니다.
					<br>
					④회사는 예약금을 수령한 후 회사의 사정으로 예약을 취소하거나 대여계약을 체결하지 못할 경우에는 고객에게 사유를 설명하고 예약금의 배액을지급합니다.
					<br>
					⑤제2조에 따른 예약을 한 후 천재지변 등 불가항력적인 사유로 인하여계약을 체결할 수 없게 된 경우에는 회사는 예약금을 고객에게 반환합니다.
					<br><br>	
					<p class="coment">제4조(대여계약의 체결)</p>
					<br>
					①대여계약의 체결은 임대차계약서에 의하며, 임대차계약서에는 제2조 제1항에서 열거한 사항을 명시하여야 합니다.
					<br>
					②회사는 고객이 다음 각 호의 어느 하나에 해당할 경우 대여계약의 체결을거절할 수 있으며, 이 경우 지급받은 예약금을 반환합니다.
					<br>
					1. 고객(고객 아닌 자가 임대차계약서상의 운전자인 경우에는 운전자를말한다, 이하 이 조에서 같다)이 렌터카운전에 필요한 운전면허증을 소지하지아니한 경우(다만, 회사는 사고발생의 빈도 및 보험적용요율 등을 감안하여고객의 연령 및 운전경력 등을 특약으로 정할 수 있습니다)
					<br>
					2. 신원확인이 불가능하거나 회사의 질문 및 자료요구에 불응할 때
					<br>
					3. 고객이 음주상태에 있거나, 마약, 각성제, 신나 등 약물에 중독되었다고판단될 때
					<br>
					4. 예약 당시 결정한 운전자와 렌터카 인수시의 운전자가 다를 때
					<br>
					5. 과거 렌터카 대여와 관련하여 대여요금의 체납이 있을 때
					<br>
					6. 과거 렌터카 대여와 관련하여 제15조 각호에 해당하는 행위가 있었을 때
					<br>
					7. 위 각호에 준하는 사항으로서 대여계약의 체결을 거절할 만한 객관적인사유가 있을 때
					<br><br>	
					<p class="coment">제5조(렌터카의 대체)</p>
					<br>
					①회사는 고객이 예약한 차종의 렌터카를 대여할 수없을 경우에는 유사한 다른 차종의 렌터카로 대체할 수 있습니다.
					<br>
					②제1항에 의한 대체 렌터카의 대여요금이 예약차종의 대여요금보다 비싼경우에는 예약차종의 대여요금을, 예약차종의 대여요금보다 싼 경우에는 대체렌터카의 대여요금을 각 적용합니다.
					<br>
					③고객은 제1항에 의한 대체 렌터카의 임차를 거절할 수 있으며, 이 경우 회사는고객에게 예약금 전액을 반환합니다.
					<br><br>
				</div>
			</div>			
		</div>
	</section>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>
</body>


</html> 