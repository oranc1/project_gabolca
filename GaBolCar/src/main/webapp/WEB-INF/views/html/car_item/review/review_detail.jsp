<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/car_item/review/review_detail.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath}/resources/css/inc/footer.css" rel="styleSheet">
	<script src="${pageContext.request.contextPath}/resources/js/inc/jquery-3.7.0.js"></script>
<title>리뷰 게시글 상세보기</title>
<script type="text/javascript">
	function deleteConfirm() {
		if(!confirm("게시글을 삭제 하시겠습니까?")) {
			return false;
		} else {
			location.href="${pageContext.request.contextPath}reviewDelete?rev_idx=${reviewDetail.rev_idx}";
		}
	}
</script>
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
										<div class="subject" style="word-break:break-all;">
											${reviewDetail.rev_subject}
										</div>
									</li>
									
									<li class="write_info">
										<div class="write_box">
											<span class="write_t">작성자명</span>
											<span class="write_c">${reviewDetail.rev_name}</span>
										</div>
										<div class="write_box">
											<span class="write_t">등록일</span>
											<span class="write_c">${reviewDetail.rev_date_format}</span>
										</div>
										<div class="write_box">
											<span class="write_t">첨부파일</span>
											<span class="write_c">

												<c:if test="${not empty reviewDetail.rev_file1}">
													<a href="${pageContext.request.contextPath}/resources/upload/${reviewDetail.rev_file1}" download="${fn:split(reviewDetail.rev_file1, '_')[1]}">
														${fn:split(reviewDetail.rev_file1, '_')[1]}
													</a>
												</c:if>
												<c:if test="${not empty reviewDetail.rev_file2}">
													<br>
													<a href="${pageContext.request.contextPath}/resources/upload/${reviewDetail.rev_file2}" download="${fn:split(reviewDetail.rev_file2, '_')[1]}">
														${fn:split(reviewDetail.rev_file2, '_')[1]}
													</a>
												</c:if>
												<c:if test="${not empty reviewDetail.rev_file3}">
													<br>
													<a href="${pageContext.request.contextPath}/resources/upload/${reviewDetail.rev_file3}" download="${fn:split(reviewDetail.rev_file3, '_')[1]}">
														${fn:split(reviewDetail.rev_file3, '_')[1]}
													</a>
												</c:if>
											</span>
										</div>
									</li>

									<li class="write_scope">
										<div class="write_scope_box">
											<div class="car_name">
												${reviewDetail.car_model}
											</div>
											<span class="rev_scp">
												<!-- 별점 구현 -->
											<c:set var="starLank" value="${reviewDetail.rev_star}"/>
											 <c:choose>
    											<c:when test="${starLank eq 0}">
  													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 1}">
  													<span class="fill">★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 2}">
  													<span class="fill">★</span>
													<span class="fill">★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 3}">
  													<span class="fill">★</span>
													<span class="fill">★</span>
													<span class="fill">★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 4}">
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
											<!-- 별점 구현 -->
											</span>
										</div>
									</li>
								</ul>

								<div class="write_cont">
									<!-- 이미지 파일 출력 -->
									<img src="../img/casper.jpg" alt="">
									<!-- 작성글 출력! -->
									<p>
										<div style="word-break:break-all;">
										${reviewDetail.rev_content}
										</div>
										<c:if test="${not empty reviewDetail.rev_file1}">
											<img src="${pageContext.request.contextPath}/resources/upload/${reviewDetail.rev_file1}"/>
											
										</c:if>
										<c:if test="${not empty reviewDetail.rev_file2}">
											<br>
											<img src="${pageContext.request.contextPath}/resources/upload/${reviewDetail.rev_file2}"/>
										</c:if>
										<c:if test="${not empty reviewDetail.rev_file3}">
											<br>
											<img src="${pageContext.request.contextPath}/resources/upload/${reviewDetail.rev_file3}"/>
										</c:if>
										
									</p>
								</div>
								
								<div class="mod_box">
									<a class="list_btn" href="${pageContext.request.contextPath}reviewList?pageNum=${param.pageNum}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">목록</a>
										 <c:choose>
										 		<c:when test="${sId eq null}">  												
    											</c:when>
    											<c:when test="${reviewDetail.mem_id eq sId}">
    												<a class="modify_btn" href="${pageContext.request.contextPath}reviewModify?pageNum=${param.pageNum}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}&rev_idx=${reviewDetail.rev_idx}">수정</a>
													<a class="modify_delete" href="#" onclick="deleteConfirm()">삭제</a>
    											</c:when>
    											<c:when test="${sId eq 'admin@admin.com'}">
  													<a class="modify_delete" href="#" onclick="deleteConfirm()">삭제</a>
    											</c:when>
   												 <c:otherwise>
												 </c:otherwise>
											</c:choose>
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
							