<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
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
<%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1로 설정) --%>
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="notice_cont">
		<section id="sec_con" class="inr">
			<h1 class="con_title">리뷰 게시판</h1>
			<section id="board_wrap">
				<section id="board_list" class="notice">
					<form name="fboardlist" id="fboardlist" action="" method="post">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<div class="wrapper">
							<div class="list_wrap">
	<!-- 순서정렬버튼-->
<!-- 								<select class="dropdown-menu"> -->
<%--     <option class="dropdown-item" href="/?page=${param.page}&sort=id,DESC&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">일자순</option> --%>
<%--     <option class="dropdown-item" href="/?page=${param.page}&sort=count,DESC&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">별점순</option> --%>
<%--     <option class="dropdown-item" href="/?page=${param.page}&sort=recommendCount,DESC&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">차종순</option> --%>
<!-- 								</select> -->
	<!-- id=idx, count=rev_star, recomendCount=car_model로 변경예정-->							
<!-- https://daegwonkim.tistory.com/363 참고 https://velog.io/@areum0921/%EC%A0%95%EB%A0%AC-%EA%B8%B0%EB%8A%A5-%EC%B6%94%EA%B0%80%ED%95%98%EA%B8%B0-->
	<!-- 순서정렬버튼 -->
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
									<c:forEach var="reviewList" items="${reviewListP }">
									<li class="list_cont">
										<a href="/review/detail?pageNum=${pageMaker.cri.pageNum}&rev_idx=${reviewList.rev_idx}">
											<p class="list_num">${reviewList.rev_idx }</p>
											<p class="list_scope">
											<!-- 별점 구현 초보, 새로운 거 알면 바꾸기-->
											<c:set var="starLank" value="${reviewList.rev_star }"/>
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
											<p class="list_car">차종</p>
									<%-- 제목 클릭을 위한 하이퍼링크 설정(BoardDetail) --%>
									<%-- 파라미터 : 글번호(board_num), 페이지번호(pageNum) --%>
											<div class="txt_prev">
												<h4>${reviewList.rev_subject }</h4>
											</div>
											<p class="writter">
												<span class="writter_name"><span class="sv_member">${reviewList.rev_name}</span></span>
											</p>
											<p class="date">${reviewList.rev_date_format}</p>
										</a>
									</li>
									</c:forEach>
								</ul>
								
								<!-- 예약 내역(반납 시간 후)이 있는 사람만 출력 -->
						
								
								<div class="list_pager_wrap">
									<nav class="pg_wrap">
										<span class="pg">
											<c:if test="${pageMaker.cri.pageNum > 1 }">											
												<a href="reviewList?pageNum=${pageMaker.cri.pageNum - 1 }" class="pg_page pg_prev" >이전</a>
											</c:if>
										<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
											<c:choose>
												<c:when test="${pageMaker.cri.pageNum == num }">
													<strong class="pg_current">${num}</strong>
												</c:when>
													<c:otherwise> 
														<a href="reviewList?pageNum=${num }" class="pg_page">${num }</a>
													</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pageMaker.endPage < pageMaker.realEnd || pageMaker.endPage > 1 && pageMaker.cri.pageNum < pageMaker.realEnd}">											
											<a href="reviewList?pageNum=${pageMaker.cri.pageNum + 1 }" class="pg_page pg_next" >다음</a>
										</c:if>
									</span>
								</nav>
							</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
								
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