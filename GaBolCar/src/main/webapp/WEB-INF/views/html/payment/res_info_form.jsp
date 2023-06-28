<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="ko_KR" />
<!-- 원본 파일 이름 4-3 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약하기</title>
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/payment/res_info_form.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
<!-- jQuery -->
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script> --%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- 아임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

</head>
<body>
	<header>
		<jsp:include page="../../inc/top1.jsp"></jsp:include>
	</header>
	<section id="sec_con" class="inr res_page">
<!-- 		<form action="resInfoPro" method="post"> -->
		<form action="resInfoPro" method="post">
			<input type="hidden" name="res_rental_date" value="${map.res_rental_date }">
			<input type="hidden" name="res_return_date" value="${map.res_return_date }">
			<input type="hidden" name="car_idx" value="${map.car_idx }">
			<input type="hidden" name="pay_total" class="pay_total">
			<input type="hidden" name="merchant_uid">
			<input type="hidden" name="imp_uid">
			<!-- 결제 상태 임시지정 -->
			<input type="hidden" name="pay_status" class="pay_status">
			<ul class="res_page_wrap">
				<li class="res_info_p res-com">
					<div class="menu_tit res_info">
						<span>예약 정보</span>
					</div>
					
					<ul class="side_sub">
						<li>
							<label for="rentdate">대여 날짜</label>
							<fmt:parseDate value="${map.res_rental_date }" pattern="yyyy-MM-dd HH:mm" var="res_restal_date"/>
							<span class="drv_80"><fmt:formatDate value="${res_restal_date }" pattern="yyyy-MM-dd HH:mm" /></span>
						</li>
						<li>
							<label for="rental_area">대여 지점</label>
							<select id="rental_area2" name="brc_rent_name" class="drv_80">
									<option selected="selected" value="${map.brc_rent_name }">${map.brc_rent_name }</option>
<!-- 									<option selected="selected">범일점(본점)</option> -->
<!-- 									<option>부산역점</option> -->
<!-- 									<option>해운대점</option> -->
							</select>
						</li>
						<li>
							<label for="returndate">반납 날짜</label>
							<fmt:parseDate value="${map.res_return_date }" pattern="yyyy-MM-dd HH:mm" var="res_return_date"/>
							<span class="drv_80"><fmt:formatDate value="${res_return_date }" pattern="yyyy-MM-dd HH:mm" /></span>
						</li>
						<li>
							<label for="rental_area">반납 지점</label>
							<select id="rental_area2" name="brc_return_name" class="drv_80">
									<option selected="selected" value="${map.brc_return_name }">${map.brc_return_name }</option>
<!-- 									<option>부산역점</option> -->
<!-- 									<option>해운대점</option> -->
							</select>
						</li>
						<li>
							<label for="totalhour">총 대여시간</label>
							<span class="drv_80 toatlResTime"></span>
						</li>
					</ul>
					<script>
						
					</script>
				<li class="drv_per_p res-com">
					<div class="menu_tit driver_info">
						<span>운전자 정보(필수입력)</span>
					</div>
					<ul class="side_sub">
						<li class="drv_input">
							<label for="name">운전자명</label>
							<input type="text" name="dri_name" placeholder="운전자명을 입력해주세요" class="drv_80" required="required">
						</li>
						<li class="drv_input">
							<label for="birthDate">생년월일</label>
							<input type="text" name="dri_birthday" placeholder="생년월일 8자리를 입력해주세요"  maxlength="8" class="drv_80">
						</li>
						<li class="drv_phone">
							<label for="phoneNum">휴대폰 번호</label>
							<div>
								<input type="text" size="1" maxlength="3" name="dri_tel1">-
								<input type="text" size="3" maxlength="4" name="dri_tel2">-
								<input type="text" size="3" maxlength="4" name="dri_tel3">
							</div>
						</li>
						<li class="lic_num_inp">
							<label for="licenseNo">면허증 번호</label>
							<div>							
								<select name="lic_num1">
									<c:forEach begin="11" end="24" var="i">
										<option value="${i }">${i }</option>
									</c:forEach>
								</select>
								-
								<input type="text" placeholder="번호 입력" maxlength="2" name="lic_num2">-
								<input type="text" placeholder="번호 입력" maxlength="6" name="lic_num3">-
								<input type="text" placeholder="번호 입력" maxlength="2" name="lic_num4">
							</div>
						</li>
						<li>
							<label for="licenseType">면허 종류</label>
							<select name="lic_info" class="id_type">
								<option value="1종">1종</option>
								<option value="2종">2종</option>
							</select>
						</li>
						<li class="drv_input">
							<label for="issueDate">발급일자</label>
							<input type="text" name="lic_issue_date" placeholder="발급일자 8자리를 입력해 주세요"  maxlength="8" class="drv_80">
						</li>
						<li class="drv_input">
							<label for="expiredDate">만료일자</label>
							<input type="text" name="lic_expiration_date" placeholder="만료일자 8자리를 입력해 주세요"  maxlength="8"class="drv_80">
						</li>
					</ul>
				</li>

				<li>
					<div class="menu_tit insu_info">
						<span>보험 정보</span>
					</div>
					<ul class="insu_chs side_sub">
						<li>
							<h3>자차보험(선택사항, 24시간기준)</h3>
							<table class="table1">
								<tr>
									<th class="title">보험종류</th>
									<th class="title">보험료</th>
									<th class="title">보상한도</th>
									<th class="title">고객부담금</th>
								</tr>
								<tr class="tr1">
									<th><input type="radio" class="car_insurance" name="car_insurance" value="선택안함" onclick="getIns(event)">선택안함</th>
									<td>없음</td>
									<td>없음</td>
									<td>전액부담</td>
								</tr>
								<tr class="tr1">
									<th><input type="radio" class="car_insurance" name="car_insurance" value="일반자차" onclick="getIns(event)">일반자차</th>
									<td>1만원</td>
									<td>300만원</td>
									<td>30만원</td>
								</tr>
							</table>
						</li>
					</ul>
				</li>
				<li>
					<div class="menu_tit ">
						<span>결제수단 선택</span>
					</div>
					<ul class="side_sub">
						<li class="payment_wrap">
							<div class="payment_p active" id="box1" style="cursor : pointer;">
								<input type="radio" name="pay_method" id="card" value="0">신용/체크카드
							</div>
<!-- 							<div class="payment_p" id="box2" style="cursor : pointer;"> -->
<!-- 								<input type="radio" name="pay_method" id="virtual_account" value="1">가상계좌이체 -->
<!-- 							</div> -->
<!-- 							<div class="payment_p" id="box3" style="cursor : pointer;"> -->
<!-- 								<input type="radio" name="pay_method" id="transfer" value="2">무통장입금 -->
<!-- 							</div> -->
						</li>
					</ul>
					<script>
							$('.payment_p').click(function() {
								$(this).addClass('active');
								$(this).siblings('.payment_p').removeClass('active'); 
							});
					</script>
				</li>
				
				
				<li class="agreement_p">
					<div class="menu_tit">
						<span>이용약관</span>
					</div>
					<ul class="side_sub">
						<li>
							<textarea name="tos">
자동차대여 표준약관
제1장 총칙제1조(약관의 적용)
주식회사 타볼카는 (이하"회사"라한다) 이 약관에 따라 대여자동차(이하"렌터카"라 한다)를 임차인에게 대여하고 임차인은 이를 임차한다.
회사는 이 약관의 취지,법령 및 일반적 관습에 반하지 않는 범위에서 특약할 수 있으며, 특약한 때에는 그 특약이 우선한다. 단, 그 특약은 반드시 기재되어야 한다.
제2장 대여계약
제2조(예약)
임차인은 렌터카를 임차할 때에는 미리,차종,개시일자,임차장소,임차기간,반환장소,운전자 기타 임차조건을 명시하고 예약할 수 있으며 회사는 렌터카의 보유범위내에서 예약에 응한다.
전항의 예약은 대여예정요금의 10분지 1범위내에서 예약금을 청구할 수 있다.
제1항에 의하여 예약한 임차개시시간을 1시간 이상 경과하여도 렌터카 대여계약(이하" 대여 계약"이라 한다)을 체결하지 않을 때에는 예약은 취소하는 것으로 한다.
제1항의 임차조건을 변경하고자 할 때에는 미리 회사의 승낙을 받아야 한다.
제3조(대여계약의 체결)
회사는 대여할 수 있는 렌터카가 없을 때 또는 임차인이 본조 제4항 각호에 해당할 때를 제외하고 임차인의 신청에 의하여 대여계약을 체결한다.
대여계약의 신청은 제2조 제1항의 임차조건을 명시하여야 한다.
회사는 임차인이 다음 각호의 1에 해당할 때에는 대여계약의 체결을 거절 할 수 있다.
1) 렌터카운전에 필요한 자격의 운전면허증을 소지하지 아니한 자와 만 21세 미만인자
(다만, 사고발생의 빈도 및 보험요율을 감안하여 임차인의 연령 및 운전경력 등은 특약으로 정할 수 있다)
2) 신원확인이 불가능하거나 회사의 질문이나 자료요구에 불응할 때
3) 음주상태에 있을 때
4) 마약,각성제,신나등에 의한 중독상황 등을 띄고 있을 때
5) 예약당시 결정한 운전자와 인수시의 운전자가 다를 때
6) 과거 대여시 대여요금의 지불을 체납하고 있을 때
7) 과거 대여시 제18조 각호사항에 해당하는 행위가 있을 때
제4조(대여계약의 성립 등)
대여계약은 회사가 대여요금을 징수하고 임차인에게 렌터카를 인도한 때 성립된다. 이 때에 예약금은 대여요금의 일부에 충당한다.
회사는 사고,도난,기타 회사의 귀책사유에 의하지 아니하는 사유로 인하여 예약차종의 렌터카를 대여할 수 없을 때에는 다른 차종의 렌터카(이하"대체렌터카"라 한다)를 대여할 수 있다.
전항에 의하여 대여하는 대체렌터카의 대여요금이 예약차종의 대여 요금보다 비싸게 될 때에는 예약차종의 대여요금에 의하고 예약차종의 대여요금보다 싸게 될 때에는 당해 대체렌터카 의 대여요금에 의한다.
임차인은 제2항에 의한 대체렌터카의 대여신청을 거절하고 예약을 취소할 수 있다.
제5조(대여계약의 해제)
회사는 임차인이 대여기간중에 다음 각호의 1에 해당한 때에는 대여계약의 해지사유를 설명하고 즉시 렌터카의 반환을 청구할 있다.
1) 이 약관을 위반한 때
2) 임차인의 귀책사유로 인하여 교통사고를 야기한 때
3) 제3조 제4항 각조에 해당하게 되었을 때
임차인은 렌터카가 임차인에게 인도되기 이전의 하자로 인하여 사용불가능하게 된 때에는 제23조 제3항에 의한 조치를 받은 때를 제외하고 대여 계약을 해지할 수 있다.
제6조(불가항력 사유로 인한 대여계약의 중도 종료)
렌터카의 대여기간중에 천재지변, 기타 불가항력 사유로 인하여 렌터카의 사용이 불능 하게 된 때에는 대여계약을 종료된 것으로 한다.
임차인은 전항에 해당하게 된 때에는 그 뜻을 회사에 연락하여야 한다.
제7조(중도해약)
임차인은 임차기간중이라도 회사의 동의하에 대여계약을 해약할 수 있다. 이때 임차인은 제 26조의 중도해약 수수료를 지불하여야 한다.
임차인의 귀책사유로 인하여 렌터카의 사고 또는 고장으로 대여 기간중에 반환한 때에는 대여계약은 해약된다.
제8조(임차조건의 변경)
대여 계약의 성립후 제3조 제2항의 임차조건을 변경하고자 할 때에는 미리 회사에 승낙을 받아야 한다.
회사는 전항에 의한 임차조건의 변경으로 인하여 대여업무에 지장이 있을 때에는 그 변경을 승낙하지 않을 수 있다.
제3장 대여자동차
제9조(자동차 종류)
회사가 대여할 수 있는 자동차는 승용자동차의 승합자동차로 한다.

제10조(보험가입등)
회사는 제3조 제2항에서 명시한 개시일시 및 임차장소에서 자동차 손해배상보장법에 의한 책임보험과 자동차종합보험 (대인,대물,자손)에 가입하고 제15조에서 정하는 렌터카를 대여한다.

제11조(점검표작성등)
회사는 임차인과 공동으로 점검표를 사용하여 인도전 일상점검과 차체외관 및 차량운행에 필요한 기본공구의 적재여부 및 연료량을 확인한 다음 당해 렌터카를 대여한다.
회사는 전항의 확인에 있어 렌터카에 정비불량등을 발견한 때에는 교환등의 조치를 강구하고 그 내용을 기록 유지하여야 한다.
회사는 렌터카를 인도한 때에는 자동차 임대차계약서를 임차인에 게 교부하고 주요내용을 설명하여야 한다.
제12조(운전자의 알선)
회사는 운전자를 고용할 수 없다. 다만, 임차인의 요청으로 운전자를 알선할 경우에는 임차인의 렌터카 사용에 불편이 없도록 성실한 운전자를 알선하여야 한다. 이때 알선 수수료는 받지 아니한다.
전항에 의하여 운전자를 알선시는 일당요금의 기준거리와 시간은 125km 및 10시간으로 한다.
제1항에 의하여 알선한 운전자의 신원은 회사가 보증하여야 한다.
제4장 대여요금등
제13조(대여요금 및 추가비용)
회사가 영수하는 대여요금은 회사에 게시한 대여요금표에 기준 한다.
임차인은 대여요금외에 임차인의 요구로 인하여 대여에 부대되는 추가비용이 발생한 경우에는 추가비용을 부담하여야 한다.
제14조(요금의 수수방법)
대여요금은 렌터카 대여시에 소정의 사용예정금액을 선불한다.
사용기간 초과등으로 선불요금에 부족이 있을 때에는 렌터카 반환시에 정산입금한다.
제5장 책임
제15조(정기점검 의무등)
회사는 자동차관리법 제36조의 일상점검 및 정기점검정비를 실시한 렌터카를 대여하여야 한다.

제16조(임차인의 점검의무)
임차인은 임차기간중 임차한 렌터카에 관하여 매일 사용개시전에 회사로부터 교부받은 점검표에 의거 일상점검을 실시하여야 한다.

제17조(임차인의 관리책임)
임차인은 선량한 관리자의 주의의무를 가지고 렌터카를 사용하고 보관하여야 한다.
전항의 관리 책임은 렌터카의 인도를 받은 시점에서 시작하여 회사에 반환한 시점에 끝난다.
제18조(금지행위)
임차인은 렌터카의 임차기간중에 다음의 행위를 하여서는 아니된다.

렌터카를 자동차운송사업 또는 이와 유사한 목적으로 사용 하는 일
렌터카를 전대하거나 또는 담보에 공용하는 등 회사의 소유권을 침해하는 일체의 행위를 하는 일
렌터카의 차량번호표를 위조 또는 변조하거나 렌터카를 개조 또는 개장하는 등 원상을 변경하는 일
회사의 허락을 받지 아니하고 렌터카를 운전연습 및 각종 시험 혹은 경기에 사용 하거나 또는 다른차를 견인 혹은 디밀음에 사용하는 일
법령 또는 공서양속에 위반하여 렌터카를 사용하는 일
대여계약서에 명시된 운전자 이외의 제3자 및 무면허자에게 운전을 시키는 일
기타 임차인의 부당한 과실행위로 차량을 손상시키는 일
제19조(배상책임)
임차인은 렌터카의 임차기간중 제18조에 해당되는 행위 및 기타 임차인의 귀책사유로 인하여 회사 또는 제3자에게 손해를 끼쳤을 때에는 그 손해를 배상할 책임을 진다.
임차인이 교통법규위반 및 주정차 위반 범칙금은 렌터카 반환 후에도 임차인이 부담하여야 한다.
제12조 제1항에 의하여 운전자를 알선받은 임차인은 전 제1항 및 제2항의 손해배상 책임을 지지 아니한다.
제6장 자동차사고의 조치
제20조(사고처리)
임차인은 렌터카에 사고가 발생한 때에는 법령상의 조치를 취함과 동시에 다음의 정하는 바에 따라 처리하여야 한다.
1) 즉시 사고상황등을 회사에 통보하여야 한다.
2) 당해 사고에 관하여 회사가 계약하고 있는 보험회사가 요청하는 서류 또는 증거의 제출에 협조하여야 한다.
3) 당해사고에 관하여 제3자의 담판 또는 협정을 할 때에는 미리 회사와 협의하여야 한다.
4) 렌터카의 수리는 특별한 사유가 있는 경우를 제외하고 회사와 협의를 거쳐 정한 공장에서 시행하여야 한다.
회사와 임차인은 각자 주어진 책임범위내에서 사고해결에 노력하고 상호협조를 태만히하여 발생하는 손해에 대하여는 귀책사유에 따라 상대방에게 배상하여야 한다.
제21조(보험처리등)
임차인은 사고발생시 회사가 렌터카에 관하여 체결한 손해보험 약관에 명시된 해석과 보장보상의 범위내에서 보험보장(대인,대물,자손)의 혜택을 받는다. 다만, 다음 각호의 경우와 보험회사 사고처리 관련법등에 규정된 법규를 위반하거나 저촉시에는 보험보상의 일부 또는 전부를 받지 못한다.
1) 임차인의 고의로 인한 손해
2) 무면허운전 사고로 인한 손해
3) 영리를 목적으로 렌터카를 대여하거나 요금 또는 대가를 받고 렌터카를 사용한 때에 생긴 사고로 인한 손해
4) 범죄를 목적으로 렌터카를 사용중의 사고로 인한 손해
5) 음주운전중의 사고로 인한 손해
6) 렌터카를 경기용이나 경기를 위한 연습용 또는 시험용으로 사용중의 사고로 인한 손해
7) 임차인(임차인과 동승자로 기록된 공동임차인 포함) 이외의 제3자가 렌터카를 운전하여 발행한 사고로 인한 손해
종합보험중 차량손해에 관한 보험가입은 임차인의 요청에 의하여 선택할 수 있으며 가입시에는 보험약관에 의하여 사고당시의 시가를 기준으로 실손해를 보상 받는다.다만, 임차인의 귀책사유로 인한 사고의 경우 면책금액은 임차인이 별도로 회사에 배상 하여야 한다.
제2항의 차량손해보험을 가입하지 않을 경우 임차인의 귀책사유로 인한 손해가 발생 하였을 때 에는 사고차량의 수리비와 수리가 불가능할 경우에는 사고당시의 시가를 기준으로한 실손해를 임차인이 회사에 배상하여야 한다.
제1항 및 제2항의 보상금이 임차인이 부담하여야 할 제19조의 손해배상금을 충당할 수 없을 때 회사는 그 부족금 발생사유를 임차인에게 설명하고 통상의 손해범위내에서 추가보상을 요구할 수 있다.
제22조(휴차손해부담)
임차인은 본인의 귀책사유로 인한 사고로 인하여 사고차량이 휴차할 경우에는 수리 기간중 휴차로 인한 회사의 실손해를 부담하여야 한다.
회사는 전항에 의하여 임차인이 부담할 손해금을 정한 경우에는 회사의 평균임차율 등을 감안한 객관적인 산정자료를 제시하여야 한다.
임차인은 회사가 전항에 의한 객관적인 산정자료를 제시하지 않은 경우 수리기간에 해당하는 대여요금의 50%를 부담한다.
제23조(고장등의 조치)
임차인은 임차기간중 렌터카의 이상 또는 고장을 발견한 때에는 즉시 운전을 중지하고 회사에 연락함과 동시에 회사의 지시에 따라야 한다.
임차인은 렌터카의 이상 또는 고장이 임차인의 고의 또는 과실에 의하는 경우에는 렌터카의 인수 및 수리에 소요되는 비용을 부담하여야 한다.
임차인은 렌터카의 대여전의 하자로 인하여 사용불가능하게 되었을 때에는 회사로부터 대체 렌터카의 제공 또는 이에 준하는 조치를 받을 수 있다.
임차인은 제3항에 정하는 조치를 받을 수 없거나 받지 않을 경우에는 통상 입을 수 있는 손해범 위내에서 회사와 협의하여 처리한다.
제24조(불가항력 사유로 인한 면책)
회사는 천재지변 기타 불가항력 사유로 인하여 임차인이 임차기간내에 렌터카를 반환할 수 없을 경우에는 그로 인하여 발생하는 손해에 관하여 임차인의 책임을 묻지 아니한다. 임차인은 이때 즉시 회사에 연락하고 회사의 요청에 협조하여야 한다.
임차인은 천재지변 기타 불가항력 사유로 인하여 회사가 렌터카의 대여 또는 대체 렌터카를 제공할 수 없을 때에는 그로 인하여 발생하는 손해에 관하여 회사의 책임을 묻지 아니한다. 이때 회사는 즉시 임차인에게 연락하여야 한다.
제7장 취소. 환불
제25조(예약의 취소)
임차인은 제2조의 예약을 하고 임차인의 사정으로 예약을 취소한 때 또는 대여계약을 체결하지 아니한 때에는 다음 각호에 의하여 해약수수료를 지불하여야 한다.
1) 사용개시 일시로 부터 24시간전에 취소하는 경우에는 회사에 통지하여야 하며 이때에는 지체없이 예약금을 임차인에게 반환하여야 한다.
2) 사용개시 일시로 부터 24시간내에 취소하는 경우에는 예약금중 대여예정요금의 10%를 공제한 잔액을 환불하여야 한다.
회사는 사정상 예약을 취소 또는 대여계약을 체결하지 못할 경우에는 임차인이 납득할 수 있는 사유를 설명하고 대여요금의 10%에 해당하는 위약금을 예약금 반환시 임차인에게 지불하여야 한다.
제26조(중도해약수수료)
임차인은 제7조 제1항의 중도해약을 한때에는 해약까지의 기간에 상당하는 대여요금의 잔여기간에 해당하는 대여요금의 10%를 중도해약수수료로 지불하여야 한다.

제27조(대여요금의 환불)
회사는 다음 각 호에 해당하는 때에는 다음에 의하여 임차인으로부터 영수한 대여요금의 전부 또는 일부를 환불하여야 한다.

제5조 제2항에 의하여 임차인이 대여계약을 해지한 때에는 영수한 대여요금의 전액
제6조 제1항에 의하여 대여계약이 종료한 때에는 영수한 대여요금에서 대여계약이 종료 된 시간에 상당한 대여요금을 공제한 잔액
제8장 반환
제28조(렌터카의 확인 등)
임차인은 렌터카를 회사에 반환 할때 통상적 사용으로 인한 마모를 제외하고 인도를 받았을때 확인한 상태에서 반환하여야 한다.
회사는 렌터카를 반환시에 임차인의 입회하에 렌터카의 상황을 확인한다.
회사는 렌터카를 인도받을때 임차인 입회하에 렌터카의 임차인 또는 동승자의 유류품 유무를 확인한다.
제29조(렌터카의 반환시기 등)
임차인은 렌터카를 임차기간내에 반환하여야 한다.
임차인은 제8조 제1항에 의하여 임차기간을 연장할 때에는 변경후의 임차기간에 해당하는 대여 요금을 지불하여야 한다.
제30조(렌터카의 반환장소 등)
렌터카의 반환은 제3조 제2항에 의하여 명기한 반환장소에 반환하여야 한다. 다만 제8 조 제1항에 의하여 반환 장소를 변경한 때에는 변경후의 반환 장소에 반환하여야 한다.
임차인의 사정상 반환장소변경으로 인하여 회사가 부담 하여야 할 비용이 발생한 경우 에는 임차인은 회송비용을 부담하여야 한다.
제31조(반환하지 않을 경우의 조치)
회사는 임차인이 대여기간만료시로부터 48시간을 경과하여도 반환장소에 렌터카의 반환을 하지 아니하거나 또한 회사의 반환청구에 응하지 않을 때 또는 임차인의 소재가 불명한 때에는 필요한 법적 절차를 취할 수 있다.

제9장 잡칙
제32조(지연손해금)
회사와 임차인은 상호 이 약관에 기초한 금전채무의 이행을 지연한 때에는 상대방에 대하여 금융기관의 연체 이율로 지연손해금을 지불하여야 한다.

제33조(계약의 세칙)
회사는 이 약관에 준하여 따로 세칙을 정할 수 있다.
회사는 따로 세칙을 정한 때에는 회사의 영업소에 게시함과 동시에 회사가 시행하는 팜플렛 및 요금표에 이를 기재한 후 이 약관과 함께 임차인에게 설명 하여야 한다. 이를 변경한 경우에도 또한 같다.
제34조(국. 영문의 해석)
국문과 영문의 약관의 해석에 차이가 있을 시는 국문 약관에 따른다.
                            </textarea>
                            <br>
                            <p class="terms_p">
	                             <input type="checkbox" name="agreeBtn" class="agreeBtns">이용약관에 동의합니다.
	                             <br>
                            </p>
							</li>
					</ul>
				</li>
				
				<li class="agreement_r">
					<div class="menu_tit">
						<span>환불규정</span>
					</div>
					<ul class="side_sub">
						<li>
							<table class="table1">
                           		<tr>
                           			<th class="title" width="33.3%">사용개시일로부터 48시간 전 취소시</th>
                           			<th class="title" width="33.3%">24시간~48시간 이내 취소시</th>
                           			<th class="title" width="33.3%">24시간 이내 취소시</th>
                           		</tr>
                           		<tr class="tr1">
                           			<td>전액 환불</td>
									<td>전체요금의 10% 공제후, 나머지 전액환불</td>
									<td>환불불가</td>
                           		</tr>
                           		<tr>
                            </table>
                               <p class="terms_p">
	                               <input type="checkbox" id="agree" name="agreeCheckbox" class="agreeBtns">환불규정에 동의합니다.<br>
                               </p>
							</li>
					</ul>
				</li>
			</ul>
			<script>
				// 총 대여 시간 계산
				// 두 날짜 파싱
				var dateString1 = '${map.res_rental_date }';
				var dateString2 = '${map.res_return_date }';
				
				var date1 = new Date(dateString1);
				var date2 = new Date(dateString2);
	
				// 밀리초 단위로 두 날짜의 차이 계산
				var timeDiff = Math.abs(date2 - date1);
	
				// 차이를 요일과 시간으로 변환
				var days = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
				var hours = Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
				
				document.querySelector('.toatlResTime').innerText = days + "일 " + hours + "시간";
				
				// 100 단위 ',' 정규식
				function addCommas(number) {
					return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				}
			
				// 요일 계산
				// 입력된 날짜와 시간 문자열
				var dateRent = '${map.res_rental_date }';
	
				// 날짜와 시간 파싱
				var dateTimeRent = new Date(dateRent);
	
				// 요일 계산
				var weekdays = ['0', '1', '2', '3', '4', '5', '6'];
				var weekdayRent = weekdays[dateTimeRent.getDay()];
				
				console.log(weekdayRent);
				
				// 결제 금액 계산
				var totalAmount = 0; // 총 결제 금액 초기값
				
// 				if(weekdayRent == '0' || weekdayRent == '6') {
// 					totalAmount = Math.ceil((${carInfo.car_weekend} * (hours / 24)) + ${carInfo.car_weekend} * days);
// 				} else {
// 					totalAmount = Math.ceil((${carInfo.car_weekdays} * (hours / 24)) + ${carInfo.car_weekdays} * days);
// 				}
				
				document.addEventListener('DOMContentLoaded', function() {
					  totalAmount = ${rentPrice};
					  var formattedTotalAmount = addCommas(totalAmount);
					  document.querySelector('.resAmount b').innerText = formattedTotalAmount;
				});
				
				 function getIns(event) {
					    var selectedValue = event.target.value;
					    var notSelect = 0;
					    var insuSelect = 10000;
					    
					    var plusTotalAmount;
					    if(selectedValue == '선택안함') {
						     plusTotalAmount = totalAmount + 0;
					    	 document.querySelector('#ins_result').innerText = addCommas(notSelect);
					    } else {
					    	 insuSelect = 10000 * (days + 1);
					    	 plusTotalAmount = totalAmount + 10000 * (days + 1);
					    	 document.querySelector('#ins_result').innerText = addCommas(insuSelect);
					    }
					    
// 					    console.log(totalAmount + document.querySelector('#ins_result').innerText);
					    
					    var formattedTotalAmount = addCommas(plusTotalAmount);
					    
						document.querySelector('.resTotalAmount').innerText = formattedTotalAmount;
						
						// 최종 결제 금액 value 히든으로 넘기기
						document.querySelector('.pay_total').value = plusTotalAmount;
				 }
				 
				
			</script>
			
			<script>
				
				const IMP = window.IMP;
				IMP.init('imp31006863'); // 가맹점 식별코드
			
				function requestPay() {
					
					// 결제 API 실행 전 유효성 검사
					if(!validateForm()) {
						return false;
					}
					
					// IMP.request_pay(param, callback) 결제창 호출
					IMP.request_pay({ // param
						pg : "html5_inicis", // 
						pay_method : "card", // 결제방법
						merchant_uid : "${member.mem_idx}" + new Date().getTime(), // 가맹점에서 구별할 수 있는 고유 id
						name : "${carInfo.car_model}(${carInfo.car_company})", // 주문명
// 						amount : document.querySelector('.pay_total').value, // 가격
						amount : 100, // 가격
						buyer_email : "${member.mem_id}", // 구매자 이메일
						buyer_name : "${member.mem_name}", // 구매자 이름
						buyer_tel : "${member.mem_mtel}", // 구매자 번호
					}, function (rsp) { // callback
					      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
					      if(rsp.success) {
					    	  // 결제 성공 시 로직
					    	  let data = {
									imp_uid: rsp.imp_uid,
									merchant_uid: rsp.merchant_uid,
									amount: rsp.paid_amount,
							  };
					    	  // ajax 로직
					    	  $.ajax({
					    		  type:"POST",
									url:"verifyIamport/" + rsp.imp_uid,
									data:JSON.stringify(data),
									contentType:"application/json; charset=utf-8",
									dataType:"json",
									success: function(result) {
										if(rsp.paid_amount == result.response.amount) {
											alert("결제검증 완료");
											document.querySelector('.pay_status').value = "결제완료";
											document.querySelector('input[name="merchant_uid"]').value = rsp.merchant_uid;
											$("form").submit();
										} else {
											location.href="cancelPayments";
											alert("결제 검증 실패");
										}
									},
									error: function(result){
										alert(result.responseText);
										cancelPayments(rsp);
									}
					    	  });
					      } else {
					    	  // 결제 실패 시 로직
					    	  alert("결제에 실패하였습니다 : " + rsp.error_msg);
						      return false;
					      }
				    });
					
				}
				
				// 유효성 검사 함수
				function validateForm() {
					var dri_name = document.querySelector('input[name="dri_name"]');
				    var containsNumber = /\d/.test(dri_name.value);

					var dri_birthday = document.querySelector('input[name="dri_birthday"]');
					
					var dri_tel1 = document.querySelector('input[name="dri_tel1"]');
					var dri_tel2 = document.querySelector('input[name="dri_tel2"]');
					var dri_tel3 = document.querySelector('input[name="dri_tel3"]');
					
					var lic_num2 = document.querySelector('input[name="lic_num2"]');
					var lic_num3 = document.querySelector('input[name="lic_num3"]');
					var lic_num4 = document.querySelector('input[name="lic_num4"]');
					
					var lic_issue_date = document.querySelector('input[name="lic_issue_date"]');
					var lic_expiration_date = document.querySelector('input[name="lic_expiration_date"]');
					
					var car_insurance = document.querySelectorAll('input[name="car_insurance"]');
					var insuranceChecked = false; // 라디오 버튼 체크 여부를 저장하는 변수
					
					var agreeBtn = document.querySelector('input[name="agreeBtn"]');
					
					var agreeCheckbox = document.getElementById('agree');
					
					
					
					var regex = /^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/; // 날짜 형식
					// 운전자명
					if(dri_name.value == "" || containsNumber) {
						alert('운전자명을 올바르게 입력해주세요');
				        dri_name.focus();
						return false;
					}
					
					// 생년월일
					if(isNaN(dri_birthday.value) || dri_birthday.value == "" || dri_birthday.value.length != 8 || !regex.test(dri_birthday.value)) {
						alert('생년월일 8자리를 올바르게 작성해주세요');
				        dri_birthday.focus();
				        return false;
				    }

					// 휴대폰번호
					if(dri_tel1.value == "" || isNaN(dri_tel1.value) || dri_tel1.value != "010" && dri_tel1.value != "011") {
						alert('휴대폰 번호를 올바르게 입력해주세요');
						dri_tel1.focus();
				        return false;
					}
					if(dri_tel2.value == "" || isNaN(dri_tel2.value) || dri_tel2.value.length != 4) {
						alert('휴대폰 번호를 올바르게 입력해주세요');
						dri_tel2.focus();
				        return false;
					}
					if(dri_tel3.value == "" || isNaN(dri_tel3.value) || dri_tel3.value.length != 4) {
						alert('휴대폰 번호를 올바르게 입력해주세요');
						dri_tel3.focus();
				        return false;
					}
					// 면허증 번호
					if(lic_num2.value == "" || isNaN(lic_num2.value) || lic_num2.value.length != 2) {
						alert('면허증 번호 2자리를 올바르게 입력해주세요');
						lic_num2.focus();
				        return false;
					}
					if(lic_num3.value == "" || isNaN(lic_num3.value) || lic_num3.value.length != 6) {
						alert('면허증 번호 6자리를 올바르게 입력해주세요');
						lic_num3.focus();
				        return false;
					}
					if(lic_num4.value == "" || isNaN(lic_num4.value) || lic_num4.value.length != 2) {
						alert('면허증 번호 2자리를 올바르게 입력해주세요');
						lic_num4.focus();
				        return false;
					}
					// 발급일자
					if (lic_issue_date.value === "" || !(/^\d{8}$/.test(lic_issue_date.value)) || lic_issue_date.value.length != 8 || !regex.test(lic_issue_date.value)) {
					    alert('발급일자 8자리를 올바르게 입력해주세요');
					    lic_issue_date.focus();
					    return false;
					}

					// 만료일자
					var expirationDate = new Date(lic_expiration_date.value.slice(0, 4), parseInt(lic_expiration_date.value.slice(4, 6)) - 1, lic_expiration_date.value.slice(6));
					var issueDate = new Date(lic_issue_date.value.slice(0, 4), parseInt(lic_issue_date.value.slice(4, 6)) - 1, lic_issue_date.value.slice(6));
					var minimumExpirationDate = new Date(issueDate.getFullYear() + 10, issueDate.getMonth(), issueDate.getDate());
					
					if (lic_expiration_date.value === "" || !(/^\d{8}$/.test(lic_expiration_date.value)) || lic_expiration_date.value.length != 8 || !regex.test(lic_expiration_date.value) || expirationDate < minimumExpirationDate) {
					    alert('만료일자 8자리를 올바르게 입력해주세요');
					    lic_expiration_date.focus();
					    return false;
					}
					
					// 보험 정보
					for (var i = 0; i < car_insurance.length; i++) {
					   if (car_insurance[i].checked) {
					     insuranceChecked = true;
					     break;
					   }
					}
					
					if (!insuranceChecked) {
					   alert('보험종류를 선택해주세요');
					   return false;
					}
					
					// 이용 약관
					if (!agreeBtn.checked) {
					   alert('이용약관에 동의해야 합니다.');
					   agreeBtn.checked = true;
					   return false;
					}
					
					// 환불 규정
					 if (!agreeCheckbox.checked) {
					   alert('환불규정에 동의해야 합니다.');
					   agreeCheckbox.checked = true;
					   return false;
					 }
					  
					return true;
				}
			</script>
			
			<fieldset class="img_sec_wrap">
				<div class="img_sec_p">
					<img src="${pageContext.request.contextPath }${carInfo.car_file1 }" alt="">
				</div>
				<div class="txt_sec_p">
					<p>
						<span>차종</span>
						<span><b>${carInfo.car_model}(${carInfo.car_company})</b></span>
					</p>
					<p>
						<span>대여금액</span>
						<span class="resAmount"><b></b>원</span>
					</p>
					<p>
						<span>보험금액</span>
						<span><b id="ins_result"></b>원</span>
					</p>
					<p class="pay_total_p">
						<span>총 결제 금액</span>
						<span><b class="resTotalAmount"></b>원</span>
					</p>
				</div>
			</fieldset>
			<input type="button" class="res_p" value="결제하기" onclick="requestPay()">
<!-- 			<button class="res_p" onclick="requestPay()">결제하기</button> -->
		</form>
		
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

	<!-- footer 추가 -->
	<footer>
		<jsp:include page="../../inc/footer.jsp"></jsp:include>
	</footer>
	
	
</body>
</html>