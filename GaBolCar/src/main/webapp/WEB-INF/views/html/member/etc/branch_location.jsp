<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/etc/branch_location.css" >

</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include> 
	</header>
	<section id="sec_con" class="inr">
		<article class="branch_top">
			<h1 class="con_title">찾아오시는길</h1>
			<!-- 카카오 맵 API appkey 변경필요
			도메인 사이트 설정필요 -->
			<div id="map"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1a47a651626dab122ca303d5b28aeda"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/member/etc/branch_location_map.js"></script>
		</article>
		<article class="branch_bottom">
			<!-- 지점 배열로 받아 출력 -->
			<div class="branch_location_instan">
				<div class="branch_location_title">부산진구 본점</div>
				<ul class="branch_location_info">
					<li>
						<span class="li_tit">ADDRESS</span>
						<span class="li_txt">location_addr</span>
					</li>
					<li>
						<span class="li_tit">TEL</span>
						<span class="li_txt">location_tel</span>
					</li>
					<li>
						<span class="li_tit">E-MAIL</span>
						<span class="li_txt">location_email</span>
					</li>
				</ul>
			</div>
			<!-- 지점 배열 출력 종료 -->
			<div class="branch_location_instan">
				<div class="branch_location_title">부산진구 본점</div>
				<ul class="branch_location_info">
					<li>
						<span class="li_tit">ADDRESS</span>
						<span class="li_txt">location_addr</span>
					</li>
					<li>
						<span class="li_tit">TEL</span>
						<span class="li_txt">location_tel</span>
					</li>
					<li>
						<span class="li_tit">E-MAIL</span>
						<span class="li_txt">location_email</span>
					</li>
				</ul>
			</div>
			
			<div class="branch_location_instan">
				<div class="branch_location_title">부산진구 본점</div>
				<ul class="branch_location_info">
					<li>
						<span class="li_tit">ADDRESS</span>
						<span class="li_txt">location_addr</span>
					</li>
					<li>
						<span class="li_tit">TEL</span>
						<span class="li_txt">location_tel</span>
					</li>
					<li>
						<span class="li_tit">E-MAIL</span>
						<span class="li_txt">location_email</span>
					</li>
				</ul>
			</div>
			
			<div class="branch_location_instan">
				<div class="branch_location_title">부산진구 본점</div>
				<ul class="branch_location_info">
					<li>
						<span class="li_tit">ADDRESS</span>
						<span class="li_txt">location_addr</span>
					</li>
					<li>
						<span class="li_tit">TEL</span>
						<span class="li_txt">location_tel</span>
					</li>
					<li>
						<span class="li_tit">E-MAIL</span>
						<span class="li_txt">location_email</span>
					</li>
				</ul>
			</div>
		</article>
	</section>
    <footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include> 
	</footer>
</body>
</html>
