<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/member/question/question_write_form.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
    <title>1:1 문의 게시판</title>

</head>
<body>
    <header>
        <jsp:include page="../../../inc/top1.jsp"></jsp:include>
    </header>
    <div id="notice_cont">
        <section id="sec_con" class="inr">
            <h1 class="con_title">1:1 문의 게시판</h1>
            <form action="submit_inquiry.jsp" method="post"> <!-- Use POST method and specify the submission URL -->
                <section id="board_wrap">
                    <section id="board_list" class="notice">
                        <div class="wrapper">
                            <div class="list_wrap">
                                <ul class="list">
                                    <li>
                                        <div class="category"><label for="car_type">분류</label>  
                                            <select name="category">
                                                <option value="" selected>선택하세요</option>
                                                <option value="reservation">예약</option>
                                                <option value="reservation_cancel">예약 취소</option>
                                                <option value="other">기타</option>
                                            </select>
                                        </div>
                                        <div class="writer">
                                            <input type="text" name="writer" placeholder="작성자" class="inputBox">
                                        	<!-- 작성자 명은 DB로 불러오기 -->
                                        </div>
                                    </li>
                                    <li>
                                        <div class="password">
                                            <input type="password" name="password" placeholder="비밀번호를 입력해주세요" class="inputBox">
                                        </div>
                                        <div class="title">
                                            <input type="text" name="title" placeholder="제목을 입력해주세요" class="inputBox">
                                        </div>
                                    </li>
                                </ul>
                                <div class="write_cont">
                                    <p>
                                        <textarea name="content" rows="" cols="" class="inputBox" placeholder="내용을 입력해주세요"></textarea>
                                    </p>
                                </div>
                                <div class="mod_box">
                                    <input type="submit" class="delete_btn" value="등록">
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
