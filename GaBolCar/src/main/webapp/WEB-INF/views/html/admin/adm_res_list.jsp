<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_res_list.css">
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/adm_res_list.js"></script>
</head>
<body>
    <section id="sec_con" class="inr">
       	<div class="adm_page_title">관리자 페이지</div>
       	<div class="inq_container">
			<!-- 사이드바 -->
			<jsp:include page="../../inc/adm_sidebar.jsp" />
	        <!-- 오른쪽 컨텐츠 -->
			<div class="content_view">
				<section id="adm_car">
					<span id="adm_car_title">[관리자] 예약리스트</span>	
					<article id="adm_car_bottom">
						<span id="adm_search">
							<select id="search_cate">
								<option value="">검색 옵션</option>
								<option value="res_idx">예약번호</option>
								<option value="car_idx">차량코드</option>
								<option value="mem_idx">회원번호</option>
							</select> 
							<input type="search" name="search_keyword" id="search_box">
							<button name="item_search" class="adm_car_button">
								검색
							</button>
						</span>
					</article>				
<!-- 					<article id="adm_car_top"> -->
<!-- 						<label> -->
<!-- 							<input type="checkbox" name="date_type" class="adm_res_date" value="최신순">최신순 -->
<!-- 						</label> -->
<!-- 						<label> -->
<!-- 							<input type="checkbox" name="date_type" class="adm_res_date" value="오래된순">오래된순 -->
<!-- 						</label> -->
<!-- 					</article> -->
					<article id="adm_car_center">
						<table id="adm_res_list" class="adm_res_list">
							<tr id="adm_res_title">
								<td>예약번호</td>
								<td>예약일시</td>
								<td>차량코드</td>
								<td>회원번호</td>
								<td>대여일시</td>
								<td>반납일시</td>
								<td>상세보기</td>						
							</tr>		
						</table>
					</article>
					<article id="pageList">
						<input type="button" id="prvsPage"class="adm_car_button" value="이전">
						<span id="nowPage"></span>
						<input type="button" id="nextPage" class="adm_car_button" value="다음">
                     </article>

				</section>
			</div>
		</div>
   	</section>
</body>
</html>