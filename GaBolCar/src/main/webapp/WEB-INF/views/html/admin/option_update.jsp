<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>옵션 수정</title>
<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
    <section id="reg_section">
        <div id="title_container">
			<h1>옵션 수정</h1>
        </div>
        <form action="optionUpdatePro" name="writeForm" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="option_idx" value="${option.option_idx }">
			<div id="modifyForm">
				<table>
					<tr>
		                <td class="td_left"><label for="option_name">옵션명</label></td>
		                <td class="td_right"><input type="text" name="option_name" required="required" class="form-control" value="${option.option_name }"/></td>
					</tr>
					<tr>
						<td class="td_left"><label for="option_image">옵션 이미지</label></td>
						<td class="td_right"><input type="file" name="option_image" required="required" class="form-control" /></td>
					</tr>
				</table>
				<div id="commandCell">
					<input type="submit" value="수정" class="btn btn-warning" style="background-color: rgb(255, 94, 0); color: #FFFFFF;">&nbsp;&nbsp;
					<input type="reset" value="초기화" class="btn btn-secondary">&nbsp;&nbsp;
					<input type="button" value="닫기" onclick="close()" class="btn btn-secondary">
				</div>
			</div>
		</form>
	</section>
    <script src="${pageContext.request.contextPath }/resources/js/admin/option_register.js"></script>
</body>
</html>