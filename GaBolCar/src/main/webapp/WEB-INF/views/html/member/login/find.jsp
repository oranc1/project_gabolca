<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 원본 파일 이름 Find -->
<head>
<meta charset="UTF-8">
<title>Gabolcar - 아이디 , 비밀번호 찾기</title>
<link href="${pageContext.request.contextPath }/resources/css/common.css"  rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login/find.css" >
<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="stylesheet">

<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<div id="sec_con" class="w3-container-main inr">

		<h1 class="con_title">아이디 비밀번호 찾기</h1>
		<div class="find_wrap">
			<div class="cont_box">
				<div class="find_tit">
					<div class="find_tab">
						<p>
							아이디 찾기
						</p>
					</div>

					<div class="find_tab">
						<p>비밀번호 찾기</p>
					</div>

					

				</div>
		
				<div class="find_cont">
					<div class="find_txt">
						<div class="fir_tit">
							<strong class="">아이디</strong>가 생각나지 않으세요?
						</div>
						<div class="pad5tf">아래의 정보를 입력하시면 아이디를 알려드립니다.</div>
					</div>
					
					<div class="ul1">
						<ul class="isbox"> 
							<li>
								<div >
									<input type="text" name="mem_name" id="id_s_name" maxLength="25" size="50" placeholder="이름을 입력하세요">
								</div>
							</li>
							<li>
								<div>
									<input type="text" name="mem_mtel" id="id_s_phone" value="" maxLength="25" size="50" placeholder="휴대폰번호를 010-1234-5678 형태로 입력하세요" >
								</div>
							</li>
						</ul>
					</div>
					<div class="btn-wrap">
						<input class="btn_write" type="submit" value="확인" onclick="location.href='findIdPro'">
					</div>
				</div>
		
				<div class="find_cont" style="display: none">
					<div class="find_txt">
						<div class="fir_tit">
							<strong class="">비밀번호</strong>가 생각나지 않으세요?
						</div>
						<div class="pad5tf">아래의 정보를 입력하시면 비밀번호를 알려드립니다.</div>
					</div>
					<div class="ul1">
						<ul class="isbox">
							<li>
								<input type="text" name="pw_s_id" id="pw_s_id" maxLength="25" size="50" placeholder="아이디를 입력하세요">
							</li>
							<li>
								<input type="text" name="pw_s_name" id="pw_s_name" maxLength="25" size="50" placeholder="이름을 입력하세요">
							</li>
							<li>
								<input type="text" name="pw_s_phone" id="pw_s_phone" maxLength="25" size="50" value="" placeholder="휴대폰번호를 입력하세요">
							</li>
						</ul>
					</div>
					<div class="btn-wrap">
						<input class="btn_write" type="submit" value="확인">
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>
	<script>
		$(".find_tab").first().addClass("off");
		$(".find_tab").first().click(function() {
			$(this).addClass("off");
			$(".find_tab").last().removeClass("off");
			
			$(".find_cont").first().css("display", "block");
			$(".find_cont").last().css("display", "none");
		});
		$(".find_tab").last().click(function() {
			$(this).addClass("off");
			$(".find_tab").first().removeClass("off");
			
			$(".find_cont").last().css("display", "block");
			$(".find_cont").first().css("display", "none");
		});
		
	</script>

</body>
</html>