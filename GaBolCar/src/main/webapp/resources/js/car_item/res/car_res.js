
// ========== 0621 경인 추가 ==========
// ajax 데이터 보내기 및 데이터 받기


function onClickAjax(obj) {
	console.log(obj);
	// json 안의 배열 car_type, car_fuel_type 같은 값은 json 통짜로 보낼때 배열로 
	// 제대로 보내지지않음
	//차선책으로 배열을 분리해 car_type1 ... 5 같은 방식으로 키 값을 정해서 보내기
	
	let count = 0;
	for(let car_type of obj["car_type"]){
		let str = "car_type" + count;
		obj[str] = car_type;
		count++;
	}
	count = 0;
	for(let car_fuel_type of obj["car_fuel_type"]){
		let str = "car_fuel_type" + count;
		obj[str] = car_fuel_type;
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
            console.log("error");
        }
    });
    
    return data.responseJSON;

}
 
// ajax 로 받아온 데이터 페이지에 적용
function addItems(carList){
	let resListUl = document.querySelector("res_list_ul");
	
	for(let car of carList){
		let li = document.createAttribute("li");
		
		let a = document.createAttribute("a");
		
		let	div1 = document.createAttribute("div");
		let img = document.createAttribute("img");
		let div2 = document.createAttribute("div");
		
	
		
	}
}



