<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h1 class="con_title">리뷰 게시판</h1>
			<form action="" method="get">
				<section id="board_wrap">
					<section id="board_list" class="notice">
						<div class="wrapper">
							<div class="list_wrap">
								<ul class="list">
									<li>
										<div class="subject">
											<input type="text" placeholder="제목을 입력해주세요" class="inputBox">
										</div>
									</li>

									<li class="write_scope">
										<div id="myform">
											<!-- DB에서 예약차 이름 가져오기 -->
											<div class="car_name">
											캐스퍼
											</div>
											<fieldset>
													<input type="radio" name="rating" value="5" id="rate1">
													<label for="rate1">⭐</label>
													<input type="radio" name="rating" value="4" id="rate2">
													<label for="rate2">⭐</label>
													<input type="radio" name="rating" value="3" id="rate3">
													<label for="rate3">⭐</label>
													<input type="radio" name="rating" value="2" id="rate4">
													<label for="rate4">⭐</label>
													<input type="radio" name="rating" value="1" id="rate5">
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
										<textarea rows="" cols="" class="inputBox" placeholder="내용을 입력해주세요"></textarea>
									</p>
								</div>

								<div class="write_file">
									<input type="file">
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