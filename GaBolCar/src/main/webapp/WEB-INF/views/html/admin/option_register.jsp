<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>옵션 등록</title>
<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/admin/brc_opt_open.css" rel="stylesheet">
<%-- <script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/option_register.js"></script>
</head>
<body>
    <section id="main_section">
		<div id="title_container">
			<h1>옵션 등록</h1>
		</div>
		<form action="optionRegisterPro" name="writeForm" method="post" enctype="multipart/form-data">
			<div id="Form">
				<table>
					<tr>
						<td class="td_left"><label for="option_name">옵션명</label></td>
						<td class="td_right"><input type="text" name="option_name" required="required" class="form-control" /></td>
	              	</tr>
					<tr>
		                <td class="td_left"><label for="option_image">옵션 이미지</label></td>
		                <td class="td_right"><input type="file" accept="image/*" name="option_image" required="required" class="form-control" /></td>
					</tr>
            	</table>
	            <div id="btnArea">
		           	<button id="submitBtn" class="btn btn-warnig">등록</button>
					<input type="reset" class="btn btn-secondary" value="초기화">
					<button id="closeBtn" class="btn btn-secondary">닫기</button>
	            </div>
			</div>
		</form>
    </section>
</body>
</html>