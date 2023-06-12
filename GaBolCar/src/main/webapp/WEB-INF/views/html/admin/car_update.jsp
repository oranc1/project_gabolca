<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 수정중 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>carModify</title>
 
<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/admin/car_register.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
	<section id="reg_section">
    	<div id="title_container">
      		<h1>차량 수정</h1>
    	</div>
		<form action="carUpdatePro" name="writeForm" method="post">
			<input type="hidden" name="car_idx" value="${car.car_idx }">
	  		<div id="modifyForm">
	    		<table>
	      			<tr>
	        			<td class="td_left"><label for="car_type">차종</label></td>
	        			<td class="td_right">
	          				<select name="car_type" required="required" class="form-select">
	            				<option value="">선택하세요</option>
	            				<option value="경형">경형</option>
	            				<option value="준중형">준중형</option>
	            				<option value="대형">대형</option>
	            				<option value="SUV">SUV</option>
					            <option value="전기">전기</option>
					            <option value="승합">승합</option>
					            <option value="수입">수입</option>
							</select>
	        			</td>
	      			</tr>
					<tr>
			            <td class="td_left"><label for="car_number">차량번호</label></td>
			            <td class="td_right"><input type="text" name="car_number" required="required" class="form-control" /></td>
					</tr>
          			<tr>
			            <td class="td_left"><label for="car_company">제조사</label></td>
			            <td class="td_right"><input type="text" name="car_company" required="required" class="form-control" /></td>
          			</tr>
          			<tr>
            			<td class="td_left"><label for="car_model">모델명</label></td>
            			<td class="td_right"><input type="text" name="car_model" required="required" class="form-control" /></td>
          			</tr>
          			<tr>
            			<td class="td_left"><label for="car_old">연식</label></td>
            			<td class="td_right"><input type="text" name="car_old" required="required" class="form-control" /></td>
          			</tr>
          			<tr>
			            <td class="td_left"><label for="car_shift_type">변속타입</label></td>
			            <td class="td_right">
              				<select name="car_shift_type" required="required" class="form-select">
								<option value="">선택하세요</option>
								<option value="수동">수동</option>
								<option value="자동">자동</option>
              				</select>
            			</td>
          			</tr>
          			<tr>
		            <td class="td_left"><label for="car_fuel_type">연료</label></td>
		            <td class="td_right">
						<select name="car_fuel_type" required="required" class="form-select">
			                <option value="">선택하세요</option>
							<option value="가솔린">가솔린</option>
							<option value="디젤">디젤</option>
							<option value="LPG">LPG</option>
							<option value="하이브리드">하이브리드</option>
							<option value="전기">전기</option>
							<option value="가솔린+LPG">가솔린+LPG</option>
		              	</select>
					</td>
          		</tr>
          		<tr>
		            <td class="td_left"><label for="car_riding">정원</label></td>
		            <td class="td_right"><input type="text" name="car_riding" required="required" class="form-control" /></td>
          		</tr>		
          		<tr>
            		<td class="td_left"><label for="car_age">나이제한</label></td>
            		<td class="td_right"><input type="text" name="car_age" required="required" class="form-control" /></td>
          		</tr>		
          		<tr>
            		<td class="td_left"><label for="car_career">운전경력제한</label></td>
            		<td class="td_right"><input type="text" name="car_career" required="required" class="form-control" /></td>
          		</tr>		
          		<tr>
		            <td class="td_left"><label for="car_license">면허종류</label></td>
		            <td class="td_right">
              			<select name="car_license" required="required" class="form-select">
                			<option value="">선택하세요</option>
							<option value="1종">1종</option>
							<option value="2종">2종</option>
              			</select>
            		</td>
          		</tr>
          		<tr>
           			 <td class="td_left"><label for="car_weekdays">주중 대여료</label></td>
           			 <td class="td_right"><input type="text" name="car_weekdays" required="required" class="form-control" /></td>
         		 </tr>
         		 <tr>
		            <td class="td_left"><label for="car_weekend">주말 대여료</label></td>
		            <td class="td_right"><input type="text" name="car_weekend" required="required" class="form-control" /></td>
         		 </tr>
        		 <tr>
					<td class="td_left"><label for="brc_name">지점명</label></td>
					<td class="td_right">
              			<select name="brc_name" required="required" class="form-select">
               				<option value="">선택</option>
              				<c:forEach var="brc" items="${brcList }">
                				<option value="${brc.brc_name }">${brc.brc_name }</option>
               				</c:forEach>
              			</select>
					</td>
          		</tr>
        		 <tr>
					<td class="td_left"><label for="car_status">차량상태</label></td>
					<td class="td_right">
              			<select name="car_status" required="required" class="form-select">
               				<option value="">선택</option>
               				<option value="정비">정비</option>
               				<option value="대여">대여</option>
               				<option value="정상">정상</option>
              			</select>
					</td>
          		</tr>
	     		<tr>
			        <td class="td_left">
			        	<label for="options">옵션</label>
			        </td>
			        <td class="td_right">
	          		<div class="row">
	            		<div class="col-md-6">
							<label class="checkbox-label">
	                			<input type="checkbox" id="selectAllCheckbox">
	                			전체 선택
	              			</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="국제운전면허증가능">
  								국제운전면허증가능
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="긴급출동무료">
								긴급출동무료
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="충전기제공">
								충전기제공
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="카시트무료(수량한정)">
								카시트무료(수량한정)
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="열선시트">
								열선시트
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="금연">
								금연
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="블루투스">
								블루투스
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="썬루프">
								썬루프
							</label>
	            		</div>
	            		<div class="col-md-6">
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="열선시트">
								열선시트
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="스마트키">
								스마트키
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="네비게이션">
								네비게이션
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="후방카메라">
								후방카메라
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="블랙박스">
								블랙박스
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="USB">
								USB
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="AUX">
								AUX
							</label>
							<label class="checkbox-label">
								<input type="checkbox" name="options" value="AUX">
								하이패스
							</label>
	            		</div>
					</div>
	        	</td>
			</tr>
	      	<tr>
		        <td class="td_left"><label for="car_image_url">차량 이미지 첨부</label></td>
		        <td class="td_right"><input type="file" name="car_image_url" required="required" class="form-control" /></td>
	      	</tr>
	    </table>
	    <div id="commandCell">
	      	<input type="submit" value="등록" class="btn btn-warning">&nbsp;&nbsp;
	      	<input type="reset" value="다시쓰기" class="btn btn-secondary">&nbsp;&nbsp;
	      	<input type="button" value="취소" onclick="history.back()" class="btn btn-secondary">
	    </div>
		</div>
	</form>
	</section>
	<script>
	  document.addEventListener('DOMContentLoaded', function() {
	    var selectAllCheckbox = document.getElementById('selectAllCheckbox');
	    var checkboxes = document.querySelectorAll('input[name="options"]');
	  
	    selectAllCheckbox.addEventListener('change', function() {
	      checkboxes.forEach(function(checkbox) {
	        checkbox.checked = selectAllCheckbox.checked;
	      });
	    });
	  });
	</script>
	<script type="text/javascript">
		$(function(){
			$("select[name=car_type]").val("${car.car_type}");
			$("input[name=car_number]").val("${car.car_number}");
			$("input[name=car_company]").val("${car.car_company}");
			$("input[name=car_model]").val("${car.car_model}");
			$("input[name=car_old]").val("${car.car_old}");
			$("select[name=car_shift_type]").val("${car.car_shift_type}");
			$("select[name=car_fuel_type]").val("${car.car_fuel_type}");
			$("input[name=car_riding]").val("${car.car_riding}");
			$("input[name=car_age]").val("${car.car_age}");
			$("input[name=car_career]").val("${car.car_career}");
			$("select[name=car_license]").val("${car.car_license}");
			$("input[name=car_weekdays]").val("${car.car_weekdays}");
			$("input[name=car_weekend]").val("${car.car_weekend}");
			$("select[name=brc_name]").val("${car.brc_name}");
			// 옵션 값 가져와서 체크활성화
			// 차량이미지 관련 확인필요
		});
	</script>
</body>
</html>