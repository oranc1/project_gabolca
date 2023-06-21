<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
	<section id="sec_con" class="inr car_view">
		<div class="upperContainner">
			<div class="slide_wrap">
				<div class="slide_container">
					<div class="mySlides">
						<div class="numbertext">1&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나1.jpg">
					</div>

					<div class="mySlides">
						<div class="numbertext">2&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나2.jpg">
					</div>

					<div class="mySlides">
						<div class="numbertext">3&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나3.jpg">
					</div>

					<div class="mySlides">
						<div class="numbertext">4&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나4.jpg"">
					</div>

					<div class="mySlides">
						<div class="numbertext">5&nbsp;&nbsp;/&nbsp;&nbsp;5</div>
						<img src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나5.jpg">
					</div>

					<a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next"
						onclick="plusSlides(1)">❯</a>
				</div>

				<div class="row">
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나1.jpg"
							onclick="currentSlide(1)">
					</div>
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나2.jpg"
							onclick="currentSlide(2)">
					</div>
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나3.jpg"
							onclick="currentSlide(3)">
					</div>
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나4.jpg"
							onclick="currentSlide(4)">
					</div>
					<div class="column">
						<img class="demo cursor" src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/코나5.jpg"
							onclick="currentSlide(5)">
					</div>
				</div>
			</div>

			<div class="view_info">
				<div class="view_cont">
					<p class="car_comp">현대자동차</p>
					<div class="car_name">
						<h4>캐스퍼</h4>
						<p>경형</p>
					</div>
					<div class="res_loca">
						<div class="rent_loca loca_comm">
							<p>대여할 곳</p>
							<p>
								<span class="rt_ico"></span> <span> <select>
										<option disabled="disabled" selected="selected">부산진구점(본점)</option>
										<option disabled="disabled">부산역점</option>
										<option disabled="disabled">해운대점</option>
								</select>
								</span>
							</p>
						</div>
						<div class="rent_arrow">
							<span></span>
						</div>
						<div class="retn_loca loca_comm">
							<p>반납할 곳</p>
							<p>
								<span class="rt_ico"></span> <span> <select>
										<option disabled="disabled" selected="selected">부산진구점(본점)</option>
										<option disabled="disabled">부산역점</option>
										<option disabled="disabled">해운대점</option>
								</select>
								</span>
							</p>
						</div>
					</div>
					<div class="res_date">
						<div class="rent_date_txt date_comm">
							<p>대여일</p>
							<span>23. 05. 28 15:00</span>
						</div>
						<div class="rent_date_total">
							<p>총 대여시간</p>
							<span>1일 2시간</span>
						</div>
						<div class="ret_date date_comm">
							<p>반납일</p>
							<span>23. 05. 28 15:00</span>
						</div>
					</div>
					<p class="view_amount">
						<b>100,000</b>원
					</p>
					<a href="resPayment?car_idx=${map.car_idx }
									&res_rental_date=${map.res_rental_date}&res_return_date=${map.res_return_date}
									&brc_rent_name=${map.brc_rent_name}&brc_return_name=${map.brc_rent_name}" class="view_res_btn">예약하러 가기</a>
				</div>
			</div>
		</div>

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
				let captionText = document.getElementById("caption");
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
				captionText.innerHTML = dots[slideIndex - 1].alt;
			}
		</script>

		<div class="view_more_info more_wrap_box">
			<p class="view_tit">차량 정보</p>
			<div class="more_cont">
				<div class="more_box">
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">차량번호</p>
						<span>02호6584</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">모델</p>	
						<span>코나</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">연식</p>
						<span>2022년식</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">변속타입</p>
						<span>자동</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">연료</p>
						<span>디젤</span>
					</div>
					<div>
						<p class="more_icon"></p>
						<p class="opt_name">정원</p>
						<span>7인승</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="option_wrap more_wrap_box">
			<p class="view_tit">옵션 정보</p>
			<div class="more_cont">
				<div class="opt_list">
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_linsece.png">
						<p>국제운전면허증가능</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_sos.png">
						<p>긴급출동무료</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_charger.png">
						<p>충전기제공</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_aux_cable.png">
						<p>AUX선 제공</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_seat.png">
						<p>카시트무료(수량한정)</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_nosmoking.png">
						<p>금연</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_heatseat.png">
						<p>열선시트</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_heathandle.png">
						<p>핸들열선</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_sunloof.png">
						<p>썬루프</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_smartkey.png">
						<p>스마트키</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_navigation.png">
						<p>네비게이션</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_backcamera.png">
						<p>후방카메라</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_blackbox.png">
						<p>블랙박스</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_highpass.png">
						<p>하이패스</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_bluetooth.png">
						<p>블루투스</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_babyseat.png">
						<p>유아용 카시트</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_usb.png">
						<p>USB</p>
					</div>
					<div>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/car_img_storage/car_option/option_cd.png">
						<p>CD</p>
					</div>
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
					<ul>
						<li class="">
							<span class="rev_scp">★★★★★</span>
							<span class="rev_name">홍길동</span>
							<span class="rev_txt">솔직후기 일단 차상태는 외관 내관 모두 정말 깨끗합니다 에어컨틀어을때도 냄새가 안납니다 진짜좋은건 차연비입니다 고속도로 탔는데 23까지 오르더군요(차관리 진짜잘해주신거같습니다) 서비스부분에서도 만족스러웠습니다</span>
						</li>
						<li class="">
							<span class="rev_scp">★★★★★</span>
							<span class="rev_name">홍길동</span>
							<span class="rev_txt">솔직후기 일단 차상태는 외관 내관 모두 정말 깨끗합니다 에어컨틀어을때도 냄새가 안납니다 진짜좋은건 차연비입니다 고속도로 탔는데 23까지 오르더군요(차관리 진짜잘해주신거같습니다) 서비스부분에서도 만족스러웠습니다</span>
						</li>
						<li class="">
							<span class="rev_scp">★★★★★</span>
							<span class="rev_name">홍길동</span>
							<span class="rev_txt">솔직후기 일단 차상태는 외관 내관 모두 정말 깨끗합니다 에어컨틀어을때도 냄새가 안납니다 진짜좋은건 차연비입니다 고속도로 탔는데 23까지 오르더군요(차관리 진짜잘해주신거같습니다) 서비스부분에서도 만족스러웠습니다</span>
						</li>
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




