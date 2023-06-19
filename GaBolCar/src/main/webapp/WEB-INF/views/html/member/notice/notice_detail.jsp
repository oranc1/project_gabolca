<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/member/notice/notice_detail.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
	
	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<title>공지사항</title>
<script type="text/javascript">
	function deleteConfirm() {
		if(!confirm("게시글을 삭제 하시겠습니까?")) {
			return false;
		} else {
			location.href="noticeDelete?bo_idx=${noticeDetail.bo_idx }";
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
			<h1 class="con_title">공지사항</h1>
			<section id="board_wrap">
				<section id="board_list" class="notice">
					<div class="wrapper">
						<input type="hidden" name="pageNum" value="${cri.pageNum }">
						<input type="hidden" name="amount" value="${cri.amount }">
						<div class="list_wrap">
							<ul class="list">
								<li>
									<div class="subject">
										${noticeDetail.bo_title }
									</div>
								</li>
								<li class="write_info">
									<div class="write_box">
										<span class="write_t">작성자명</span>
										<span class="write_c">관리자</span>
									</div>
									<div class="write_box">
										<span class="write_t">등록일</span>
										<span class="write_c">
											<fmt:formatDate value="${noticeDetail.bo_sysdate }" pattern="YY-MM-dd HH:mm"/>
										</span>
									</div>
									<div class="write_box">
										<span class="write_t">조회수</span>
										<span class="write_c">${bo_reacount }</span>
									</div>
								</li>
							</ul>
							<div class="write_cont">
								<!-- 이미지 파일 출력 -->
<!-- 								<img src="../img/casper.jpg" alt=""> -->
								<!-- 작성글 출력 -->
								<p style="white-space: pre-line;">
									${noticeDetail.bo_content }
								</p>
							</div>
							<div class="mod_box">
									<a class="list_btn" href="noticeList?pageNum=${cri.pageNum }">목록</a>
								<c:if test="${sessionScope.sId eq 'admin' }">								
									<a class="modify_btn" href="noticeModify?pageNum=${cri.pageNum }&bo_idx=${noticeDetail.bo_idx }">수정</a>
									<a class="delete_btn" href="#" onclick="deleteConfirm()">삭제</a>
								</c:if>
							</div>
						</div>
					</div>
				</section>
			</section>
		</section>
	</div>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>