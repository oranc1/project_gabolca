<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 수정중 -->

<%-- 원본 파일 이름 car_leg --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>차량 등록</title>

<link
	href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>

<link
	href="${pageContext.request.contextPath }/resources/css/inc/top.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/inc/footer.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath }/resources/css/admin/adm_car_leg.css"
	rel="stylesheet">
</head>
<body>

	<header>
		<jsp:include page="../../inc/top1.jsp"></jsp:include>
	</header>

	<section id="reg_section">
		<div id="title_container">
			<h1>차량 등록</h1>
		</div>
		<form action="CarRegistrationPro.bo" name="writeForm" method="post"
			enctype="multipart/form-data">
			<div id="modifyForm">
				<table>
					<tr>
						<td class="td_left"><label for="car_idx">차량코드</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_type">차종</label></td>
						<td class="td_right"><select name="car_type"
							required="required" class="form-select">
								<option value="">선택하세요</option>
								<option value="sedan">경형</option>
								<option value="suv">준중형</option>
								<option value="hatchback">대형</option>
								<option value="coupe">SUV</option>
								<option value="coupe">전기</option>
								<option value="coupe">승합</option>
								<option value="coupe">수입</option>
						</select></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_number">차량번호</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_company">제조사</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_idx">모델명</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_idx">연식</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>

					<tr>
						<td class="td_left"><label for="car_type">변속타입</label></td>
						<td class="td_right"><select name="car_type"
							required="required" class="form-select">
								<option value="">선택하세요</option>
								<option value="sedan">수동</option>
								<option value="suv">자동</option>
						</select></td>
					</tr>

					<tr>
						<td class="td_left"><label for="car_type">연료</label></td>
						<td class="td_right"><select name="car_type"
							required="required" class="form-select">
								<option value="">선택하세요</option>
								<option value="sedan">가솔린</option>
								<option value="suv">디젤</option>
								<option value="hatchback">LPG</option>
								<option value="coupe">하이브리드</option>
								<option value="coupe">전기</option>
								<option value="coupe">가솔린+LPG</option>
						</select></td>
					</tr>

					<tr>
						<td class="td_left"><label for="car_idx">정원</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_idx">나이제한</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_idx">운전경력제한</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>

					<tr>
						<td class="td_left"><label for="car_type">면허종류</label></td>
						<td class="td_right"><select name="car_type"
							required="required" class="form-select">
								<option value="">선택하세요</option>
								<option value="sedan">1종</option>
								<option value="suv">2종</option>
						</select></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_idx">주중 대여료</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_idx">주말 대여료</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_idx">차량 지점 코드</label></td>
						<td class="td_right"><input type="text" name="car_idx"
							required="required" class="form-control" /></td>
					</tr>
					<tr>
						<td class="td_left"><label for="options">옵션</label></td>
						<td class="td_right">
							<div class="row">
								<div class="col-md-6">
									<label class="checkbox-label"> <input type="checkbox"
										id="selectAllCheckbox"> 전체 선택
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="국제운전면허증가능"> 국제운전면허증가능
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="긴급출동무료"> 긴급출동무료
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="충전기제공"> 충전기제공
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="카시트무료(수량한정)"> 카시트무료(수량한정)
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="열선시트"> 열선시트
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="금연"> 금연
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="블루투스"> 블루투스
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="썬루프"> 썬루프
									</label>
								</div>
								<div class="col-md-6">
									<label class="checkbox-label"> <input type="checkbox"
										name="options" value="열선시트"> 열선시트
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="스마트키"> 스마트키
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="네비게이션"> 네비게이션
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="후방카메라"> 후방카메라
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="블랙박스"> 블랙박스
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="USB"> USB
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="AUX"> AUX
									</label> <label class="checkbox-label"> <input type="checkbox"
										name="options" value="AUX"> 하이패스
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="td_left"><label for="car_file">차량 이미지 첨부</label></td>
						<td class="td_right"><input type="file" name="car_file"
							required="required" class="form-control" /></td>
					</tr>
				</table>
				<div id="commandCell">
					<input type="submit" value="등록" class="btn btn-warning"
						style="background-color: rgb(255, 94, 0); color: #FFFFFF;">&nbsp;&nbsp;
					<input type="reset" value="다시쓰기" class="btn btn-secondary">&nbsp;&nbsp;
					<input type="button" value="취소" onclick="history.back()"
						class="btn btn-secondary">
				</div>
			</div>
		</form>
	</section>
	<script>
		document.addEventListener('DOMContentLoaded',
				function() {
					var selectAllCheckbox = document
							.getElementById('selectAllCheckbox');
					var checkboxes = document
							.querySelectorAll('input[name="options"]');

					selectAllCheckbox.addEventListener('change', function() {
						checkboxes.forEach(function(checkbox) {
							checkbox.checked = selectAllCheckbox.checked;
						});
					});
				});
	</script>


	<jsp:include page="../../inc/footer.jsp"></jsp:include>
</body>
</html>