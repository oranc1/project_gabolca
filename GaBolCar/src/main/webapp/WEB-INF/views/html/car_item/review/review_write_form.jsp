<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/car_item/review/review_write_form.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath}/resources/css/inc/footer.css" rel="styleSheet">
	<script src="${pageContext.request.contextPath}/resources/js/inc/jquery-3.7.0.js"></script>
<title>리뷰 게시글 작성</title>

</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="notice_cont">
		<section id="sec_con" class="inr">
			<h1 class="con_title">리뷰 작성</h1>
			<form action="${pageContext.request.contextPath}/reviewWritePro" method="post" enctype="multipart/form-data">
				<input type="hidden" name="session_id" value="${sessionScope.sId}"/>
				<input type="hidden" name="res_idx" value=" ${map.res_idx}"/><!-- ${map.res_idx} , 1     임의의 값. res_idx 값 1주고 연습  -->
				<section id="board_wrap">
					<section id="board_list" class="notice">
						<div class="wrapper">
							<div class="list_wrap">
								<ul class="list">
									<li>
										<div class="subject">
											<input type="text" name="rev_subject" placeholder="제목을 50자 이내로 입력해주세요" class="inputBox" required="required" style="word-break:break-all;">
										</div>
									</li>

									<li class="write_scope">
										<div id="myform">
											<!-- DB에서 예약차 이름 가져오기 -->
											<div class="car_name" name="car_model">
											${map.car_company}&nbsp;&nbsp;${map.car_model}&nbsp;&nbsp;${map.car_old}년식
											</div>
											<fieldset>
													<input type="radio" name="rev_star" value="5" id="rate1" selected="selected">
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
									<!-- 작성글 출력! -->
									<p>
										<textarea rows="" cols="" class="inputBox" name="rev_content" placeholder="내용을 4000자 이내로 입력해주세요. 남을 비방하는 말, 비속어, 음란성 글, 광고성이 포함된 글은 관리자 임의로 삭제될 수 있습니다." required="required" style="word-break:break-all;"></textarea>
									</p>
								</div>

								<div class="write_file">
									<!-- <input type="file" name="rev_real_image"> -->
									<input type="file" name="file1" /><br>
									<input type="file" name="file2" /><br>
									<input type="file" name="file3" /><br>
								</div>

								<div class="mod_box">
									<input type="button" class="index_btn" value="목록" onclick="window.location.href='${pageContext.request.contextPath}/reviewList?pageNum=${param.pageNum}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}'" />
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