
// ========== 0621 경인 추가 ==========
// ajax 데이터 보내기 및 데이터 받기


function carListAdd(resReq) {
	if (resReq.status === 200) {

		console.log(resReq.response);
	}
}




function onClickAjax(obj) {
	console.log(obj);
	// json 안의 배열 car_type, car_fuel_type 같은 값은 json 통짜로 보낼때 배열로 
	// 제대로 보내지지않음
	//차선책으로 배열을 분리해 car_type1 ... 5 같은 방식으로 키 값을 정해서 보내기
	
	let count = 0;
	for(let car_type of obj["car_fuel_type"]){
		let str = "car_fuel_type" + count;
		obj[str] = car_type;
		count++;
	}
	count = 0;
	for(let car_type of obj["car_fuel_type"]){
		let str = "car_fuel_type" + count;
		obj[str] = car_type;
		count++;
	}
	
	let data =  $.ajax({
        url: "carResListLoad.ajax",
        type: "post",
        data: obj,
        dataType: "json",
        async: false,
        error: function(errorThrown) {
            console.log(errorThrown.statusText);
        }
    });

	console.log(data);
//	// ajax 이용을 위한 객체 생성
//	const resReq = new XMLHttpRequest();
//
//	// 요청방식, 주소, 비동기여부 설정
//	resReq.open("post", "carResListLoad.ajax", true);
//
//	// http 요청 헤더 설정 및 보낼 데이터 타입 설정 
//	resReq.setRequestHeader("Content-type", "application/text");
//	
//	console.log(typeof(JSON.stringify(obj)));
//
//	// 요청전송
//	resReq.send(obj);
//	// 비동기 정보 받을시 작업 
//	resReq.onload = function () {
//		if (resReq.status === 200) {
//		console.log(resReq.response);
//		}
//	}
}
 