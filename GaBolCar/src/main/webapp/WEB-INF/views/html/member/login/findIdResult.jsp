<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/findResult.css" >

</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="sec_con" class="w3-container-main inr">

		<h1 class="con_title">아이디  찾기 결과</h1>
		<div class="find_wrap">
			<div class="cont_box">
				
				<div class="find_cont">
					<div class="find_txt">
						<div class="fir_tit">
							회원님의 아이디는 ${member.mem_id } 입니다.
						</div>
					</div>
					
					<div class="ul1">
						<ul class="isbox"> 
							<li>
								
							</li>
						</ul>
					</div>
					<div class="btn-wrap">
						<input class="btn_write" type="submit" value="로그인 페이지로 돌아가기" onclick="location.href='login'">
					</div>
				</div>
		
	
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>

</body>
</html>