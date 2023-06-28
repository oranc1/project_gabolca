<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 상세</title>
<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/admin/adm_mem_detail.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<section id="main_section">
	    <div id="title_container">
			<h1>회원 상세</h1>
	    </div>
    	<table>
			<tr>
				<td class="td_left"><label for="mem_idx">회원번호</label></td>
				<td>${memDetail.mem_idx}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="mem_id">아이디(이메일)</label></td>
				<td>${memDetail.mem_id}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="mem_name">이름</label></td>
				<td>${memDetail.mem_name}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="mem_mtel">휴대폰번호</label></td>
				<td>${memDetail.mem_mtel}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="mem_addr">주소</label></td>
				<td>${memDetail.mem_addr}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="mem_birthday">생년월일</label></td>
				<td>${memDetail.mem_birthday}</td>
			</tr>
			<tr>
				<td class="td_left"><label for="mem_sign_date">가입일</label></td>
				<td>${memDetail.mem_sign_date}</td>
			</tr>
		</table>
		<div id="btnArea">
			<button id="closeBtn" class="btn btn-secondary" onclick="window.close()">닫기</button>
		</div>
	</section>

</body>
</html>