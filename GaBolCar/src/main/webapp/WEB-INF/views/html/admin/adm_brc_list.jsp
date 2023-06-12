<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
					<article id="adm_brc_center">
						<c:forEach var="brc" items="${brcList }">
							<div class="brc_info">
								<ul class="brc_title">
									<li>지점코드</li>
									<li>지점명</li>
									<li>주소</li>
									<li>전화번호</li>
									<li colspan="2">관리</li>
								</ul>
								<!-- 리스트를 불러와서 중복 출력될 라인 -->
								<ul class="brc_content">
									<li>${brc.brc_idx }</li>
									<li>${brc.brc_name }</li>
									<li>${brc.brc_addr }</li>
									<li>${brc.brc_tel }</li>
									<div class="brc_content_button">
										<li>
											<button name="brc_update" class="adm_brc_button" value="${brc.brc_idx }">
												수정
											</button>
										</li>
										<li>
											<button name="brc_delete" class="adm_brc_button" value="${brc.brc_idx }">
												삭제
											</button>
										</li>
									</div>
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