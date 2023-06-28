<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gabolcar - 이메일무단수집거부</title>

<%-- css --%>
<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/css/inc/bootstrap.min.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/member/etc/clause.css" rel="stylesheet">

<%-- js --%>
<script src="${pageContext.request.contextPath }/resources/js/inc/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>

<body>

	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<section id="sec_con" class="inr out_con">
		<h1 class="con_title">이메일무단수집거부</h1>
		<div id="out_wrapper">
			<div class="c_header">
			<img alt="" src="${pageContext.request.contextPath }/resources/img/inc/email_rej.png" width ="120px">
			</div>
			<div id="content">
				<div class="c_delete">
					<p class="coment">가볼카는 고객의 개인정보 보호를 가장 소중하게 생각하고, 고객의 개인정보를 가장 적극적이고, 효과적으로 보호하기 위해 항상 최선을 다해 노력하고 있습니다.</p>
					<br><br>
					본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나
					그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며 이를 위반시 정보통신망법에 의해 형사처벌됨을 알려드립니다.
					<br>	
				</div>
			</div>			
		</div>
	</section>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>
</body>


</html> 