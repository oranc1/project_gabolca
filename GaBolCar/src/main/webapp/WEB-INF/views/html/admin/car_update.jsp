<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

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
<script type="text/javascript">
	function deleteFile(car_file_value, car_file_index) {
		let car_idx = ${car.car_idx};
	
		$.ajax({
			type: "POST",
			url: "carDeleteFile",
			data: {
				"car_idx": car_idx,
				"car_file": car_file_value,
				"car_file_path": "${car.car_file_path}",
				"car_file_index": car_file_index // 이 코드 추가
	// 			"car_file_path": "${car.car_file_path}"
			},
			success: function(result) {
				if (result == "true") {
					alert("파일 삭제 성공");
	
					// car_file_value에 따라 분기하는 코드를 switch 구문을 사용
					let index;
					switch(car_file_value) {
					    case "${car.car_file1}":
					        index = "1";
					        break;
					    case "${car.car_file2}":
					        index = "2";
					        break;
					    case "${car.car_file3}":
					        index = "3";
					        break;
					    case "${car.car_file4}":
					        index = "4";
					        break;
					    case "${car.car_file5}":
					        index = "5";
					        break;
					    case "${car.car_file6}":
					        index = "6";
					        break;
					    default:
					        break;
					}
	
					// 인덱스 번호로 fileBtnArea 엘리먼트를 선택
					$("#fileBtnArea" + index).html("<input type='file' name='files'/>");
				} else {
					alert("일시적인 오류로 파일 삭제에 실패했습니다!");
				}
			}
		});
	}
	
	
	$(function() {
		// 수정 중복검사
		let carNum = $("input[name=car_number]").val();
		$("input[name=car_number]").on("blur",function() {
			if (carNum != $(this).val() && $(this).val() != '') {
				$.ajax({
					type: "get",
					url: "carCheckRdndn",
					data: {
						'car_number': $(this).val()
					}
				}).done(function(result) {
					if (result == '1') {
						$("input[name=car_number]").attr("placeholder",$("input[name=car_number]").val()+"은 등록되어있는 차량번호입니다.");
						$("input[name=car_number]").val('').focus();
					} else {
						isChecked = true;
					}
				});
			};
		});
	})
</script>
</head>
<body>
	<section id="reg_section">
    	<div id="title_container">
      		<h1>차량 수정</h1>
    	</div>
		<form action="carUpdatePro" name="writeForm" method="post" enctype="multipart/form-data">
	  		<input type="hidden" name="car_idx" value="${car.car_idx }" />
	  		<input type="hidden" name="other_window" value="${param.other_window }" />
	  		<div id="modifyForm">
	    		<table>
	    			<c:if test='${param.other_window eq "y"}'>
	    			<tr>
	    				<td class="td_left"><label>차량상태</label></td>
	    				<td class="td_right">
							<input type="radio" class="btn-check" name="car_status" id="option4" value="가능" 
							<c:if test="${car.car_status eq '가능' }">checked</c:if>>
							<label class="btn btn-outline-primary" for="option4">대기</label>
							
							<input type="radio" class="btn-check" name="car_status" id="option2" value="점검" 
							<c:if test="${car.car_status eq '점검' }">checked</c:if>>
							<label class="btn btn-outline-danger" for="option2">점검</label>
							
							<input type="radio" class="btn-check" name="car_status" id="option3" value="대여" 
							<c:if test="${car.car_status eq '대여' }">checked</c:if>>
							<label class="btn btn-outline-warning" for="option3">대여</label>
							
	    					<input type="radio" class="btn-check" name="car_status" id="option1" value="신규" 
	    					<c:if test="${car.car_status eq '신규' }">checked</c:if>>
							<label class="btn btn-outline-info" for="option1">신규</label>
	    				</td>
	    			</tr>
	    			</c:if>
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
					                <c:forEach var="option" items="${optionList}">
					                    <c:set var="isChecked" value="false"/>
					                    <c:forEach var="carOptionIdx" items="${selectedOptionList}">
					                        <c:if test="${carOptionIdx == option.option_idx}">
					                            <c:set var="isChecked" value="true"/>
					                        </c:if>
					                    </c:forEach>
					                    <label class="checkbox-label">
					                        <input type="checkbox" name="option_idx" value="${option.option_idx}" <c:if test="${isChecked}">checked="checked"</c:if>>
					                        ${option.option_name}
					                    </label>
					                </c:forEach>
					            </div>
					        </div>
					    </td>
					</tr>
		      		<tr> 
				        <td class="td_left"><label for="file1"> 차량예약, 차량소개 이미지</label></td> 
				        <td class="td_right"  id="fileBtnArea1">
							<c:choose>
								<c:when test="${empty car.car_file1 }">
										<input type="file" name="files" id="car_file1" class="form-control" value="${car.car_file1 }" />
								</c:when>
								<c:otherwise>
									<c:set var="length" value="${fn:length(car.car_file1) }" />
									<c:set var="index" value="${fn:indexOf(car.car_file1, '_') }" />
									<c:set var="fileName" value="${fn:substring(car.car_file1, index + 1, length) }" />
									<a href="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file1}">${car.car_file1 }</a>
									<img src="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file1}" alt="Car Image" class="car-image">
									<%-- 삭제버튼 클릭 시 deleteFile() 함수 호출(파라미터로 글번호, 파일명 전달) --%>
								<input type="button" value="삭제" onclick="deleteFile('${car.car_file1}', 0)">
								</c:otherwise>
							</c:choose>
				        </td>
			      	</tr>
		      		<tr> 
				        <td class="td_left"><label for="file2"> 차량상세예약 1(정면)</label></td> 
				        <td class="td_right"  id="fileBtnArea2">
							<c:choose>
								<c:when test="${empty car.car_file2 }">
										<input type="file" name="files" id="car_file2" class="form-control" value="${car.car_file2 }" />
								</c:when>
								<c:otherwise>
									<c:set var="length" value="${fn:length(car.car_file2) }" />
									<c:set var="index" value="${fn:indexOf(car.car_file2, '_') }" />
									<c:set var="fileName" value="${fn:substring(car.car_file2, index + 1, length) }" />
									<a href="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file2}">${car.car_file2 }</a>
									<img src="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file2}" alt="Car Image" class="car-image">
									<%-- 삭제버튼 클릭 시 deleteFile() 함수 호출(파라미터로 글번호, 파일명 전달) --%>
								<input type="button" value="삭제" onclick="deleteFile('${car.car_file2}', 1)">
								</c:otherwise>
							</c:choose>
				        </td>
			      	</tr>
		      		<tr> 
				        <td class="td_left"><label for="file3"> 차량상세예약 2(후면)</label></td> 
				        <td class="td_right"  id="fileBtnArea3">
							<c:choose>
								<c:when test="${empty car.car_file3 }">
										<input type="file" name="files" id="car_file3" class="form-control" value="${car.car_file3 }" />
								</c:when>
								<c:otherwise>
									<c:set var="length" value="${fn:length(car.car_file3) }" />
									<c:set var="index" value="${fn:indexOf(car.car_file3, '_') }" />
									<c:set var="fileName" value="${fn:substring(car.car_file3, index + 1, length) }" />
									<a href="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file3}">${car.car_file3 }</a>
									<img src="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file3}" alt="Car Image" class="car-image">
									<%-- 삭제버튼 클릭 시 deleteFile() 함수 호출(파라미터로 글번호, 파일명 전달) --%>
								<input type="button" value="삭제" onclick="deleteFile('${car.car_file3}', 2)">
								</c:otherwise>
							</c:choose>
				        </td>
			      	</tr>
		      		<tr> 
				        <td class="td_left"><label for="file4"> 차량상세예약 3(측면)</label></td> 
				        <td class="td_right"  id="fileBtnArea4">
							<c:choose>
								<c:when test="${empty car.car_file4 }">
										<input type="file" name="files" id="car_file4" class="form-control" value="${car.car_file4 }" />
								</c:when>
								<c:otherwise>
									<c:set var="length" value="${fn:length(car.car_file4) }" />
									<c:set var="index" value="${fn:indexOf(car.car_file4, '_') }" />
									<c:set var="fileName" value="${fn:substring(car.car_file4, index + 1, length) }" />
									<a href="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file4}">${car.car_file4 }</a>
									<img src="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file4}" alt="Car Image" class="car-image">
									<%-- 삭제버튼 클릭 시 deleteFile() 함수 호출(파라미터로 글번호, 파일명 전달) --%>
								<input type="button" value="삭제" onclick="deleteFile('${car.car_file4}', 3)">
								</c:otherwise>
							</c:choose>
				        </td>
			      	</tr>
		      		<tr> 
				        <td class="td_left"><label for="file5">차량상세예약 4(내부1)</label></td> 
				        <td class="td_right"  id="fileBtnArea5">
							<c:choose>
								<c:when test="${empty car.car_file5 }">
										<input type="file" name="files" id="car_file5" class="form-control" value="${car.car_file5 }" />
								</c:when>
								<c:otherwise>
									<c:set var="length" value="${fn:length(car.car_file5) }" />
									<c:set var="index" value="${fn:indexOf(car.car_file5, '_') }" />
									<c:set var="fileName" value="${fn:substring(car.car_file5, index + 1, length) }" />
									<a href="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file5}">${car.car_file5 }</a>
									<img src="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file5}" alt="Car Image" class="car-image">
									<%-- 삭제버튼 클릭 시 deleteFile() 함수 호출(파라미터로 글번호, 파일명 전달) --%>
								<input type="button" value="삭제" onclick="deleteFile('${car.car_file5}', 4)">
								</c:otherwise>
							</c:choose>
				        </td>
			      	</tr>
		      		<tr> 
				        <td class="td_left"><label for="file6"> 차량상세예약 5(내부2)</label></td> 
				        <td class="td_right"  id="fileBtnArea6">
							<c:choose>
								<c:when test="${empty car.car_file6 }">
										<input type="file" name="files" id="car_file6" class="form-control" value="${car.car_file6 }" />
								</c:when>
								<c:otherwise>
									<c:set var="length" value="${fn:length(car.car_file6) }" />
									<c:set var="index" value="${fn:indexOf(car.car_file6, '_') }" />
									<c:set var="fileName" value="${fn:substring(car.car_file6, index + 1, length) }" />
									<a href="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file6}">${car.car_file6 }</a>
									<img src="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file6}" alt="Car Image" class="car-image">
									<%-- 삭제버튼 클릭 시 deleteFile() 함수 호출(파라미터로 글번호, 파일명 전달) --%>
								<input type="button" value="삭제" onclick="deleteFile('${car.car_file6}', 5)">
								</c:otherwise>
							</c:choose>
				        </td>
			      	</tr>
					<c:if test='${empty param.other_window }'>
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
					</c:if>
				</table> 
		    <div id="commandCell">
		      	<input type="submit" value="수정" class="btn btn-warning">&nbsp;&nbsp;
		      	<input type="reset" value="다시쓰기" class="btn btn-secondary">&nbsp;&nbsp;
		      	<c:choose>
		      		<c:when test="${! empty param.other_window  }">
				      	<input type="button" value="취소" onclick="window.close()" class="btn btn-secondary">
		      		</c:when>
		      		<c:otherwise>
				      	<input type="button" value="취소" onclick="history.back()" class="btn btn-secondary">
		      		</c:otherwise>
		      	</c:choose>
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