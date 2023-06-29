<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 원본 파일 이름 faq --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/member/etc/site_faq.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="faq_cont">
		<section id="sec_con" class="inr">
			<h1 class="con_title">FAQ</h1>
			<section id="faq_wrap">
				<div class="faq_list">
					<ul>
						<li>
							<div class="question question1">
								<span class="q_num">01</span>
								<span class="q_icn">Q</span>
								<span class="q_question">예약취소 했는데 언제 환불 되나요?</span>
								<span class="q_arrow"><i></i></span>
							</div>
		
							<div class="answer">
								<span class="a_icn">A</span> <span class="a_answer"> 
								    ■ 렌터카 취소를 하시면 쿠폰(포인트)의 경우 즉시
									복구됩니다.<br><br> 단, 결제한 카드는 당일 예약/당일 취소가 아니라면 카드사에서 확인하<br>는데 공휴일 제외 3~최대 14일
									정도 소요됩니다. 이후에는 카드사에 문<br>의하시면 됩니다.<br><br> (이때 취소 수수료 유무에 따라 수수료 제외하고 복구 또는
									취소되는 점 참고하세요.)<br><br> 부분환불 혹은 수수료 변경으로 인하여 환불이 진행 될때, 포인트부터 우선적으로 복구
									되시오니 참고 부탁드립니다. </span>
							</div>
						</li>
						<li>
							<div class="question question2">
								<span class="q_num">02</span>
								<span class="q_icn">Q</span>
								<span class="q_question">카시트 등 부가서비스는 어떻게 이용하나요?</span>
								<span class="q_arrow"><i></i></span>
							</div>
		
							<div class="answer">
								<span class="a_icn">A</span>
								<span class="a_answer"> 
								   ■ 가볼카는 유아용카시트, 주니어용 카시트를 무료로 대여해드리고<br>
									있습니다. 예약하실 때, 선택하시거나 차량이용일 이전에 전화로 알려주시면 배차 시 제공해드리고 있습니다.<br> (단,
									한정수량인 관계로 단일품목을 2개이상 이용시에는 1 일당 5천원의 추가비용이 발생됨을 알려드립니다.) </span>
							</div>
		
						</li>
						<li>
							<div class="question question3">
								<span class="q_num">03</span>
								<span class="q_icn">Q</span>
								<span class="q_question">해외에 거주하고 있는데 예약 및 이용이 가능한가요?</span>
								<span class="q_arrow"><i></i></span>
							</div>
		
							<div class="answer">
								<span class="a_icn">A</span>
								<span class="a_answer"> 
									■ 외국인 및 해외체류자 대여시에는 전화상담이 직접 어려울 경우 국내에
									거주중인<br> 지인을 통해 대리예약이 가능하나 운전자의 조건이 확인 되어야 합니다. <br><br> ■ 임차인은 필히 국적이
									한국인이어야 하고, 국내주소지, 국내 휴대폰번호, 차량대여기준 (연령/운전경력)이 적합한 경우 등록가능하며 ■
									외국인은 제 2운전자(추가운전자)로 등록이 가능하며<br><br> 아래의 조건을 충족해야합니다.<br>1. 한국어소통 가능<br> 2. 국내
									핸드폰번호<br> 3. 국내 거주하고 있음<br> 4. 한국면허증(1년이상 경력) or 국제면허증 <br>5.
									차량대여기준(연령/운전경력)<br><br> ■ 전화연락이 힘든 경우, 카카오톡 친구추가 플러스친구 “부산렌트카 가볼카”를

									검색하셔서 친구추가해 주시면 언제든지 채팅 상담/예약 가능하십니다. 자세한 대여기준 및 예약상담을 원할 경우
									콜센터(1588-6615)로 문의바랍니다 </span>
							</div>
		
						</li>
						<li>
							<div class="question question4">
								<span class="q_num">04</span>
								<span class="q_icn">Q</span>
								<span class="q_question">현금영수증 발급이 가능한가요?</span>
								<span class="q_arrow"><i></i></span>
							</div>
		
							<div class="answer">
								<span class="a_icn">A</span>
								<span class="a_answer"> 
									■ 렌터카는 차량을 구매하는 것이 아닌 대여 품목으로 현금영수증 발급 및
									소득공제제외 대상입니다.<br> 상세한 내용은 국세청 홈페이지에서 확인이 가능합니다. <br><br>■ 관련 법령 - 소득세법 제
									162조의 3 및 동법시행령 제 210조의 3<br> - 조세특례제한법 제 121조의 2 ⑥ 5번(리스료) </span>
							</div>
		
						</li>
						<li>
							<div class="question question5">
								<span class="q_num">05</span>
								<span class="q_icn">Q</span>
								<span class="q_question">사고 또는 고장 발생시 어떻게 해야하나요?</span>
								<span class="q_arrow"><i></i></span>
							</div>

							<div class="answer">
								<span class="a_icn">A</span> <span class="a_answer"> 
								   ■ 사고 또는 고장 발생 시 <br><br>당황하지 마시고 먼저 자사 직통전화로 연락을 하시고 기다리시면<br> 보험접수 및 보험사 출동 등
									자사에서 필요하다고 판단되는 부분에 대해서 일괄 신청 및 처리하고 있습니다. <br><br>직통전화 : 051-808-600 /
									010-9700-6615<br> 사고처리담당자 : 010-9699-7749
								</span>
							</div>

						</li>
						<li>
							<div class="question question6">
								<span class="q_num">06</span>
								<span class="q_icn">Q</span>
								<span class="q_question">보험보상 및 차량손해보상제도(자차보험) 규정이 궁금합니다.</span>
								<span class="q_arrow"><i></i></span>
							</div>
		
							<div class="answer">
								<span class="a_icn">A</span> <span class="a_answer">
									★ (주)가볼카는 차량손해면책제도를 자체적으로 운영하고 있습니다 ★ <br><br>■ 차량손해면책제도란? <br>- 임차도중 사고발생시의 수리비와
									휴차보상료에 대한 부담을 최소화 하기 위한 자체적 ■ 운영방안 <br>- 사고발생 시 반드시 가볼카로 연락해야 함.

									<br>- 면책 적용은 대여기간 중 1회에 한함. <br><br>① 차량손해보상제도 가입 후 사고시 수리비가 자차한도액(차종,나이에
									따라 차등적용) 을 초과하는 경우, 초과분은 고객부담. (휴차보상료 포함) <br>② 면책보험 적용 불가의 경우 :
									임차인 고의로 인한 손해, 음주운전 시, 임차인 외 운 전 중 사고 시, 무면허운전 사고시(무면허 또는 면허의
									효력이 정지), 천재지변에 의한 손해, 자동차를 시험용-경기용 또는 연습용으로 사용하던 중 생긴 손해.) <br>③ 임차
									중 물품(타이어 및 휠, 내비게이션, 차량 키, 체인)등의 파손 및 분실, 실내 악취 발생 시 <br>④ 고객의
									귀책으로 인한 사고 발생 시 차량상태에 따라 계약해지 될 수 있습니다. <br>⑤ 천재지변(태풍, 폭설) 발생 시 체인,
									견인, 차량회수/반납 등의 출동요청은 안전 상 불가할 수 있음 <br>■ 전차량 의무적 대인, 대물, 자손 종합보험
									가입완료 ※ 단, 처리시 본인부담금 1건당 발생 <br><br>① 대인 - 제1운전자/제2운전자를 제외한 사고 현장 사람 :
									무한대 보상 (본인부담금 1건당 50만원) <br>② 자손 - 보험에 해당하는 제1운전자/제2운전자 : 1인당
									1,500만원 까지 (본인부담금 1건당 50만원) <br>③ 대물 - 사고를 당한 상대방의 차량이나 물건 : 건당
									2,000만원 까지 (본인부담금 1건당 30만원) <br><br>■ 차량손해면책제도(자차보험) 및 자기부담금 - 일반자차보험 :
									자기부담금 30만원 + 휴차보상료 부담 * 예외 : 승합차 및 준대형, 대형 승용차: 50만원 + 휴차보상료 부담
									<br><br>
									■ 휴차보상료란? <br>- 차량손해 면책제도 가입유무와 관계없이 사고로 인하여 영업손실이 야기 되었을 경우에는 발생한
									수리기간동안 1일 대여요금의 50%에 해당하는 휴차보상료가 청구 되며, 이는 임차인이 배상하여야 합니다. </span>
							</div>
		
						</li>
						<li>
							<div class="question question7">
								<span class="q_num">07</span>
								<span class="q_icn">Q</span>
								<span class="q_question">취소, 변경 등 환불수수료는 얼마인가요?</span>
								<span class="q_arrow"><i></i></span>
							</div>
		
							<div class="answer">
								<span class="a_icn">A</span>
								<span class="a_answer">
									■ 예약 취소 및 변경 <br>: 인수기준 24시간 이전 취소 시 전액환불 <br>:
									인수기준 24시간 이내 취소 시 수수료 전체요금의 10% 부과 <br>: 당일 인수지연으로 인한 변경시간 환불금액 없음
									<br>
									<br>
									■ 조기 반납 규정 <br>: 계약서상의 반납일자로부터 잔여시간 24시간 이상 반납시부터 조기반납 환불가능 <br>(총요금에서
									중도해약 수수료 10%공제) <br><br>■ 자사는 도청 및 공정거래위원회 심의 후 검토된 내용 및 규정을 준수하고 있습니다.
								</span>
							</div>
		
						</li>
						<li>
							<div class="question question8">
								<span class="q_num">08</span>
								<span class="q_icn">Q</span>
								<span class="q_question">운전면허증을 분실했는데 어떻게 하나요?</span>
								<span class="q_arrow"><i></i></span>
							</div>
		
							<div class="answer">
								<span class="a_icn">A</span>
								<span class="a_answer">
									면허증 없이는 차량 대여가 불가능합니다. <br>단, 면허증 대체서류 지참 후
									방문시 대여 가능합니다. <br><br>■ 면허증 대체 서류 종류 <br>① 운전경력 증명서 (7일 이내 발급건) <br>- 발급처 :
									경찰서, 민원 24 (공인인증서 필요) <br><br>② 임시면허증 (면허증 분실 후 1개월 이내 사용 가능한 임시 면허증) <br>-
									가까운 경찰서 민원실 <br><br>③ 국제 면허증 - 도로교통공단
								</span>
							</div>
		
						</li>
						<li>
							<div class="question question9">
								<span class="q_num">09</span><span class="q_icn">Q</span><span
									class="q_question">운전자 등록 인원은 몇 명까지 가능합니까?</span><span
									class="q_arrow"><i></i></span>
							</div>
		
							<div class="answer">
								<span class="a_icn">A</span>
								<span class="a_answer">
									■ 운전자 등록은 최대 2명까지 등록 가능하며, 제 1, 2운전자 고객님 모두 대여 자격에 적합해야 합니다. <br>■ 직접 지점 방문 시
									운전자께서 반드시 운전면허증 지참하여 방문하셔야만 운전자 등록 이 가능합니다. <br>■ 최초 운전자 등록 이후 운전자
									변경/삭제는 불가합니다
								</span>
							</div>
		
						</li>
						<li>
							<div class="question question10">
								<span class="q_num">10</span>
								<span class="q_icn">Q</span>
								<span class="q_question">대여자격 기준이 어떻게 되나요?</span>
								<span class="q_arrow"><i></i></span>
							</div>
		
							<div class="answer">
								<span class="a_icn">A</span>
									<span class="a_answer">
									■ 대여자격<br> 1)
									나이제한 및 외국인 <br>① 만23세 이상 (대형 및 승합은 만26세 이상, 쏠라티는 만30세 이상) <br>② 국내 혹은
									국제면허를 소지한 한국 거주 내,외국인 (국제면허증 또는 외국인인 경우, 한국어 의사소통, 국내거주지, 국내
									휴대폰 번호가 있는 경우에 한해 대여가능하며 또는 국내면허증을 소지한 내국인이 임차인 등록하고 공동임차인으로
									등록하여 대여가 가능합니다. 자세한 상담은 콜센터 1588-6615로 문의 부탁드립니다.) <br><br>2) 운전면허 <br>①
									도로교통법상 유효하며, 적성검사기간이 지나지 않은 운전면허증 소지자 <br>② 면허 취득 후 1년이 경과한 자 <br><br>3)
									면허종류 <br>① 2종 보통면허 - 승용차, 9인승 승합차 <br>② 1종이상 면허 - 11인승 이상 승합차 4) 재취득한
									면허 - 재취득한 면허가 1년 미만 시, 재취득 이전 면허를 포함하여 운전경력 기간이 1년이 상 일 경우
									'운전면허경력증명서'와 재취득한 면허증 지참시 운전경력 1년이상으로 인 정, 대여가능 합니다. ※ 운전경력 1년
									미만 대여불가
									</span>
							</div>
		
						</li>
					</ul>
				</div>
			</section>
		</section>
	</div>
	<script>

		$('#faq_wrap .faq_list ul li .answer').hide();

		$('#faq_wrap .faq_list ul li .question').click(function() {
			$('.answer').slideUp();
			$('.question').removeClass('open');
			console.log($(this))
			if ($(this).next().is(':hidden')) {
				$(this).next().slideDown();
				$(this).addClass('open');
			} else {
				$(this).next().slideUp();
				//$(this).children('.question').removeClass('open');
			}
		});
		
		// FAQ 페이지로 이동할 때 파라미터 있으면 동작
		function initParam(param) {
			if(param == null || param == "") return;
			
			$('.answer').slideUp();
			$('.question').removeClass('open');
			if ($('.question' + param).next().is(':hidden')) {
				$('.question' + param).next().slideDown();
				$('.question' + param).addClass('open');
				
				// 해당 파라미터에 해당하는 FAQ 자리로 이동
				$('.question' + param).attr("tabindex", -1).focus();
			} else {
				$('.question' + param).next().slideUp();
				//$(this).children('.question').removeClass('open');
			}
		}
		
		initParam('${param.FAQ}');
	</script>
	
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>


</body>
</html>