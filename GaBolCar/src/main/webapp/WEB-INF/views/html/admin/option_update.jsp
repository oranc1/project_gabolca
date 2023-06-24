<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>옵션 수정</title>
<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/admin/brc_opt_open.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/option_update.js"></script>
</head>
<body>
    <section id="main_section">
        <div id="title_container">
			<h1>옵션 수정</h1>
        </div>
        <form action="optionUpdatePro" id="updateForm" name="writeForm" method="post" enctype="multipart/form-data">
        	<input type="hidden" id="option_idx" name="option_idx" value="${option.option_idx }">
        	<input type="hidden" id="option_image_url" name="option_image_url" value="${option.option_image_url }">
			<div id="Form">
				<table>
					<tr>
		                <td class="td_left"><label for="option_name">옵션명</label></td>
		                <td class="td_right"><input type="text" name="option_name" required="required" class="form-control" value="${option.option_name }"/></td>
					</tr>
					<tr>
						<c:choose>
							<c:when test="${empty option.option_image_url }">
								<td class='td_left' id="opth_1"><label for='option_image'>옵션 이미지</label></td>
								<td class='td_right' id="opth_2"><input type='file' accept="image/*" name='option_image' required='required' class='form-control'/></td>
							</c:when>
							<c:otherwise>
								<td class="td_left" id="opth_1"><img src="${pageContext.request.contextPath }/resources/upload/car_options/${option.option_image_url }"></td>
								<td class="td_right" id="opth_2"><button id="imageDelete" type="button" class="btn btn-secondary">삭제</button></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
				<div id="btnArea">
					<button id="submitBtn" class="btn btn-warnig">수정</button>
					<input type="reset" class="btn btn-secondary" value="초기화">
					<button id="closeBtn" class="btn btn-secondary">닫기</button>
				</div>
			</div>
		</form>
	</section>
</body>
</html>