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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_mem_list.css">
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
				<section id="adm_car">
					<span id="adm_car_title">[관리자] 회원리스트</span>
					<article id="adm_car_top">
						<form action="MemListForm" method="GET" class="search-form">
							<select name="searchType" id="searchType" >
								<option value="mem_idx" <c:if test="${param.searchType eq 'mem_idx' }">selected</c:if>>회원번호</option>
								<option value="mem_name" <c:if test="${param.searchType eq 'mem_name' }">selected</c:if>>회원이름</option>
							</select>
							<input type="text" name="searchKeyword" value="${param.searchKeyword }"  id="searchKeyword">
							<input type="submit" value="검색" class="adm_car_button">				
						</form>
					</article>
					<article id="adm_car_center">
						<table id="adm_mem_list" class="adm_mem_list">
							<tr id="adm_mem_title">
								<td>회원번호</td>
								<td>아이디(이메일)</td>
								<td>이름</td>
								<td>가입일</td>
								<td>상세보기</td>
							</tr>
							<c:forEach var="mem" items="${memList }">
								<tr>
								<td>${mem.mem_idx }</td>
								<td>${mem.mem_id }</td>
								<td>${mem.mem_name }</td>
								<td>${mem.mem_sign_date }</td>
								<td>
								<input type="button" value="상세" class="adm_car_button" 
									onclick="window.open('AdmMemDetail?mem_idx=${mem.mem_idx}','회원상세','width=700, height=700');">									
								</td>
								</tr>	
							</c:forEach>	
						</table>
					</article>	
					<article id="pageList">
                       <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
                           <c:choose>
                               <c:when test="${pageNum eq i }">
                                   <b>${i }</b>
                               </c:when>
                               <c:otherwise>
                                   <a href="MemListForm?pageNum=${i }">${i }</a>
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