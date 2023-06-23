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
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_mem_list.css">
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/adm_mem_list.js"></script>
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
					<span id="adm_car_title">[관리자] 회원리스트</span>
					<article id="adm_car_bottom">
						<span id="adm_search">
							<select id="search_cate">
								<option value="">검색 옵션</option>
								<option value="mem_idx">회원번호</option>
								<option value="mem_name">회원이름</option>	
							</select>
						</span>
					</article>
					<article id="adm_car_center">
						<table id="adm_mem_list" class="adm_mem_list">
							<tr id="adm_mem_title">
								<td>회원번호</td>
								<td>ID</td>
								<td>이름</td>
								<td>가입일</td>
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