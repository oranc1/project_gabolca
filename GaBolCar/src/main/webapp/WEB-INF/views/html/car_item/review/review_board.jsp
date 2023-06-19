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
									<c:forEach var="review" items="${reviewList }">
									<li class="list_cont">
										<a href="#">
											<p class="list_num">${review.rev_idx }</p>
											<p class="list_scope">
											<!-- 별점 구현 초보, 새로운 거 알면 바꾸기-->
											<c:set var="starLank" value="${review.rev_star }"/>
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
											<div class="txt_prev" href="BoardDetail?board_num=${board.board_num }&pageNum=${pageNum}">
												<h4>${review.rev_subject }</h4>
											</div>
											<p class="writter">
												<span class="writter_name"><span class="sv_member">${review.rev_name}</span></span>
											</p>
											<p class="date">${review.rev_date_format}</p>
										</a>
									</li>
									</c:forEach>
								</ul>
								
								<!-- 예약 내역(반납 시간 후)이 있는 사람만 출력 -->
						
								<div class="list_pager_wrap">
<!-- 									<nav class="pg_wrap"> -->
<!-- 										<span class="pg"> -->
<!-- 											<strong class="pg_current">1</strong> -->
<!-- 											<a href="" class="pg_page">2</a> -->
<!-- 											<a href="" class="pg_page pg_next">다음</a> -->
<!-- 											<a href="" class="pg_page pg_end">맨끝</a> -->
<!-- 										</span> -->
<!-- 									</nav> -->
								<%--
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 버튼 동작
		=> 클릭 시 BoardList 서블릿 요청(파라미터 : 현재 페이지번호 - 1)
		--%>
		<c:choose>
			<c:when test="${pageNum > 1 }">
				<input type="button" value="이전" onclick="location.href='BoardList?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전" disabled="disabled">
			</c:otherwise>
		</c:choose>

		<%-- 위의 문장을 간소화할 경우(조건에 따라 onclick 속성을 추가) --%>
<%-- 		<input type="button" value="이전" <c:if test="${pageNum > 1 }">onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'"</c:if>> --%>
		<%-- ===================================================================== --%>
		<%-- 페이지번호 목록은 시작페이지(startPage) 부터 끝페이지(endPage) 까지 표시 --%>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<%-- 각 페이지마다 하이퍼링크 설정(단, 현재 페이지는 하이퍼링크 제거) --%>
			<c:choose>
				<c:when test="${pageNum eq i }">
					<b>${i }</b>
				</c:when>
				<c:otherwise>
					<a href="BoardList?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>		
		<%-- ===================================================================== --%>
		<%--
		현재 페이지 번호(pageNum)가 최대 페이지 번호(maxPage) 보다 작을 경우에만 [다음] 버튼 동작
		=> 클릭 시 BoardList.bo 서블릿 요청(파라미터 : 현재 페이지번호 + 1)
		--%>
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage }">
				<input type="button" value="다음" onclick="location.href='BoardList?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음" disabled="disabled">
			</c:otherwise>
		</c:choose>
								
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