<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/member/notice/notice.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">

<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="notice_cont">
		<section id="sec_con" class="inr">
			<h1 class="con_title">공지사항</h1>
			<section id="board_wrap">
				<section id="board_list" class="notice">
					<form name="fboardlist" id="fboardlist" action="" method="post">
						<div class="wrapper">
							<div class="list_wrap">
								<ul class="list">
									<li class="list_head">
										<p class="list_num">번호</p>
										<div class="txt_prev">
											<h4>제목</h4>
										</div>
										<p class="writter">
											<span class="writter_name">글쓴이</span>
										</p>
										<p class="date">날짜</p>
									</li>
									
									<li class="list_cont">
										<a href="#">
											<p class="list_num">5</p>
											<div class="txt_prev">
												<h4>공지사항1</h4>
											</div>

											<p class="writter">
												<span class="writter_name"><span class="sv_member">관리자</span></span>
											</p>
											<p class="date">12-02</p>
										</a>
									</li>
									
									<li class="list_cont">
										<a href="#">
											<p class="list_num">5</p>
											<div class="txt_prev">
												<h4>공지사항2</h4>
											</div>

											<p class="writter">
												<span class="writter_name"><span class="sv_member">관리자</span></span>
											</p>
											<p class="date">12-02</p>
										</a>
									</li>
								</ul>
								
								<div class="write_btn">
									<a href="#">글쓰기</a>
								</div>

								<div class="list_pager_wrap">
									<nav class="pg_wrap">
										<span class="pg">
											<strong class="pg_current">1</strong>
											<a href="" class="pg_page">2</a>
											<a href="" class="pg_page pg_next">다음</a>
											<a href="" class="pg_page pg_end">맨끝</a>
										</span>
									</nav>
								</div>
							</div>
						</div>
					</form>
				</section>
			</section>
		</section>
	</div>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>