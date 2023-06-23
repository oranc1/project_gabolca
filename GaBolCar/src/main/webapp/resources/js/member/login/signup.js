//이메일 유효성 검사
$(function(){
  const eAdress = document.getElementById("mem_id");
  const validateMessage = document.getElementById('emailError');

  eAdress.addEventListener("input", function() {
    const email = eAdress.value;
    if (validateEmail(email)) {
      validateMessage.textContent = '';
    } else {
      validateMessage.textContent = '메일 주소를 정확히 입력하세요.';
    }
  });
  
  function validateEmail(email) { // RFC 5322에 명시된 이메일 형태보다 더 강하게 유효성 여부 따져주는것같다
    const re = /([!#-'+/-9=?A-Z^-~-]+(.[!#-'+/-9=?A-Z^-~-]+)|"([]!#-[^-~ \t]|([\t -~]))+")@([!#-'+/-9=?A-Z^-~-]+(.[!#-'+/-9=?A-Z^-~-]+)|[[\t -Z^-~]*])+$/;
    const hasKorean = /[ㄱ-ㅎㅏ-ㅣ가-힣]/;
    return re.test(String(email).toLowerCase()) && !hasKorean.test(email);
  }
});

//이메일 중복확인 db등록후 재확인 필요 결고ㅏ값뜨는구역
function checkId(){
 var id = $('#mem_id').val(); //id값이 "id"인 입력란의 값을 저장
 $.ajax({
     url:'./idCheck', //Controller에서 요청 받을 주소
     type:'post', //POST 방식으로 전달
     data:{id:id},
     // 실제 count가 아니고 다른 형태의 data가 넘어오니, 구분을 위해 이름을 변경함
     success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
         const count = data;
         if(count !== 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
             //$('.id_already').css("display");  //,"inline-block" 추가 여부 확인해야함
             alert("이미 사용중인 이메일 입니다.");
             $('#mem_id').val('');
         }
     },
     error:function(){
         alert("에러입니다");
     }
 });
};

//비밀번호 유효성 검사
$(function(){
  const passWd = document.getElementById("mem_passwd");
  const validateMessage = document.getElementById('passwordError');

  passWd.addEventListener("input", function() {
    const pass = passWd.value;
    if (validateEmail(pass)) {
      validateMessage.textContent = '';
    } else {
      validateMessage.textContent = '영문,숫자,특수문자 포함 8~20글자 이상 입력 해주세요.';
    }
  });
  
  function validateEmail(pass) {
    const re = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
    return re.test(pass);
  }
});


//비밀번호 중복 확인검사 

function validatePassword() {
  var passwd = document.getElementById("mem_passwd").value;
  var repeatPasswd = document.getElementById("passwordCheck").value;
  var span = document.querySelector("#passwordCheckError");

  if (passwd != repeatPasswd) {
	span.innerHTML= '패스워드가 일치하지 않습니다.' 
   
    return false;
  }else{
	span.innerHTML= '' 
	
  return true;
}

}


//주소찾기 js
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}


// 휴대폰 번호 입력 부분
function changePhone1(){
    const phone1 = document.getElementById("phone1").value // 010
    if(phone1.length === 3){
        document.getElementById("phone2").focus();
    }
}

function changePhone2(){
    const phone2 = document.getElementById("phone2").value // 010
    if(phone2.length === 4){
        document.getElementById("phone3").focus();
    }
}

function changePhone3(){
    const phone3 = document.getElementById("phone3").value // 010
    if(phone3.length === 4){
      document.getElementById("sendMessage").focus();
      document.getElementById("sendMessage").setAttribute("style","background-color:#F0F0F0;")
      document.getElementById("sendMessage").disabled = false;
    }
    
}

function sendMsg(){
	var phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();
	 $.ajax({
     url:'./send-phone-authentication', //Controller에서 요청 받을 주소
     type:'post', //POST 방식으로 전달
     data:{phone:phone},
     // 실제 count가 아니고 다른 형태의 data가 넘어오니, 구분을 위해 이름을 변경함
     success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
         console.log("서버 응답 데이터:", data); // 디버깅용 로그 출력
        if (data.code === "error") {
          alert("휴대폰 번호가 올바르지 않습니다. \n유효한 번호를 입력해주세요.");
          $("#phone").attr("autofocus", true);
        } else {
          alert("인증번호가 전송되었습니다.");
          $("#cert").attr("disabled", false);
          $("#certifyCheck").attr("disabled", false);
          $("#phone1").attr("readonly", true);
          $("#phone2").attr("readonly", true);
          $("#phone3").attr("readonly", true);
         }
     },
     error:function(){
         alert("에러입니다");
     }
 });
}

function verifyCode(){
	var newCode = $("#cert").val()
	 $.ajax({
     url:'./verify-phone-authentication', //Controller에서 요청 받을 주소
     type:'post', //POST 방식으로 전달
     data:{newCode:newCode},
     // 실제 count가 아니고 다른 형태의 data가 넘어오니, 구분을 위해 이름을 변경함
     success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
   	  const isCorrectCode = data;	
   	  if(isCorrectCode == true){
         alert("인증되었습니다.");
		}else{
		alert("인증번호가 일치하지 않습니다.")
		}
     },
     error:function(){
         alert("에러입니다");
     }
 });	
}

//function initButton(){
//	const cert = document.getElementById("cert").value // 010
//	if(cert.length === 4){
//	  document.getElementById("certifyCheck").focus();
//	  document.getElementById("certifyCheck").setAttribute("style","background-color:#F0F0F0;")
//	  document.getElementById("certifyCheck").disabled = false;
//	}
//
//}

//휴대폰번호 인증번호 보내기 버튼 클릭 이벤트
//$(document).ready(function() {
//  var code2 = "";

//  $("#sendMessage").on("click", function() {
//	console.log("phoneChk 버튼 클릭"); // 디버깅용 로그 출력
//    alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
//    var phone = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();
//    $.ajax({
//      type: "POST",
//      url: "./send-phone-authentication",
//      data: JSON.stringify(phone),
//      contentType: 'application/json',
//      cache: false,
//      success: function(data) {
//			console.log("서버 응답 데이터:", data); // 디버깅용 로그 출력
//        if (data.code === "error") {
//          alert("휴대폰 번호가 올바르지 않습니다. \n유효한 번호를 입력해주세요.");
//          $("#phone").attr("autofocus", true);
//        } else {
//          $("#cert").attr("disabled", false);
//          $("#certifyCheck").attr("disabled", false);
//          $("#phone1").attr("readonly", true);
//          $("#phone2").attr("readonly", true);
//          $("#phone3").attr("readonly", true);
//          code2 = data.code;
          
//      	  console.log("받은 인증번호:", code2); // 디버깅용 로그 출력
//            }
//      }
//      error: function(xhr, status, error) {
//        console.log("에러 발생:", error); // 디버깅용 로그 출력
//      }
//    });
//  });

//  $("#certifyCheck").on("click", function() {
//	  var certValue = $("#cert").val(); // 변경: 변수로 인증번호 값 저장
//	  console.log("입력한 인증번호:", certValue); // 디버깅용 로그 출력
//	  
//	  if (certValue === code2) { // 변경: 변수와 code2 비교
//      alert("인증이 완료 되었습니다.");
//      $("#cert").attr("disabled", true);
//   	 } else {
//      alert("인증번호가 일치하지 않습니다. \n다시 확인해주시기 바랍니다.");
//      $("#cert").attr("autofocus", true);
//    }
//  });
//});

//var code2 = "";
//$("#phoneChk").on("click",function(){
//	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
//	var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
//	$.ajax({
//        type:"GET",
//        url:"send-one?phone=" + phone,
//        cache : false,
//        success:function(data){
//        	if(data == "error"){
//        		alert("휴대폰 번호가 올바르지 않습니다. \n유효한 번호를 입력해주세요.")
//				$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
//				$(".successPhoneChk").css("color","red");
//				$("#phone").attr("autofocus",true);
//        	}else{	        		
//        		$("#cert").attr("disabled",false);//인증번호 입력칸
//        		$("#phoneChk2").css("display","inline-block");
//        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
//        		$(".successPhoneChk").css("color","green");
//        		$("#phone1").attr("readonly",true);
//        		$("#phone2").attr("readonly",true);
//        		$("#phone3").attr("readonly",true);
//        		code2 = data;
//        	}
//        }
//    });
//});


//휴대폰 인증번호 대조

//$("#certifyCheck").on("click",function(){
//	if($("#cert").val() == code2){
//		alert("인증이 완료 되었습니다.")
//		$(".successPhoneChk").text("인증번호가 일치합니다.");
//		$(".successPhoneChk").css("color","green");
//		$("#phoneDoubleChk").val("true");
//		$("#cert").attr("disabled",true);
//	}else{
//		alert("인증번호가 일치하지 않습니다. \n다시 확인해주시기 바랍니다.")
//		$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
//		$(".successPhoneChk").css("color","red");
//		$("#phoneDoubleChk").val("false");
//		$("#cert").attr("autofocus",true);
//	}
//});


//$(function(){
//	$('#sendMessage').on("click",function(){
//		var to = $('input[name="phone1"]').val()+"-"+$('input[name="phone2"]').val()+"-"+$('input[name="phone3"]').val();
//		//이렇게 해도 되는지 존나 의문이다 
//		$.ajax({
//			url : "send-one",
//			type : "POST",
//			data : {"to": to},
//			dataType : "json",
//			success : function(data) {
//				console.log(data);
//				const checkNum = data;
//				alert('checkNum:'+ checkNum);
				
	            //인증하기 버튼 클릭 이벤트
//				$('#certifyCheck').click(function(){
//					const userNum = $('input[name="memberPhoneCertify"]').val();
//					if(checkNum == userNum){
//						alert('인증 성공하였습니다.');
//					}else {
//						alert('인증 실패하였습니다. 다시 입력해주세요.');
//					}
//				});
	            
//			},
//			error : function() {
//				alert("에러")
//			}
//		});
//	});
//})




// 문자인증+타이머 부분
//function initButton(){
//  document.getElementById("sendMessage").disabled = true;
//  document.getElementById("completion").disabled = true;
//  document.getElementById("certificationNumber").innerHTML = "000000";
//  document.getElementById("timeLimit").innerHTML = "03:00";
//  document.getElementById("sendMessage").setAttribute("style","background-color:none;")
//  document.getElementById("completion").setAttribute("style","background-color:none;")
//}
//
//let processID = -1;
//
//const getToken = () => {

  // 인증확인 버튼 활성화
//  document.getElementById("completion").setAttribute("style","background-color:#F0F0F0;")
//  document.getElementById("completion").disabled = false;
//
//  if (processID != -1) clearInterval(processID);
//  const token = String(Math.floor(Math.random() * 1000000)).padStart(6, "0");
//  document.getElementById("certificationNumber").innerText = token;
//  let time = 180;
//  processID = setInterval(function () {
//    if (time < 0 || document.getElementById("sendMessage").disabled) {
//      clearInterval(processID);
//      initButton();
//      return;
//    }
//    let mm = String(Math.floor(time / 60)).padStart(2, "0");
//    let ss = String(time % 60).padStart(2, "0");
//    let result = mm + ":" + ss;
//    document.getElementById("timeLimit").innerText = result;
//    time--;
//  }, 50);
//};
//
//function checkCompletion(){
//  alert("문자 인증이 완료되었습니다.")
//  initButton();
//  document.getElementById("completion").innerHTML="인증완료"
//  document.getElementById("signUpButton").disabled = false;
//  document.getElementById("signUpButton").setAttribute("style","background-color:yellow;")
//}


// 가입부분 체크

//function signUpCheck(){
//
//  let email = document.getElementById("id").value
//  let name = document.getElementById("name").value
//  let password = document.getElementById("password").value
//  let passwordCheck = document.getElementById("passwordCheck").value
//  let check = true;

  // 이메일확인
//  if(id.includes('@')){
//    let emailId = email.split('@')[0]
//    let emailServer = email.split('@')[1]
//    if(emailId === "" || emailServer === ""){
//      document.getElementById("emailError").innerHTML="이메일이 올바르지 않습니다."
//      check = false
//    }
//    else{
//      document.getElementById("emailError").innerHTML=""
//    }
//  }else{
//    document.getElementById("emailError").innerHTML="이메일이 올바르지 않습니다."
//    check = false
//  }


  // 이름확인
//  if(name==""){
//    document.getElementById("nameError").innerHTML="이름이 올바르지 않습니다."
//    check = false
//  }else{
//    document.getElementById("nameError").innerHTML=""
//  }


  // 비밀번호 확인
//  if(password !== passwordCheck){
//    document.getElementById("passwordError").innerHTML=""
//    document.getElementById("passwordCheckError").innerHTML="비밀번호가 동일하지 않습니다."
//    check = false
//  }else{
//    document.getElementById("passwordError").innerHTML=""
//    document.getElementById("passwordCheckError").innerHTML=""
//  }
//
//  if(password==""){
//    document.getElementById("passwordError").innerHTML="비밀번호를 입력해주세요."
//    check = false
//  }else{
//    //document.getElementById("passwordError").innerHTML=""
//  }
//  if(passwordCheck==""){
//    document.getElementById("passwordCheckError").innerHTML="비밀번호를 다시 입력해주세요."
//    check = false
//  }else{
    //document.getElementById("passwordCheckError").innerHTML=""
//  }
//
//
//  if(check){
//    document.getElementById("emailError").innerHTML=""
//    document.getElementById("nameError").innerHTML=""
//    document.getElementById("passwordError").innerHTML=""
//    document.getElementById("passwordCheckError").innerHTML=""
//    document.getElementById("areaError").innerHTML=""
//    document.getElementById("genderError").innerHTML=""
//    
    //비동기 처리이벤트
//    setTimeout(function() {
//      alert("가입이 완료되었습니다.")
//  },0);
//  }
//}