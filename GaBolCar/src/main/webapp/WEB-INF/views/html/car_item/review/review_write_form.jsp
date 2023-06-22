<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/car_item/review/review_write_form.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="notice_cont">
		<section id="sec_con" class="inr">
			<h1 class="con_title">리뷰 작성</h1>
			<form action="/project_gabolcar/reviewWritePro" method="post" enctype="multipart/form-data">
				<input type="hidden" name="rev_name" value="${sessionScope.sId }"/>
				<input type="hidden" name="res_idx" value="${sessionScope.res_idx }"/>
				<section id="board_wrap">
					<section id="board_list" class="notice">
						<div class="wrapper">
							<div class="list_wrap">
								<ul class="list">
									<li>
										<div class="subject">
											<input type="text" name="rev_subject" placeholder="제목을 입력해주세요" class="inputBox">
										</div>
									</li>

									<li class="write_scope">
										<div id="myform">
											<!-- DB에서 예약차 이름 가져오기 -->
											<div class="car_name" name="car_model">
											
											</div>
											<fieldset>
													<input type="radio" name="rev_star" value="5" id="rate1">
													<label for="rate1">⭐</label>
													<input type="radio" name="rev_star" value="4" id="rate2">
													<label for="rate2">⭐</label>
													<input type="radio" name="rev_star" value="3" id="rate3">
													<label for="rate3">⭐</label>
													<input type="radio" name="rev_star" value="2" id="rate4">
													<label for="rate4">⭐</label>
													<input type="radio" name="rev_star" value="1" id="rate5">
													<label for="rate5">⭐</label>
											</fieldset>
										</div>
									</li>
								</ul>

								<div class="write_cont">
									<!-- 이미지 파일 출력 -->
<!-- 									<img src="../img/casper.jpg" alt=""> -->
									<!-- 작성글 출력 -->
									<p>
										<textarea rows="" cols="" class="inputBox" name="rev_content" placeholder="내용을 입력해주세요"></textarea>
									</p>
								</div>

								<div class="write_file">
									<input type="file" name="rev_real_image">
								</div>

								<div class="mod_box">
										<input type="submit" class="delete_btn" value="등록">
								</div>
								
							</div>
						</div>
					</section>
				</section>
			</form>
		</section>
	</div>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>