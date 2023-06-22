<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_car_list.css">
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/adm_car_list.js"></script>
</head>
<body>
    <section id="sec_con" class="inr">
       	<div class="adm_page_title">관리자 페이지</div>
       	<div class="inq_container">
			<!-- 사이드바 -->
			<jsp:include page="../../inc/adm_sidebar.jsp" />
	        <!-- 오른쪽 컨텐츠 -->
			<div class="content_view">
				<section id="adm_car">
					<span id="adm_car_title">[관리자] 차량리스트</span>
					<div id="ctbox">
						<article id="adm_car_top">
							<label>
								<input type="checkbox" name="car_type" class="adm_car_chb" value="경형/소형">경형/소형
							</label>
							<label>
								<input type="checkbox" name="car_type" class="adm_car_chb" value="준중형">준중형
							</label>
							<label>
								<input type="checkbox" name="car_type" class="adm_car_chb" value="중형">중형
							</label>
							<label>
								<input type="checkbox" name="car_type" class="adm_car_chb" value="대형">대형
							</label>
							<label>
								<input type="checkbox" name="car_type" class="adm_car_chb" value="SUV">SUV
							</label>
							<label>
								<input type="checkbox" name="car_type" class="adm_car_chb" value="승합">승합
							</label>
							<label>
								<input type="checkbox" name="car_type" class="adm_car_chb" value="수입">수입
							</label>
						</article>
						<article id="adm_car_bottom">
							<span id="adm_search">
								<select id="search_cate">
									<option value="car_idx">차량코드</option>
									<option value="car_company">제조사</option>
									<option value="car_model">모델명</option>
									<option value="car_old">연식</option>
									<option value="brc_name">지점</option>
									<option value="option_name">옵션</option>
								</select>
								<input type="search" name="search_keyword" id="search_box"> <!-- search_cate change -> $(this).val()) -->
								<button name="item_search" class="adm_car_button">
									검색
								</button>
							</span>
						</article>
					</div>
					<article id="adm_car_center">
						<table id="adm_car_list">
							<tr id="car_title">
								<td>차량코드</td>
								<td>제조사</td>
								<td>모델명</td>
								<td>차종</td>
								<td>연식</td>
								<td>지점</td>
								<td>옵션</td>
								<td>상태</td>
								<td colspan="2">관리</td>
							</tr>
						</table>
						<button name="item_insert" class="adm_car_button">
							상품등록
						</button>
						<button name="option_list" class="adm_car_button">
							옵션관리
						</button>
					</article>
					<article id="pageList">
						<input type="button" id="prvsPage"class="adm_car_button" value="이전">
						<span id="nowPage"></span>
						<input type="button" id="nextPage" class="adm_car_button" value="다음">
                     </article>
				</section>
			</div>
		</div>
   	</section>
</body>
</html>