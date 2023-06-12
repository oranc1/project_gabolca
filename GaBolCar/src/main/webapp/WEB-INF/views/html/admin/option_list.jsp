<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 수정중 -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>차량 옵션 리스트</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/option_list.css">
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/option_list.js"></script>
</head>
<body>
	<section id="optionList_main">
    	<div id="optionList_title">
      		<h1>차량 옵션 리스트</h1>
    	</div>
		<div id="optionList">
			<ul class="option_title">
				<li>옵션 코드</li>
				<li>옵션 명</li>
				<li>옵션 이미지</li>
				<li>관리</li>
			</ul>
			<c:forEach var="option" items="${optionList }">
			<ul class="option_content">
				<li>${option.option_idx }</li>
				<li>${option.option_name }</li>
				<li>
					<img id="option_image" src="${pageContext.request.contextPath }/resources/upload/car_options/${option.option_image_url }">
				</li>
				<li>
               		<button name="option_update" value="${option.option_idx }">
						수정
					</button>
               		<button name="option_delete" value="${option.option_idx }">
						삭제
					</button>
				</li>
			</ul>
			</c:forEach>
		</div>
		<div id="optionbtn">
			<button id="option_insert">신규등록</button>
			<button onclick="history.back()">뒤로가기</button>
		</div>
	</section>
</body>
</html>