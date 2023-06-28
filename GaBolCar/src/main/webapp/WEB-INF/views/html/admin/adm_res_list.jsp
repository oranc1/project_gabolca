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
<%-- <script src="${pageContext.request.contextPath }/resources/js/admin/adm_res_list.js"></script> --%>
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
					<article id="adm_car_top">
						<form action="ResListForm" method="GET" class="search-form">
							<select name="searchType" id="searchType" >
								<option value="res_idx" <c:if test="${param.searchType eq 'res_idx' }">selected</c:if>>예약번호</option>
								<option value="car_idx" <c:if test="${param.searchType eq 'car_idx' }">selected</c:if>>차량코드</option>
								<option value="mem_idx" <c:if test="${param.searchType eq 'mem_idx' }">selected</c:if>>회원번호</option>
							</select>
							<input type="text" name="searchKeyword" value="${param.searchKeyword }"  id="searchKeyword">
							<input type="submit" value="검색" class="adm_car_button">				
						</form>
					</article>				
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
							<c:forEach var="res" items="${resList }">
								<tr>
								<td>${res.res_idx }</td>
								<td><fmt:formatDate value="${res.res_time }" pattern="yy-MM-dd HH:mm" /></td>
								<td>${res.car_idx }</td>
								<td>${res.mem_idx }</td>
								<td><fmt:formatDate value="${res.res_rental_date }" pattern="yy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${res.res_return_date }" pattern="yy-MM-dd HH:mm" /></td>
								<td>
								<input type="button" value="상세" class="adm_car_button" 
									onclick="window.open('AdmResDetail?res_idx=${res.res_idx}','예약상세','width=700, height=700');">									
								</td>
								</tr>	
							</c:forEach>	
						</table>
					</article>
					<article id="pageList">
                       <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
                           <!-- 각 페이지마다 하이퍼링크 설정 -->
                           <c:choose>
                               <c:when test="${pageNum eq i }">
                                   <b>${i }</b>
                               </c:when>
                               <c:otherwise>
                                   <a href="ResListForm?pageNum=${i }">${i }</a>
                               </c:otherwise>
                           </c:choose>
                       </c:forEach> 
                    </article>
				</section>
			</div>
		</div>
   	</section>
</body>
</html>