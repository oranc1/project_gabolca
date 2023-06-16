<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/car_item/review/review_board.css" rel="stylesheet">
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
			<h1 class="con_title">리뷰 게시판</h1>
			<section id="board_wrap">
				<section id="board_list" class="notice">
					<form name="fboardlist" id="fboardlist" action="" method="post">
						<div class="wrapper">
							<div class="list_wrap">
								<ul class="list">
									<li class="list_head">
										<p class="list_num">번호</p>
										<p class="list_scope">별점</p>
										<p class="list_car">차종</p>
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
											<p class="list_num">2</p>
											<p class="list_scope">
											<!-- 별점 구현 초보, 새로운 거 알면 바꾸기-->
											<c:set var="starLank" value="5"/>
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
											</p>
											<p class="list_car">캐스퍼</p>
											<div class="txt_prev">
												<h4>너무 친절합니당</h4>
											</div>

											<p class="writter">
												<!-- select 구문에서 2번째 글자 * 로 치환 -->
												<span class="writter_name"><span class="sv_member">설*우</span></span>
											</p>
											<p class="date">12-02</p>
										</a>
									</li>
									
									<li class="list_cont">
										<a href="#">
											<p class="list_num">1</p>
											<p class="list_scope">
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
											</p>
											<p class="list_car">레인지로버 P530</p>
											<div class="txt_prev">
												<h4>리뷰</h4>
											</div>

											<p class="writter">
												<span class="writter_name"><span class="sv_member">최*진</span></span>
											</p>
											<p class="date">12-02</p>
										</a>
									</li>	
							
								</ul>
								
								<!-- 예약 내역(반납 시간 후)이 있는 사람만 출력 -->
						
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