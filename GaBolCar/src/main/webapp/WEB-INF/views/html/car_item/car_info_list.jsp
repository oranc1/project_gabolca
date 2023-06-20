<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!-- 원본 파일 이름 6p -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/car_item/car_info_list.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">	

 	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
 	
</head>
<body>
	<header>
		<jsp:include page="../../inc/top1.jsp"></jsp:include>
	</header>
	<section id="sec_con" class="inr">
		<h1 class="con_title">차량 소개</h1>
		<!-- 	기본메인페이지 화면은 전체차량으로  -->
		<div class="isbox">
			<dl class="search-type">
				<dt>차종 선택</dt>
				<dd>
					<div class="left-div">
					<label for="selectCarType_0">
				    <input name="selectCarType" id="selectCarType_0" type="checkbox" value="경형/소형">
				    	경형/소형
					</label> 
					<label for="selectCarType_1">
					    <input name="selectCarType" id="selectCarType_1" type="checkbox" value="준중형">
					    준중형
					</label> 
					<label for="selectCarType_2">
					    <input name="selectCarType" id="selectCarType_2" type="checkbox" value="중형">
					    중형
					</label> 
					<label for="selectCarType_3">
					    <input name="selectCarType" id="selectCarType_3" type="checkbox" value="대형">
					    대형
					</label>
					<label for="selectCarType_4"> 
					    <input name="selectCarType" id="selectCarType_4" type="checkbox" value="SUV">
					    SUV
					</label>
					<label for="selectCarType_5"> 
					    <input name="selectCarType" id="selectCarType_5" type="checkbox" value="전기">
					    전기
					</label>
					<label for="selectCarType_6"> 
					    <input name="selectCarType" id="selectCarType_6" type="checkbox" value="수입">
					    수입
					</label> 
					</div>
				</dd>
			</dl>

			<dl class="search-type">
				<dt>연료 선택</dt>
				<dd>
					<div class="left-div">
						<label for="selectFuel_0"><input name="selectFuel"
							id="selectFuel_0" type="checkbox" value="가솔린">가솔린</label> <label
							for="selectFuel_1"><input name="selectFuel"
							id="selectFuel_1" type="checkbox" value="디젤">디젤</label> <label
							for="selectFuel_2"><input name="selectFuel"
							id="selectFuel_2" type="checkbox" value="LPG">LPG</label> <label
							for="selectFuel_3"><input name="selectFuel"
							id="selectFuel_3" type="checkbox" value="하이브리드">하이브리드</label> <label
							for="selectFuel_4"><input name="selectFuel"
							id="selectFuel_4" type="checkbox" value="전기">전기</label> <label
							for="selectFuel_5"><input name="selectFuel"
							id="selectFuel_5" type="checkbox" value="가솔린+LPG">가솔린+LPG</label>

					</div>
				</dd>
			</dl>
			
		</div>
		
		<!-- 차량 소개에서 차량 목록을 사용자가 차종에 따라 필터링하는 기능 구현 -->
		<script type="text/javascript">
		$(document).ready(function() {
			  const selectCarTypeCheckboxes = $("input[name='selectCarType']");
			  let selectedCarTypes = [];

			  const selectFuelCheckboxes = $("input[name='selectFuel']");
			  let selectedFuelTypes = [];

			  selectFuelCheckboxes.on("change", function() {
			    if ($(this).is(":checked")) {
			      selectedFuelTypes.push($(this).val());
			    } else {
			      selectedFuelTypes = selectedFuelTypes.filter(type => type !== $(this).val());
			    }

			    filterCarList();
			  });

			  selectCarTypeCheckboxes.on("change", function() {
			    if ($(this).is(":checked")) {
			      selectedCarTypes.push($(this).val());
			    } else {
			      selectedCarTypes = selectedCarTypes.filter(type => type !== $(this).val());
			    }

			    filterCarList();
			  });

			  function filterCarList() {
			    const carItems = $(".car-item");

			    carItems.each(function() {
			      let shouldDisplayByCarType = false;
			      let shouldDisplayByFuelType = false;

			      if (selectedCarTypes.length === 0) {
			        shouldDisplayByCarType = true;
			      } else {
			        selectedCarTypes.forEach((carType) => {
			          if ($(this).hasClass(carType.toLowerCase().replace(' ', '_'))) {
			            shouldDisplayByCarType = true;
			          }
			        });
			      }

			      if (selectedFuelTypes.length === 0) {
			        shouldDisplayByFuelType = true;
			      } else {
			        selectedFuelTypes.forEach((fuelType) => {
			          if ($(this).hasClass(fuelType)) {
			            shouldDisplayByFuelType = true;
			          }
			        });
			      }

			      if (shouldDisplayByCarType && shouldDisplayByFuelType) {
			        $(this).css("display", "block");
			      } else {
			        $(this).css("display", "none");
			      }
			    });
			  }

			  $(".left-div > label").on("click", function() {
			    const checkbox = $(this).find("input:checkbox");
			    if (checkbox.is(":checked")) {
			      $(this).css({"background": "#fff", "color": "#000"});
			      checkbox.prop("checked", false);
			    } else {
			      $(this).css({"background": "#ff6600", "color": "#fff"});
			      checkbox.prop("checked", true);
			    }
			  });

			  $(".right-div > label").on("click", function() {
			    const checkbox = $(this).find("input:checkbox");
			    if (checkbox.is(":checked")) {
			      $(this).css({"background": "#fff", "color": "#000"});
			      checkbox.prop("checked", false);
			    } else {
			      $(this).css({"background": "#ff6600", "color": "#fff"});
			      checkbox.prop("checked", true);
			    }
			  });
			});

			

		</script>

		<jsp:include page="inc/car_info_item.jsp"></jsp:include>

	</section>
	<footer>
		<jsp:include page="../../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
