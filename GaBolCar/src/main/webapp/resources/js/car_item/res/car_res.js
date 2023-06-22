
// ========== 0621 경인 추가 ==========
// ajax 데이터 보내기 및 데이터 받기


function carListAdd(resReq) {
	if (resReq.status === 200) {

		console.log(resReq.response);
	}
}




function onClickAjax(obj) {

//	  $.ajax({
//        url: "carResListLoad.ajax",
//        type: "post",
//        data: JSON.stringify(obj),
//        dataType: "json",
//        async: false,
//        error: function(errorThrown) {
//            console.log(errorThrown.statusText);
//        }
//    });

	// ajax 이용을 위한 객체 생성
	const resReq = new XMLHttpRequest();

	// 요청방식, 주소, 비동기여부 설정
	resReq.open("post", "carResListLoad.ajax", true);

	// http 요청 헤더 설정 및 보낼 데이터 타입 설정 
	resReq.setRequestHeader("Content-type", "application/text");
	
	console.log(typeof(JSON.stringify(obj)));

	// 요청전송
	resReq.send(obj);
	// 비동기 정보 받을시 작업 
	resReq.onload = function () {
		if (resReq.status === 200) {
		console.log(resReq.response);
		}
	}
}
 