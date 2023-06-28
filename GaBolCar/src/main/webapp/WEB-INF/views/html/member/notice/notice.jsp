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
					<form name="fboardlist" id="fboardlist" action="" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<div class="wrapper">
							<div class="list_wrap">
								<div class="search_wrap">
									<select name="searchType" id="searchType">
										<option value="subject" <c:if test="${param.searchType eq 'subject'}" >selected</c:if>>제목</option>			
										<option value="content" <c:if test="${param.searchType eq 'content'}">selected</c:if>>내용</option>			
										<option value="subject_content" <c:if test="${param.searchType eq 'subject_content'}">selected</c:if>>제목&내용</option>			
									</select>
									<input type="text" name="searchKeyword" value="${param.searchKeyword}" id="searchKeyword" >
									<input type="submit" value="검색" class="searchSubmit">
								</div>
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
									
									<c:forEach var="noticeList" items="${noticeListP}">
										<li class="list_cont">
											<a href="noticeDetail?pageNum=${pageMaker.cri.pageNum }&bo_idx=${noticeList.bo_idx }">
												<p class="list_num">${noticeList.bo_idx }</p>
												<div class="txt_prev">
													<h4>${noticeList.bo_title }</h4>
												</div>
	
												<p class="writter">
													<span class="writter_name"><span class="sv_member">관리자</span></span>
												</p>
												<p class="date">
													<fmt:formatDate value="${noticeList.bo_sysdate }" pattern="YY-MM-dd"/>
												</p>
											</a>
										</li>
									</c:forEach>
								</ul>
								
								<div class="write_btn">
									<c:if test="${sessionScope.sId eq 'admin@admin.com'}">
										<a href="noticeWriteForm">글쓰기</a>
									</c:if>
								</div>

								<div class="list_pager_wrap">
									<nav class="pg_wrap">
										<span class="pg">
											<c:if test="${pageMaker.cri.pageNum > 1 }">											
												<a href="noticeList?pageNum=${pageMaker.cri.pageNum - 1 }" class="pg_page pg_prev" >이전</a>
											</c:if>
											<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
													<c:choose>
														<c:when test="${pageMaker.cri.pageNum == num }">
															<strong class="pg_current">${num}</strong>
														</c:when>
														<c:otherwise>
															<a href="noticeList?pageNum=${num }" class="pg_page">${num }</a>
														</c:otherwise>
													</c:choose>
											</c:forEach>
											<c:if test="${pageMaker.endPage < pageMaker.realEnd || pageMaker.endPage > 1 && pageMaker.cri.pageNum < pageMaker.realEnd}">											
												<a href="noticeList?pageNum=${pageMaker.cri.pageNum + 1 }" class="pg_page pg_next" >다음</a>
											</c:if>
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