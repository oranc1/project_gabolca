<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_dash.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/adm_dash.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
    <section id="sec_con" class="inr">
       	<div class="adm_page_title">관리자 페이지</div>
      	<div class="inq_container">
			<!-- 사이드바 -->
			<jsp:include page="../../inc/adm_sidebar.jsp" />
            <!-- 오른쪽 컨텐츠 -->
			<div class="content_view">
				<section id="adm_dash_main">
					<article id="adm_dash_left">
						<div id="adm_dash_left_top">
							<div id="month_brc_sales"></div>
						</div>
						<div id="adm_dash_left_bottom">
							<div id="brc_popular_model"></div>
							<div id="month_rental_count"></div>
						</div>
					</article>
					<article id="adm_dash_right">
						<div id="car_status"></div>
						<div id="car_type_rent"></div>
						<div id="age_popular_model"></div>
					</article>
				</section>
			</div>
		</div>
    </section>
</body>
</html>