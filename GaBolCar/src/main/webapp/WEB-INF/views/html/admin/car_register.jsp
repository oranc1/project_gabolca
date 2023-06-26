<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 수정중 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Car_Leg</title>
 
<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/admin/car_register.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
	<section id="reg_section">
    	<div id="title_container">
      		<h1>차량 등록</h1>
    	</div>
		<form action="CarRegisterPro" name="writeForm" method="post" enctype="multipart/form-data">
	  		<div id="modifyForm">
	    		<table>
	      			<tr>
	        			<td class="td_left"><label for="car_type">차종</label></td>
	        			<td class="td_right">
	          				<select name="car_type" required="required" class="form-select">
	            				<option value="">선택하세요</option>
	            				<option value="경형/소형">경형/소형</option>
	            				<option value="준중형">준중형</option>
	            				<option value="중형">중형</option>
	            				<option value="대형">대형</option>
	            				<option value="SUV">SUV</option>
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
						<td class="td_left">
							<label for="option_name">옵션</label>
				        </td>
						<td class="td_right">
			          		<div class="row">
			            		<div class="col-md-12">
									<label class="checkbox-label">
			                			<input type="checkbox" id="selectAllCheckbox">
			                			전체 선택
			              			</label>
			              			<c:forEach var="option" items="${optionList }">
										<label class="checkbox-label">
											<input type="checkbox" name="option_idx" value="${option.option_idx }">
			  								${option.option_name }
										</label>
									</c:forEach>
			            		</div>
							</div>
		        		</td>
					</tr>
			      	<tr> 
				        <td class="td_left"><label for="file1"> 차량예약, 차량소개 이미지</label></td>
				        <td class="td_right"><input type="file" name="files" id="car_file1" class="form-control" /></td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file2">차량상세예약 1(정면)</label></td>
				        <td class="td_right"><input type="file" name="files" id="car_file2" class="form-control" /></td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file3">차량상세예약 2(후면)</label></td>
				        <td class="td_right"><input type="file" name="files" id="car_file3" class="form-control" /></td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file4">차량상세예약 3(측면)</label></td>
				        <td class="td_right"><input type="file" name="files" id="car_file4"  class="form-control" /></td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file5">차량상세예약 4(내부1)</label></td>
				        <td class="td_right"><input type="file" name="files" id="car_file5"  class="form-control" /></td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file6">차량상세예약 5(내부2)</label></td>
				        <td class="td_right"><input type="file" name="files" id="car_file6"  class="form-control" /></td>
			      	</tr>
	      			<tr>
	        			<td class="td_left"><label for="car_status">차량상태</label></td>
	        			<td class="td_right">
	          				<select name="car_status" required="required" class="form-select">
	            				<option value="">선택하세요</option>
	            				<option value="신규">신규</option>
	            				<option value="점검">점검</option>
	            				<option value="대여">대여</option>
	            				<option value="가능">대기</option> 
							</select>
	        			</td>
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
	    var checkboxes = document.querySelectorAll('input[name="option_idx"]');
	  
	    selectAllCheckbox.addEventListener('change', function() {
	      checkboxes.forEach(function(checkbox) {
	        checkbox.checked = selectAllCheckbox.checked;
	      });
	    });
	  });
	</script>
</body>
</html>