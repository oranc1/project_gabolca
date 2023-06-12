<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 수정중 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Car_Leg</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/option_list.css">
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
	<section id="optionList_main">
    	<div id="optionList_title">
      		<h1>차량 등록</h1>
    	</div>
		<div id="optionList">
			<ul class="option_title">
				<li>옵션 코드</li>
				<li>옵션 명</li>
				<li>옵션 이미지</li>
				<li>
					<input type="checkbox" name="checkAll">
				</li>
			</ul>
			<ul class="option_content">
				<li>c1</li>
				<li>c2</li>
				<li>c3</li>
				<li>
					<input type="checkbox">
				</li>
			</ul>
		</div>
		<div id="optionbtn">
			<button>신규등록</button>
			<button>삭제</button>
			<button>뒤로가기</button>
		</div>
	</section>
</body>
</html>