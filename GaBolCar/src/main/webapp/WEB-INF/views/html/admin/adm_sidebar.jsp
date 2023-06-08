<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!-- 수정 중 -->
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Document</title>
 <link
	href="${pageContext.request.contextPath }/resources/css/inc/top.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/inc/footer.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_car_list.css">
 
 <script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/adm_car_list.js"></script>

</head>
<body>
	
	<header>
		<jsp:include page="../../inc/top1.jsp"></jsp:include>
	</header>
	
    <section id="sec_con" class="inr">
       	<div class="adm_page_title">관리자 페이지</div>
        <div class="inq_container">
            <!-- 사이드바 -->
            <div class="mypage_sidebar">
                <!-- 유저 프로필 -->
                <div class="user_profile">
                    <dl class="user_info">
                        <dt><b>홍길동</b> 님</dt>
                        <dd>abcd1234@naver.com</dd>
                    </dl>
                </div>

                <ul class="side_menu">
                    <li>
                        <div class="menu_tit mt_car">
                            <span>차량 관리</span>
                        </div>
                        <ul class="side_sub">
                            <li>
                                <a href="?page=adm_car_list.jsp">차량 리스트</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <div class="menu_tit mt_user">
                            <span>리뷰 관리</span>
                        </div>
                        <ul class="side_sub">
                            <li>
                            	<a href="?page=adm_review_list.jsp">리뷰 리스트</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div> <!-- mypage_sidebar -->

            <!-- 오른쪽 컨텐츠 -->
            <div class="content_view">
<%--             	<c:choose> --%>
<%-- 					<c:when test="${!empty param.page }">            	 --%>
<%-- 						<jsp:include page="inc/${param.page }" /> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<jsp:include page="inc/${param.main }" />  --%>
<!-- 						기본 관리자 메인페이지 시간남으면 진행 - 전체차량 대수, 예약가능, 예약중, 신규리뷰 -->
<%-- 					</c:otherwise> --%>
<%--             	</c:choose> --%>
            </div>
        </div>
    </section>
    
	<jsp:include page="../../inc/footer.jsp"></jsp:include>
    <script>
        $('.menu_tit').click(function () {
            $(this).children('span').addClass('on');
            if ($(this).siblings('.side_sub').is(':hidden')) {
                $(this).siblings('.side_sub').slideDown();
                $(this).children('span').removeClass('on');
            } else {
                $(this).siblings('.side_sub').slideUp();
            }
        });
    </script>
</body>
</html>