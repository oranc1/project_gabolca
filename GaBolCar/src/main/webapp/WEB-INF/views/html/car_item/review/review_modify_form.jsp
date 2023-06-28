<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/car_item/review/review_write_form.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath}/resources/css/inc/footer.css" rel="styleSheet">
	<script src="${pageContext.request.contextPath}/resources/js/inc/jquery-3.7.0.js"></script>
<title>리뷰 게시글 수정</title>

<c:if test="${reviewDetail.mem_id != sId}">
	<script type="text/javascript">
		alert("권한이 없습니다.");
		location.href="/project_gabolcar/";
	</script>
</c:if>


</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="notice_cont">
		<section id="sec_con" class="inr">
			<h1 class="con_title">리뷰 수정</h1>
				<section id="board_wrap">
					<section id="board_list" class="notice">
						<div class="wrapper">
							<div class="list_wrap">
								<form action="/project_gabolcar/reviewModifyPro?pageNum=${param.pageNum}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}" method="post">
									<input type="hidden" name="rev_idx" value="${reviewDetail.rev_idx}">
									<ul class="list">
										<li>
											<div class="subject">
												<input type="text" class="inputBox" name="rev_subject" value="${reviewDetail.rev_subject}">
											</div>
										</li>

										<li class="write_scope">
											<div id="myform">
												<!-- DB에서 예약차 이름 가져오기 -->
												<div class="car_name">
												${reviewDetail.car_model}
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
										<!-- 작성글 출력! -->
										<p>
											<textarea class="inputBox" name="rev_content">${reviewDetail.rev_content}</textarea>
										</p>
									</div>
	
									<div class="write_file">
										<c:choose>
											<c:when test="${empty reviewDetail.rev_file1}">
												<!-- <input type="file" name="file1" /><br> -->
											</c:when>
											<c:otherwise>
												${fn:split(reviewDetail.rev_file1, '_')[1]}
												<!-- <input type="button" value="삭제"> --><br>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${empty reviewDetail.rev_file2}">
												<!-- <input type="file" name="file2" /><br> -->
											</c:when>
											<c:otherwise>
												${fn:split(reviewDetail.rev_file2, '_')[1]}
												<!-- <input type="button" value="삭제"> --><br>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${empty reviewDetail.rev_file3}">
												<!-- <input type="file" name="file3" /><br> -->
											</c:when>
											<c:otherwise>
												${fn:split(reviewDetail.rev_file3, '_')[1]}
												<!-- <input type="button" value="삭제"> --><br>
											</c:otherwise>
										</c:choose>
									</div>
	
									<div class="mod_box">
										<input type="submit" class="delete_btn" value="등록">
										<a class="list_btn" href="/project_gabolcar/reviewList?pageNum=${param.pageNum}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">목록</a>
									</div>
								</form>
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