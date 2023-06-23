
// ========== 0621 경인 추가 ==========
// ajax 데이터 보내기 및 데이터 받기


function onClickAjax(obj) {
	
	let checkError = false;
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
            checkError = true;
        }
    });
    if(!checkError){
		addItems(data.responseJSON);	
	}
    
    return data.responseJSON;

}
 
// ajax 로 받아온 데이터 페이지에 적용
function addItems(dataObj){
	let resListUl = document.querySelector(".res_list_ul");
	let resLoadBtn = document.querySelector(".res_load_btn");
    let carList = dataObj.car_search_list;
    //json 받아서 페이지에 맞춰서 출력시키도록 하기
	for(let car of carList){
		let li = document.createElement("li");
		
		let li_a = document.createElement("a");
		
		let	div1 = document.createElement("div");
		let div1_img = document.createElement("img");
		
		let div2 = document.createElement("div");
		let div2_h4 = document.createElement("h4");
		let div2_p1 = document.createElement("p");
		let div2_p2 = document.createElement("p");
		let p2_span1 = document.createElement("span");
		let p2_span2 = document.createElement("span");
		
		let p = document.createElement("p")
		

        li_a.setAttribute("href","carRes/carResInfo?car_idx=" + car.car_idx_list.split(",")[0]
         + "&res_rental_date=" + dataObj.res_rental_date 
         + "&res_return_date=" + dataObj.res_return_date 
         + "&brc_rent_name=" + dataObj.brc_rent_name
         + "&brc_return_name=" + dataObj.brc_return_name);

        div1.setAttribute("class","res_list_img");

        div1_img.setAttribute("src" ,contextPath + "/resources/upload/car/" + car.car_file_path + "/" + car.car_file1 );
        div1_img.setAttribute("alt", car.car_model);

        div2.setAttribute("class","res_list_text");
        div2_h4.innerText = car.car_model + "(" + car.car_company + ")";
        
        div2_p1.setAttribute("class", "car_info_p");
        div2_p1.innerText = car.car_old + "년식 / " + car.car_shift_type + " / " + car.car_riding + "인승 / " + car.car_fuel_type + "/ 만 " + car.car_age + "세 이상";

        div2_p2.setAttribute("class", "car_amount_p");
        
        p2_span1.innerText = "최저가 ";
        p2_span2.innerHTML = "<b>" + car.car_weekdays + "</b>원";

        p.setAttribute("class","res_btn");
        p.innerText = "예약 하러가기";

        //html 합치기
        div2_p2.appendChild(p2_span1);
        div2_p2.appendChild(p2_span2);
        
        div1.appendChild(div1_img);

        div2.appendChild(div2_h4);
        div2.appendChild(div2_p1);
        div2.appendChild(div2_p2);

        li_a.appendChild(div1);
        li_a.appendChild(div2);
        li_a.appendChild(p);

        li.appendChild(li_a);

        // 마지막으로 페이지에 넣을 구역에 해당 태그들을 추가
        resListUl.appendChild(li);
        
	}
	
	// 만약 마지막 리스트까지 검색했으면 더보기 버튼을 지우기
	if(dataObj.nowPage == dataObj.maxPage){	
		resLoadBtn.setAttribute("style","display:none")	
	}
}



