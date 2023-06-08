<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- 원본 파일 이름 member_update -->
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지</title>
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/member/mem_page/mem_info_update.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/top.css" rel="styleSheet">
	<link href="${pageContext.request.contextPath }/resources/css/inc/footer.css" rel="styleSheet">
	
	<script src="${pageContext.request.contextPath }/resources/js/inc/jquery-3.7.0.js"></script>
</head>

<body>
	<header>
		<jsp:include page="../../../inc/top1.jsp"></jsp:include>
	</header>
	<section id="sec_con">
		<h1 class="con_title">내 정보 수정</h1>
		<div class="inq_container">
			<jsp:include page="../../../inc/mem_sidebar.jsp"></jsp:include>

			<div class="member-update-cont">
				<ul>
					<li>
						<label for="name">이름</label>
						<div class="form-input">
							<input type="text" name="name" id="name" class="form-control">
						</div>
					</li>
					<li id="gen_i">
						<label for="name">성별</label>
						<input type="radio" class="input_line" name="gender">
						<label for="">남</label>
						<input type="radio" class="input_line" name="gender">
						<label for="">여</label>
					</li>
					<li id="birth"><label for="name">생년월일</label>
						<div class="form-input">
							<div class="form-select">
								<select name="birthYear" class="form-control birthYear1" id="birthYear">
									<option value="">생년</option>
									<option value="1943">1943</option>
									<option value="1944">1944</option>
									<option value="1945">1945</option>
									<option value="1946">1946</option>
									<option value="1947">1947</option>
									<option value="1948">1948</option>
									<option value="1949">1949</option>
									<option value="1950">1950</option>
									<option value="1951">1951</option>
									<option value="1952">1952</option>
									<option value="1953">1953</option>
									<option value="1954">1954</option>
									<option value="1955">1955</option>
									<option value="1956">1956</option>
									<option value="1957">1957</option>
									<option value="1958">1958</option>
									<option value="1959">1959</option>
									<option value="1960">1960</option>
									<option value="1961">1961</option>
									<option value="1962">1962</option>
									<option value="1963">1963</option>
									<option value="1964">1964</option>
									<option value="1965">1965</option>
									<option value="1966">1966</option>
									<option value="1967">1967</option>
									<option value="1968">1968</option>
									<option value="1969">1969</option>
									<option value="1970">1970</option>
									<option value="1971">1971</option>
									<option value="1972">1972</option>
									<option value="1973">1973</option>
									<option value="1974">1974</option>
									<option value="1975">1975</option>
									<option value="1976">1976</option>
									<option value="1977">1977</option>
									<option value="1978">1978</option>
									<option value="1979">1979</option>
									<option value="1980">1980</option>
									<option value="1981">1981</option>
									<option value="1982">1982</option>
									<option value="1983">1983</option>
									<option value="1984">1984</option>
									<option value="1985">1985</option>
									<option value="1986">1986</option>
									<option value="1987">1987</option>
									<option value="1988">1988</option>
									<option value="1989">1989</option>
									<option value="1990">1990</option>
									<option value="1991">1991</option>
									<option value="1992">1992</option>
									<option value="1993">1993</option>
									<option value="1994">1994</option>
									<option value="1995">1995</option>
									<option value="1996">1996</option>
									<option value="1997">1997</option>
									<option value="1998">1998</option>
									<option value="1999">1999</option>
									<option value="2000">2000</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
								</select>
								/
								<select name="birthMonth" title="월" class="form-control birthMonth" id="birthMonth">
									<option value="">월</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12" selected='selected'>12</option>
								</select>
								/
								<select name="birthDay" class="birthDay" id="birthDay">
									<option value="">일</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</div>
						</div>
					</li>
					<li id="email_ma">
						<label for="name">이메일</label>
						<div class="form-input">
							<div class="form-row">
								<input type="text" name="email" id="email" value="" class="form-control">
							</div>
							<div id="check_i">
								<input type="checkbox" name="" value="">
								<label>이메일 수신 동의</label>
							</div>

							<div class="msg-error" id="noticeEmail"></div>
						</div>
					</li>

					<li id="call">
						<label for="name">전화번호</label>
						<div class="form-input">
							<div class="form-select">
								<span class="form-phone">
									<select name="area_code" title="월" class="form-control" id="area_code">
											<option value="02">02</option>
											<option value="051">051</option>
											<option value="053">053</option>
											<option value="032">032</option>
											<option value="062">062</option>
											<option value="042">042</option>
											<option value="052">052</option>
											<option value="044">044</option>
											<option value="031">031</option>
											<option value="033">033</option>
											<option value="043">043</option>
											<option value="041">041</option>
											<option value="063">063</option>
											<option value="061">061</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="064">064</option>
									</select>
								</span>
								-
								<span class="form-phone1">
									<input type="text" name="h_phone1" class="form-control" id="h_phone1" value="" maxlength="4">
								</span>
								-
								<span class="form-phone1">
									<input type="text" name="h_phone2" class="form-control" id="h_phone2" value="" maxlength="4">
								</span>
							</div>
						</div>
					</li>
					<li id="call_num">
						<label for="name">휴대폰번호</label>
						<div class="form-input">
							<div class="form-select">
								<select name="phoneType" title="월" id="phoneType" class="form-phone">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								-
								<input type="text" name="phone1" id="phone1" type="text" maxlength="4" class="form-phone1">
								-
								<input type="text" name="phone2" id="phone2" type="text" maxlength="4" class="form-phone1">
							</div>
						</div>
					</li>

					<li id="ad">
						<label for="name">주소</label>
						<div class="form-input">
							<div>
								<input type="button" id="postaddress" value="우편번호">
								<input type="text" name="zipCode" id="zipCode" value="" class="">
							</div>
							<input type="text" name="address" id="address" value="" class="form-control imeKr">
						</div>
					</li>
				</ul>
				<div class="btn_info_update cr">
					<input type="button" alt="회원정보수정" value="수정하기" class="upd_btn">
				</div>
			</div>
		</div>

	</section>
	<footer>
		<jsp:include page="../../../inc/footer.jsp"></jsp:include>
	</footer>

</body>

</html>