<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원가입</title>

	<%-- css --%>
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/member/login/signup.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
	
	<%-- js --%>
	<script src="${pageContext.request.contextPath }/resources/js/member/login/signup.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>

<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="contents">
		<section id="sec_con" class="inr signup_wrap">
		 	<h1 class="con_title">가볼카 회원가입</h1>
		 	<div class="signup_cont">
			    <div class="sign_wrapper">  
			        <div class="email">
			        	<p>아이디(이메일)</p>
			        	<span class="sign_mark">*</span><br>
			            <input id="email" type="text" placeholder="이메일을 입력해 주세요.">
			            <div id="emailError" class="error"></div>
			        </div>
			        
			        <div class="name">
			        	<p>이름</p>
			        	<span class="sign_mark">*</span><br>
			            <input id="name"  type="text" placeholder="이름을 입력해 주세요.">
			            <div id="nameError" class="error"></div>
			        </div>
			        <div class="password">
			        	<p>비밀번호</p>
			        	<span class="sign_mark">*</span><br>
			            <input id="password" type="password" placeholder="비밀번호를 입력해 주세요.">
			            <div id="passwordError" class="error"></div>
			        </div>
			        <div class="passwordCheck">
			        	<p>비밀번호 확인</p>
			        	<span class="sign_mark">*</span><br>
			            <input id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요.">
			            <div id="passwordCheckError" class="error"></div>
			        </div>
			        	<p>휴대폰번호</p>
			        	<span class="sign_mark">*</span><br>
			        <div class="phone">
			            <input id="phone1" type="text" size="1" maxlength="3" oninput="changePhone1()"> -
			            <input id="phone2" type="text" size="3" maxlength="4" oninput="changePhone2()"> -
			            <input id="phone3" type="text" size="3" maxlength="4" oninput="changePhone3()">
			        </div>
			        <div class="auth ph_cert">
			            <div id="certificationNumber">000000</div>
			            <button disabled id="sendMessage" onclick="getToken()">인증번호 전송</button>
			        </div>
			
			        <div class="timer ph_cert">
			            <div id="timeLimit">03:00</div>
			            <button disabled id="completion" onclick="checkCompletion()">인증확인</button>
			        </div>
			        
			        
			        <div class="line">
			            <hr>
			        </div>
			        <div class="signUp">
			            <button id="signUpButton" disabled onclick="signUpCheck()">가입하기</button>
			        </div>
			    </div>
		 	</div>
		</section>
	</div>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>

</body>
</html>