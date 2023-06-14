<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>지점등록</title>
<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/admin/brc_opt_open.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1a47a651626dab122ca303d5b28aeda&libraries=services"></script>
</head>
<body>
	<section id="main_section">
	    <div id="title_container">
	      <h1>지점 등록</h1>
	    </div>
		<form action="brcRegisterPro" name="writeForm" method="post" onsubmit="return false;">
			<div id="Form">
				<table>
	          		<tr>
			            <td class="td_left"><label for="brc_name">지점명</label></td>
			            <td class="td_right"><input type="text" name="brc_name" required="required" class="form-control" /></td>
	          		</tr>
					<tr>
		        		<td class="td_left"><label for="brc_addr">주소</label></td>
			          	<td class="td_right">
			      			<input type="text" size="40" name="brc_addr" id="address" class="form-control" required="required">
							<input type="hidden" name="map_x">
							<input type="hidden" name="map_y">
						</td>
					</tr>
					<tr>
						<td class="td_left"><label for="brc_tel">전화번호</label></td>
						<td class="td_right"><input type="text" name="brc_tel" required="required" class="form-control" /></td>
					</tr>
	        	</table>
			    <div id="btnArea">
			      	<button id="submitBtn" class="btn btn-warnig">등록</button>
					<button id="resetBtn" class="btn btn-secondary">초기화</button>
					<button id="closeBtn" class="btn btn-secondary">닫기</button>
			    </div>
		  	</div>
		</form>
	</section>
	<script src="${pageContext.request.contextPath }/resources/js/admin/brc_open.js"></script>
</body>
</html>