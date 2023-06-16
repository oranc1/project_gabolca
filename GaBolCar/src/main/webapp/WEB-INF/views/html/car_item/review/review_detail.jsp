<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/car_item/review/review_detail.css" rel="stylesheet">
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
											리뷰입니다.
										</div>
									</li>
									
									<li class="write_info">
										<div class="write_box">
											<span class="write_t">작성자명</span>
											<span class="write_c">최*진</span>
										</div>
										<div class="write_box">
											<span class="write_t">등록일</span>
											<span class="write_c">2023-06-02</span>
										</div>
										<div class="write_box">
											<span class="write_t">첨부파일</span>
											<span class="write_c">10</span>
										</div>
									</li>

									<li class="write_scope">
								
										<div class="write_scope_box">
											<div class="car_name">
												캐스퍼
											</div>
											<span class="write_s">
												<!-- 별점 구현 초보, 새로운 거 알면 바꾸기-->
											<c:set var="starLank" value="2"/>
											 <c:choose>
    											<c:when test="${starLank eq 0 }">
  													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 1 }">
  													<span class="fill">★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 2 }">
  													<span class="fill">★</span>
													<span class="fill">★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 3 }">
  													<span class="fill">★</span>
													<span class="fill">★</span>
													<span class="fill">★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 4 }">
  													<span class="fill">★</span>
													<span class="fill">★</span>
													<span class="fill">★</span>
													<span class="fill">★</span>
													<span>★</span>
    											</c:when>
   												 <c:otherwise>
    												<span class="fill">★</span>
													<span class="fill">★</span>
													<span class="fill">★</span>
	   												<span class="fill">★</span>
													<span class="fill">★</span>
												 </c:otherwise>
											</c:choose>
											<!-- 별점 구현 초보 -->
											</span>
										</div>
									</li>
								</ul>

								<div class="write_cont">
									<!-- 이미지 파일 출력 -->
									<img src="../img/casper.jpg" alt="">
									<!-- 작성글 출력 -->
									<p>
										내용입니다 내용입니다 내용입니다 내용입니다 내용입니다 내용입니다 내용입니다<br>
										내용입니다 내용입니다 내용입니다 내용입니다 내용입니다 내용입니다 내용입니다
									</p>
								</div>
								
								<div class="mod_box">
									<a class="modify_btn">수정</a>
									<a class="modify_delete">삭제</a>
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