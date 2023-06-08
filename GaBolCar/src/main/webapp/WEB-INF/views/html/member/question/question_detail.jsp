<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/member/question/question_detail.css" rel="stylesheet">

	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="notice_cont">
		<section id="sec_con" class="inr">
			<h1 class="con_title">1:1 문의 게시판</h1>
			<form action="" method="get">
				<section id="board_wrap">
					<section id="board_list" class="notice">
						<div class="wrapper">
							<div class="list_wrap">
								<ul class="list">
									<li>
										<div class="subject">
											예약 문의 합니다 ! <!-- 1:1 문의 게시판 작성 제목 DB 불러오기 -->
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
											<span class="write_t">구분</span>
											<span class="write_c">예약</span>
										</div>
									</li>

								</ul>

								<div class="write_cont">
									<!-- 이미지 파일 출력 -->
									<img src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/casper.jpg" alt="">
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