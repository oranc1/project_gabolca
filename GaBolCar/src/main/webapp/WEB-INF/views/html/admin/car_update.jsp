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
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- 0619 수정중 -->
	<section id="reg_section">
    	<div id="title_container">
      		<h1>차량 수정</h1>
    	</div>
		<form action="carUpdatePro" name="writeForm" method="post" enctype="multipart/form-data">
	  		<input type="hidden" name="car_idx" value="${car.car_idx }" />
	  		<div id="modifyForm">
	    		<table>
	      			<tr>
	        			<td class="td_left"><label for="car_type">차종</label></td>
	        			<td class="td_right">
	          				<select name="car_type" class="form-select">
	            				<option value="경형/소형" <c:if test="${car.car_type eq '경형/소형' }">selected</c:if>>경형/소형</option>
	            				<option value="준중형" <c:if test="${car.car_type eq '준중형' }">selected</c:if>>준중형</option>
	            				<option value="중형" <c:if test="${car.car_type eq '중형' }">selected</c:if>>중형</option>
	            				<option value="대형" <c:if test="${car.car_type eq '대형' }">selected</c:if>>대형</option>
	            				<option value="SUV" <c:if test="${car.car_type eq 'SUV' }">selected</c:if>>SUV</option>
					            <option value="승합" <c:if test="${car.car_type eq '승합' }">selected</c:if>>승합</option>
					            <option value="수입" <c:if test="${car.car_type eq '수입' }">selected</c:if>>수입</option>
							</select>
	        			</td>
	      			</tr>
					<tr>
			            <td class="td_left"><label for="car_number">차량번호</label></td>
			            <td class="td_right"><input type="text" name="car_number" value="${car.car_number }" class="form-control" /></td>
					</tr>
          			<tr>
			            <td class="td_left"><label for="car_company">제조사</label></td>
			            <td class="td_right"><input type="text" name="car_company" value="${car.car_company }" class="form-control" /></td>
          			</tr>
          			<tr>
            			<td class="td_left"><label for="car_model">모델명</label></td>
            			<td class="td_right"><input type="text" name="car_model" value="${car.car_model }" class="form-control" /></td>
          			</tr>
          			<tr>
            			<td class="td_left"><label for="car_old">연식</label></td>
            			<td class="td_right"><input type="text" name="car_old" value="${car.car_old }" class="form-control" /></td>
          			</tr>
          			<tr>
			            <td class="td_left"><label for="car_shift_type">변속타입</label></td>
			            <td class="td_right">
              				<select name="car_shift_type" class="form-select">
								<option value="수동" <c:if test="${car.car_shift_type eq '수동' }">selected</c:if>>수동</option>
								<option value="자동" <c:if test="${car.car_shift_type eq '자동' }">selected</c:if>>자동</option>
              				</select>
            			</td>
          			</tr>
          			<tr>
			            <td class="td_left"><label for="car_fuel_type">연료</label></td>
			            <td class="td_right">
							<select name="car_fuel_type" class="form-select">
				                <option value="가솔린" <c:if test="${car.car_fuel_type eq '가솔린' }">selected</c:if>>가솔린</option>
								<option value="디젤" <c:if test="${car.car_fuel_type eq '디젤' }">selected</c:if>>디젤</option>
								<option value="LPG" <c:if test="${car.car_fuel_type eq 'LPG' }">selected</c:if>>LPG</option>
								<option value="하이브리드" <c:if test="${car.car_fuel_type eq '하이브리드' }">selected</c:if>>하이브리드</option>
								<option value="전기" <c:if test="${car.car_fuel_type eq '전기' }">selected</c:if>>전기</option>
								<option value="가솔린+LPG" <c:if test="${car.car_fuel_type eq '가솔린+LPG' }">selected</c:if>>가솔린+LPG</option>
			              	</select>
						</td>
	          		</tr>
	          		<tr>
			            <td class="td_left"><label for="car_riding">정원</label></td>
			            <td class="td_right"><input type="text" name="car_riding" value="${car.car_riding }" class="form-control" /></td>
	          		</tr>		
	          		<tr>
	            		<td class="td_left"><label for="car_age">나이제한</label></td>
	            		<td class="td_right"><input type="text" name="car_age" value="${car.car_age }" class="form-control" /></td>
	          		</tr>		
	          		<tr>
	            		<td class="td_left"><label for="car_career">운전경력제한</label></td>
	            		<td class="td_right"><input type="text" name="car_career" value="${car.car_career }" class="form-control" /></td>
	          		</tr>		
	          		<tr>
			            <td class="td_left"><label for="car_license">면허종류</label></td>
			            <td class="td_right">
	              			<select name="car_license" class="form-select">
	                			<option value="1종" <c:if test="${car.car_license eq '1종' }">selected</c:if>>1종</option>
								<option value="2종" <c:if test="${car.car_license eq '2종' }">selected</c:if>>2종</option>
	              			</select>
	            		</td>
	          		</tr>
	          		<tr>
	           			 <td class="td_left"><label for="car_weekdays">주중 대여료</label></td>
	           			 <td class="td_right"><input type="text" name="car_weekdays" value="${car.car_weekdays }" class="form-control" /></td>
	         		 </tr>
	         		 <tr>
			            <td class="td_left"><label for="car_weekend">주말 대여료</label></td>
			            <td class="td_right"><input type="text" name="car_weekend" value="${car.car_weekend }" class="form-control" /></td>
	         		 </tr>
	        		  <tr>
						<td class="td_left"><label for="brc_name">지점명</label></td>
						<td class="td_right">
	              			<select name="brc_name" class="form-select">
	               				<c:forEach var="brc" items="${brcList }">
	                				<option value="${brc.brc_name }" <c:if test="${car.brc_name eq brc.brc_name }">selected</c:if>>${brc.brc_name }</option>
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
											<input type="checkbox" name="option_idx" value="${option.option_idx }" <c:forEach var="idx" items="${car.option_idx }" ><c:if test="${idx eq option.option_idx }">checked="checked"</c:if></c:forEach>>
			  								${option.option_name }
										</label>
									</c:forEach>
			            		</div>
							</div>
		        		</td>
					</tr>
		      		<tr> 
				        <td class="td_left"><label for="file1"> 차량예약, 차량소개 이미지</label></td>
				        <td class="td_right">
					        <input type="file" name="files" id="car_file1" class="form-control" />
					        <input type="hidden" name="oldFilename1" value="${car.car_file1 }" />
				        </td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file2">차량상세예약 1(정면)</label></td>
				        <td class="td_right">
					        <input type="file" name="files" id="car_file2" class="form-control" />
					        <input type="hidden" name="oldFilename2" value="${car.car_file2 }" />
				        </td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file3">차량상세예약 2(후면)</label></td>
				        <td class="td_right">
					        <input type="file" name="files" id="car_file3" class="form-control" />
					        <input type="hidden" name="oldFilename3" value="${car.car_file3 }" />
				        </td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file4">차량상세예약 3(측면)</label></td>
				        <td class="td_right">
					        <input type="file" name="files" id="car_file4" class="form-control" />
					        <input type="hidden" name="oldFilename4" value="${car.car_file4 }" />
				        </td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file5">차량상세예약 4(내부1)</label></td>
				        <td class="td_right">
					        <input type="file" name="files" id="car_file5" class="form-control" />
					        <input type="hidden" name="oldFilename5" value="${car.car_file5 }" />
				        </td>
			      	</tr>
			      	<tr> 
				        <td class="td_left"><label for="file6">차량상세예약 5(내부2)</label></td>
				        <td class="td_right">
					        <input type="file" name="files" id="car_file6" class="form-control" />
					        <input type="hidden" name="oldFilename6" value="${car.car_file6 }" />
				        </td>
			      	</tr>
	      			<tr>
	        			<td class="td_left"><label for="car_status">차량상태</label></td>
	        			<td class="td_right">
	          				<select name="car_status" class="form-select">
	            				<option value="신규" <c:if test="${car.car_status eq '신규' }">selected</c:if>>신규</option>
	            				<option value="점검" <c:if test="${car.car_status eq '점검' }">selected</c:if>>점검</option>
	            				<option value="대여" <c:if test="${car.car_status eq '대여' }">selected</c:if>>대여</option>
	            				<option value="가능" <c:if test="${car.car_status eq '가능' }">selected</c:if>>대기</option> 
							</select>
	        			</td>
	      			</tr>
				</table>
		    <div id="commandCell">
		      	<input type="submit" value="수정" class="btn btn-warning">&nbsp;&nbsp;
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
