<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 조회</title>
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/member/mem_page/mem_res_inq.css" rel="styleSheet">
    <link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
    
    <script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
    <section id="sec_con" class="inr">
        <h1 class="con_title">예약 조회</h1>
        <div class="inq_container">
            <!-- 사이드바 -->
            <jsp:include page="../../../inc/mem_sidebar.jsp"></jsp:include>

            <!-- 예약 조회 -->
            <div class="inq_list">
                <ul>
                    <li>
                        <div class="res_car_img">
                            <div>
                                <img src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/casper.jpg" alt="">
                            </div>
                        </div>
                        <div class="list_car_info">
                            <div class="list_res_car">
                                <p>캐스퍼(현대)</p>
                                <p>결제 대기 중</p>
                            </div>
                            <div class="list_res_date">
                                <dl>
                                    <dt>예약일자</dt>
                                    <dd>2023. 05. 17 ~ 2023. 05. 18</dd>
                                </dl>
                                <dl>
                                    <dt>예약번호</dt>
                                    <dd>ADKE-51531564</dd>
                                </dl>
                                <dl>
                                    <dt>대여일자/지점</dt>
                                    <dd>2023. 05. 17(수)15:00 / 범일동</dd>
                                </dl>
                                <dl>
                                    <dt>반납일자/지점</dt>
                                    <dd>2023. 05. 18(목)15:00 / 범일동</dd>
                                </dl>
                            </div>
                            <div class="inq_btn">
                                <button>예약 상세 조회</button>
                                <button>예약 취소</button>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="res_car_img">
                            <div>
                                <img src="${pageContext.request.contextPath }/resources/img/car_img_storage/test_img/casper.jpg" alt="">
                            </div>
                        </div>
                        <div class="list_car_info">
                            <div class="list_res_car">
                                <p>캐스퍼(현대)</p>
                                <p class="ret_car">반납 완료</p>
                            </div>
                            <div class="list_res_date">
                                <dl>
                                    <dt>예약일자</dt>
                                    <dd>2023. 05. 17 ~ 2023. 05. 18</dd>
                                </dl>
                                <dl>
                                    <dt>예약번호</dt>
                                    <dd>ADKE-51531564</dd>
                                </dl>
                                <dl>
                                    <dt>대여일자/지점</dt>
                                    <dd>2023. 05. 17(수)15:00 / 범일동</dd>
                                </dl>
                                <dl>
                                    <dt>반납일자/지점</dt>
                                    <dd>2023. 05. 18(목)15:00 / 범일동</dd>
                                </dl>
                            </div>
                            <div class="inq_btn">
                                <button>예약 상세 조회</button>
                                <button class="ret_rev">리뷰 작성</button>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>

        </div>
    </section>

    <script>
        $('.menu_tit').click(function () {
            $(this).children('span').addClass('on');
            if ($(this).siblings('.side_sub').is(':hidden')) {
                $(this).siblings('.side_sub').slideDown();
                $(this).children('span').removeClass('on');
            } else {
                $(this).siblings('.side_sub').slideUp();
            }
        });
    </script>
    <footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>

</body>

</html>