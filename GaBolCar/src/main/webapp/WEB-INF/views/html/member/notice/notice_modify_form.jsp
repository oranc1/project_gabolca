<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/member/notice/notice_modify_form.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
	
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
	
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="notice_cont">
		<section id="sec_con" class="inr">
			<h1 class="con_title">공지사항</h1>
			<form action="noticeModifyPro" method="post">
				<input type="hidden" name="bo_idx" value="${noticeDetail.bo_idx}">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<section id="board_wrap">
					<section id="board_list" class="notice">
						<div class="wrapper">
							<div class="list_wrap">
								<ul class="list">
									<li>
										<div class="subject">
											<input type="text" class="inputBox" name="bo_title" value="${noticeDetail.bo_title }">
										</div>
									</li>
								</ul>
								<div class="write_cont">
									<p>
										<textarea rows="" cols="" class="inputBox" name="bo_content">${noticeDetail.bo_content }</textarea>
									</p>
								</div>
								<div class="mod_box">
									<input type="submit" class="submit_btn" value="등록">
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