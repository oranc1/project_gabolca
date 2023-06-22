<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>차량정보</title>
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/car_item/res/car_res_info.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
		<input type="hidden" name="car_model" value="${map.car_info.car_model}"/>
		<section id="sec_con" class="inr car_view">
		<div class="upperContainner">
			<div class="slide_wrap">
				<div class="slide_container">
					<div class="mySlides">
						<div class="numbertext">1&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }${map.car_info.car_file1}">
					</div>

					<div class="mySlides">
						<div class="numbertext">2&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }${map.car_info.car_file2}">
					</div>

					<div class="mySlides">
						<div class="numbertext">3&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }${map.car_info.car_file3}">
					</div>

					<div class="mySlides">
						<div class="numbertext">4&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }${map.car_info.car_file4}">
					</div>

					<div class="mySlides">
						<div class="numbertext">5&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }${map.car_info.car_file5}">
					</div>

					<a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next"
						onclick="plusSlides(1)">❯</a>
				</div>

				<div class="row">
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }${map.car_info.car_file1}"
							onclick="currentSlide(1)">
					</div>
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }${map.car_info.car_file2}"
							onclick="currentSlide(2)">
					</div>
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }${map.car_info.car_file3}"
							onclick="currentSlide(3)">
					</div>
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }${map.car_info.car_file4}"
							onclick="currentSlide(4)">
					</div>
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }${map.car_info.car_file5}"
							onclick="currentSlide(5)">
					</div>
				</div>
			</div>

			<div class="view_info">
				<div class="view_cont">
					<p class="car_comp">${map.car_info.car_company}</p>
					<div class="car_name">
						<h4>${map.car_info.car_model}</h4>
						<p>${map.car_info.car_type}</p>
					</div>
					<div class="res_loca">
						<div class="rent_loca loca_comm">
							<p>대여할 곳</p>
							<p>
								<span class="rt_ico"></span>${map.brc_rent_name}<span> 
								</span>
							</p>
						</div>
						<div class="rent_arrow">
							<span></span>
						</div>
						<div class="retn_loca loca_comm">
							<p>반납할 곳</p>
							<p>
								<span class="rt_ico"></span> <span>${map.brc_return_name}</span>
							</p>
						</div>
					</div>
					<div class="res_date">
						<div class="rent_date_txt date_comm">
							<p>대여일</p>
							<span>${map.res_rental_date}</span>
						</div>
						<div class="rent_date_total">
							<p>총 대여시간</p>
							<span id="rental_time"></span>
						</div>
						<div class="ret_date date_comm">
							<p>반납일</p>
							<span>${map.res_return_date}</span>
						</div>
					</div>
					<p class="view_amount">
						<b id="total_money"></b>원
					</p>
					<a href="" class="view_res_btn">예약하러 가기</a>
				</div>
			</div>
		</div>
		<script type="text/javascript">							
		$(document).ready(function () {
		    timediff();
		});
		function timediff()
		{
			const dateA = new Date('${map.res_return_date}');
			const dateB = new Date('${map.res_rental_date}');
			const diffMSec = dateA.getTime() - dateB.getTime();
			
			var diffTime = (dateA.getTime() - dateB.getTime()) / (1000*60*60);
			$("#rental_time").html(diffTime);
			 
			
			var total_money = parseInt(diffTime * (${map.car_info.car_weekdays}/24)); <%--${map.car_info.car_weekend}--%>
			$("#total_money").html(total_money);
		}
		</script>
		<script>
			let slideIndex = 1;
			showSlides(slideIndex);

			function plusSlides(n) {
				showSlides(slideIndex += n);
			}

			function currentSlide(n) {
				showSlides(slideIndex = n);
			}

			function showSlides(n) {
				let i;
				let slides = document.getElementsByClassName("mySlides");
				let dots = document.getElementsByClassName("demo");
				if (n > slides.length) {
					slideIndex = 1
				}
				if (n < 1) {
					slideIndex = slides.length
				}
				for (i = 0; i < slides.length; i++) {
					slides[i].style.display = "none";
				}
				for (i = 0; i < dots.length; i++) {
					dots[i].className = dots[i].className
							.replace(" active", "");
				}
				slides[slideIndex - 1].style.display = "block";
				dots[slideIndex - 1].className += " active";
				}
		</script>

		<div class="view_more_info more_wrap_box">
			<p class="view_tit">차량 정보</p>
			<div class="more_cont">
				<div class="more_box">
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">차량번호</p>
						<span>${map.car_info.car_number}</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">모델</p>	
						<span>${map.car_info.car_model}</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">연식</p>
						<span>${map.car_info.car_old}</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">변속타입</p>
						<span>${map.car_info.car_shift_type}</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">연료</p>
						<span>${map.car_info.car_fuel_type}</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">정원</p>
						<span>${map.car_info.car_riding}인</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="option_wrap more_wrap_box">
			<p class="view_tit">옵션 정보</p>
			<div class="more_cont">
				<div class="opt_list">
					<c:forEach var="car_option" items="${map.car_option}">
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/${car_option.option_image_url}"/>
						<p>${car_option.option_name}</p>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
	
		<div class="review_wrap more_wrap_box">
			<div class="view_tit_sec">
				<p class="view_tit">고객 리뷰</p>
				<a href="">더보기</a>
			</div>
			<div class="more_cont">
				<div class="rev_cont">
					<ul class=""> 
					<c:forEach var="reviewListS" items="${map.reviewListS }">
						<li class="">
							<span class="write_s"><span>
												<!-- 별점 구현 초보, 새로운 거 알면 바꾸기-->
											<c:set var="starLank" value="${reviewListS.rev_star}"/>
											 <c:choose>
    											<c:when test="${starLank eq 0 }">
  													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 1 }">
  													<span class="fill">★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 2 }">
  													<span class="fill">★</span>
													<span class="fill">★</span>
													<span>★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 3 }">
  													<span class="fill">★</span>
													<span class="fill">★</span>
													<span class="fill">★</span>
													<span>★</span>
													<span>★</span>
    											</c:when>
    											<c:when test="${starLank eq 4 }">
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
											<!-- 별점 구현 초보 -->
											</span></span>
							<span class="rev_name">${reviewListS.rev_name }</span>
							<span class="rev_txt">${reviewListS.rev_content }</span>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		
		
		<div class="ins_wrap more_wrap_box">
			<p class="view_tit">보험 안내</p>
			<div class="more_cont">
				<div class="ins_int">
					<table>
						<tr>
							<th>일반자차</th>
							<td>면책금 30~50만원 + 휴차보상료(사고 1건만 적용, 차종별 한도 있음)</td>
						</tr>
						<tr>
							<th>미가입</th>
							<td>사고로 발생되는 모든 차량수리비 및 휴차보상료를 고객께서 부담하셔야 합니다.<br>
   								<span>타인에 의한 사고가 많은 만큼</span> 만일의 경우를 대비해 자차보험에 가입하시길 권고 드립니다.</td>
						</tr>
					</table>
					<ul class="imp_check">
						<li>* 모든 자차보험은 사고 1건에 대해서만 적용됩니다.</li>
						<li>* 대형,수입 등 특이차종의 경우 일반면책만 가입가능</li>
						<li>* 면책적용 불가사항 (출동서비스, 견인, 체인, 네비게이션, 실내부품, 타이어, 휠, 침수, 12대중과실사고, 미등록운전자사고)</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>




