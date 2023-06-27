<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<form name="fboardlist" id="fboardlist" action="" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"/>
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }"/>
						
					
							<%-- 검색타입목록, 검색어입력창 추가 --%>
								
							<select name="searchType" id="searchType">
								<option value="subject" <c:if test="${param.searchType eq 'subject' }">selected</c:if>>제목</option>			
								<option value="content" <c:if test="${param.searchType eq 'content' }">selected</c:if>>내용</option>			
								<option value="subject_content" <c:if test="${param.searchType eq 'subject_content' }">selected</c:if>>제목&내용</option>			
								<option value="name" <c:if test="${param.searchType eq 'name' }">selected</c:if>>작성자</option>
								<option value="star" <c:if test="${param.searchType eq 'star' }">selected</c:if>>별점</option>
								<option value="carModel" <c:if test="${param.searchType eq 'carModel' }">selected</c:if>>차종</option>
							</select>
							<input type="text" name="searchKeyword" value="${param.searchKeyword }" id="searchKeyword">
						
							<input type="submit" value="검색">
						
							
							<%-- 검색타입목록, 검색어입력창 추가! --%>
													
						
						
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
										<c:forEach var="reviewList" items="${reviewListP }">
										<li class="list_cont">
											<a href="/project_gabolcar/reviewDetail?rev_idx=${reviewList.rev_idx}&pageNum=${pageNum}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">
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
												<p class="list_car">${reviewList.car_model}</p>
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
									<div class="write_btn">
										<a href="/project_gabolcar/reviewWriteForm?pageNum=${pageNum}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">글쓰기</a>
									</div>
										
										
									<div class="list_pager_wrap">
										<nav class="pg_wrap">
											<span class="pg">
												<%--
												현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 버튼 동작
												=> 클릭 시 BoardList.bo 서블릿 요청(파라미터 : 현재 페이지번호 - 1)
												--%>
												<c:choose>
													<c:when test="${pageNum > 1 }">
														<input type="button" value="이전"  class="pg_page pg_prev" onclick="location.href='reviewList?pageNum=${pageNum - 1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword }'">
													</c:when>
													<c:otherwise>
														<input type="button" value="이전"  class="pg_page pg_prev" disabled="disabled">
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
															<strong class="pg_current">${i }</strong>
														</c:when>
														<c:otherwise>
															<a href="reviewList?pageNum=${i }&searchType=${param.searchType}&searchKeyword=${param.searchKeyword }" class="pg_page">${i }</a>
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
														<input type="button" value="다음" class="pg_page pg_next"  onclick="location.href='reviewList?pageNum=${pageNum + 1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword }'">
													</c:when>
													<c:otherwise>
														<input type="button" value="다음" class="pg_page pg_next"  disabled="disabled">
													</c:otherwise>
												</c:choose>
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