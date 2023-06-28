<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약 상세</title>
<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/admin/adm_res_detail.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<section id="main_section">
	    <div id="title_container">
			<h1>예약 상세</h1>
	    </div>
	   	<table>
			<tr>
				<td class="td_left"><label for="res_idx">예약번호</label></td>
				<td>${resDetail.res_idx}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="res_time">예약일시</label></td>
				<td>${resDetail.res_time}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="car_idx">차량코드</label></td>
				<td>${resDetail.car_idx}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="mem_idx">회원번호</label></td>
				<td>${resDetail.mem_idx}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="res_rental_date">대여일시</label></td>
				<td>${resDetail.res_rental_date}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="res_return_date">반납일시</label></td>
				<td>${resDetail.res_return_date}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="brc_rent_name">대여장소</label></td>
				<td>${resDetail.brc_rent_name}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="brc_return_name">반납장소</label></td>
				<td>${resDetail.brc_return_name}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="lic_num">면허증번호</label></td>
				<td>${resDetail.lic_num}</td>
			</tr>
		</table>
		<div id="btnArea">
			<button id="closeBtn" class="btn btn-secondary" onclick="window.close()">닫기</button>
		</div>
	</section>

</body>
</html>