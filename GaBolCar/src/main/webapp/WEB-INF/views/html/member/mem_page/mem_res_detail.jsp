<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/casper.jpg">
						<b>렌트중</b>
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
									<li>KD123456<br>
									<br></li>
									<li>공항점</li>
									<li>2023 5.19(금) 13:00<br>
									<br></li>
									<li>연동점</li>
									<li>2023 5.20(금) 16:00<br>
									<br></li>
									<li class="res_detail_totalcost">92,900 원</li>
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
									<li>차량 옵션</li>
								</ul>
								<ul class="side_sub ss_r">
									<li>캐스퍼</li>
									<li>가솔린</li>
									<li>경차</li>
									<li>자동</li>
									<li>4인승</li>
									<li>네비게이션</li>
									<!-- 차량 옵션 -->
									<li>후방카메라</li>
									<li>블랙박스</li>
									<li>통풍시트</li>
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
									<li>홍길동</li>
									<li>1998.10.18</li>
									<li>010-3828-3391</li>
									<li>1종보통</li>
								</ul>
							</div>
						</li>
						<li>
							<div class="menu_tit">
								<span>보험 정보</span>
							</div>
							<div id="insu_s" class="res_con_wrap">
								<ul class="side_sub ss_t">
									<li>보험명</li>
									<li>보험비</li>
									<li>보험 보장 요약</li>
								</ul>
								<ul class="side_sub ss_r">
									<li>실속보장형(1)</li>
									<li>32,900</li>
									<li>자차 피해보상 500한도</li>
									<li>자기부담금 최대 20만원</li>
								</ul>
							</div>
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