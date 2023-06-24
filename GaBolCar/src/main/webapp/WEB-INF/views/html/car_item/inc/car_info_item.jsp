<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${carInfoList != null}">
  <c:forEach var="car" items="${carInfoList }">
    <div class="car-item ${fn:toLowerCase(car.car_type.replace(' ', '_'))} ${car.car_fuel_type}">
      <div class="int_wrap">
        <div class="left-image">
          <img src="${pageContext.request.contextPath}/resources/upload/car/${car.car_file_path}/${car.car_file1}" alt="${car.car_model}" />
        </div>
        <div class="right-content">
          <div class="name-flex">
            <div class="name1">
              <p>${car.car_model}(${car.car_company}) </p>
            </div>
            <div class="name2">
              <p>${car.car_type} / ${car.car_riding}인승 / ${car.car_fuel_type}</p>
            </div>
          </div>
          <div class="table-wrapper">
            <div class="table">
              <h3>요금정보</h3>
              <table class="custom-table" border="1">
                <tr>
                  <th>구분</th>
                  <th>주중 대여료</th>
                  <th>주말 대여료</th>
                </tr>
                <tr>
                  <td>24시간</td>
                  <td><span>${car.car_weekdays}</span>원</td>
                  <td><span>${car.car_weekend}</span>원</td>
                </tr>
			    <tr>
			        <td>6시간</td>
			        <td><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${car.car_weekdays * 0.5}" />원</td>
			        <td><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${car.car_weekend * 0.5}" />원</td>
			    </tr>
			    <tr>
			        <td>1시간</td>
			        <td><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${car.car_weekdays * 0.5 * 0.5}" />원</td>
			        <td><fmt:formatNumber type="number" minFractionDigits="0" maxFractionDigits="0" value="${car.car_weekend * 0.5 * 0.5}" />원</td>
			    </tr>
              </table>
            </div>
<div class="option-div">
  <h3>옵션</h3>
  <div class="custom-div">    
  	<c:if test="${car.options != null}">
      <c:forEach var="option" items="${car.options}">
        <span>${option.option_name}</span>
      </c:forEach>
    </c:if>
  </div>
</div>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
</c:if>