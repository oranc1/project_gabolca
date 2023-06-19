// ajax 성공 함수
function doneResult(carList) {
	$(".car_content").remove();
	for (let car of carList) {
	let result =
		"<tr class=car_content>"
		+ "<td>" + car.car_idx + "</td>"
		+ "<td>" + car.car_company + "</td>"
		+ "<td>" + car.car_model + "</td>"
		+ "<td>" + car.car_type + "</td>"
		+ "<td>" + car.car_old + "</td>"
		+ "<td>" + car.brc_name + "</td>"
		+ "<td>" + car.option_name + "</td>"
		+ "<td>" + car.car_status + "</td>"
		+ "<td><button name=item_update class=adm_car_button value=" + car.car_idx +">수정</button></td>"
		+ "<td><button name=item_delete class=adm_car_button value=" + car.car_idx +">삭제</button></td></tr>";
	$("#adm_car_list").append(result);
	}
	
	$("button[name=item_update]").on("click", function() {
		location.href="carUpdate?car_idx="+$(this).val();
	});
	
	$("button[name=item_delete]").on("click", function() {
		if (confirm("삭제하시겠습니까?")) location.href="carDeletePro?car_idx="+$(this).val() 
	});
}

// ajax 실패 함수
function failResult() {
	$("#adm_car_list").empty().append("<tr><td colspan='9'><h3>요청 실패!</h3></td></tr>")
}	

// 차량리스트 조회 func 호출
carAjax("carList.ajax");

// 차량리스트 조회 func
function carAjax(requestUrl) {
	if (requestUrl.indexOf('?') > 0) {
		requestUrl += "&admin=";
	} else {
		requestUrl += "?admin=";
	}
	
	$.ajax({
		type: "GET",
		url: requestUrl,
		dataType: "json"
	})
	.done(function(carList){
		doneResult(carList);
	})
	.fail(function(){
		failResult();
	});
};



$(function() {
        // 차종 선택시 체크박스 및 라벨 변경
    $("#adm_car_top > label").on("click", function() {
        $(this).addClass("on");
        if ($(this).children().is(":checked")) {
            $(this).css({
                "background": "rgb(28, 28, 80)",
                "color": "#fff"
            });
            carAjax("carList.ajax?search_type="+$(this).children().val());
                    
            $(this).children().attr("checked",true);
            $(this).removeClass("on");
        } else {
            $(this).css({
                "background": "#fff",
                "color": "#000"
            });
            $(this).children().attr("checked",false);
        }
	});
	// 버튼 기능부여
	$("button[name=item_search]").on("click", function() {
		carAjax("carList.ajax?search_type="+$("#search_cate").val()+"&search_keyword="+$("#search_box").val());
	});
	
	$("button[name=item_insert]").on("click", function() {
		location.href="CarRegister";
	});
	
	$("button[name=option_list]").on("click", function() {
		location.href="optionList";
	});
	
});