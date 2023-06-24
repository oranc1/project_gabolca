<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/adm_brc_list.css">
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/admin/adm_brc_list.js"></script>
</head>
<body>
	<section id="sec_con" class="inr">
		<div class="adm_page_title">관리자 페이지</div>
		<div class="inq_container">
			<jsp:include page="../../inc/adm_sidebar.jsp" />
			<!-- 오른쪽 컨텐츠 -->
			<div class="content_view">
				<section id="adm_brc">
					<span id="adm_brc_title">[관리자] 지점리스트</span>
					<article class="adm_brc_center">
						<!-- 지점 배열로 받아 출력 -->
						<c:forEach var="brc" items="${brcList }" >
							<div class="brc_instan">
								<div class="brc_title">${brc.brc_name }</div>
								<ul class="brc_info">
									<li>
										<span class="li_tit">번호</span>
										<span class="li_txt">${brc.brc_idx }</span>
									</li>
									<li>
										<span class="li_tit">주소</span>
										<span class="li_txt">${fn:split(brc.brc_addr,',')[0] }</span>
									</li>
									<li>
										<span class="li_tit">상세주소</span>
										<span class="li_txt">${fn:split(brc.brc_addr,',')[1] }</span>
									</li>
									<li>
										<span class="li_tit">전화번호</span>
										<span class="li_txt">${brc.brc_tel }</span>
									</li>
<!-- 									<li> -->
<!-- 										<span class="li_tit">메일</span> -->
<!-- 										<span class="li_txt">location_email</span> -->
<!-- 									</li> -->
									<li class="mgmtbtn_sort">
										<button name="brc_update" class="adm_brc_button" value="${brc.brc_idx }">수정</button>
										<button name="brc_delete" class="adm_brc_button" value="${brc.brc_idx }">삭제</button>
									</li>
								</ul>
							</div>
						</c:forEach>
					</article>
					<button name="brc_insert" class="adm_brc_button">
						지점등록
					</button>
				</section>
			</div>
		</div>
	</section>
</body>
</html>