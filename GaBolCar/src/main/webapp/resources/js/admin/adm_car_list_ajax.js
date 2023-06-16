$.ajax({
	type: "GET",
	url: "carList.ajax",
	dataType: "json"
})
.done(function(carList) {
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
		+ "<td>" + "출력될 옵션" + "</td>"
		+ "<td>" + car.car_status + "</td>"
		+ "<td><button name=item_update class=adm_car_button value=" + car.car_idx +">수정</button></td>"
		+ "<td><button name=item_delete class=adm_car_button value=" + car.car_idx +">삭제</button></td></tr>";
	$("#adm_car_list").append(result);
	}
})
.fail(function() {
	$("#adm_car_list").empty().append("<tr><td colspan='9'><h3>요청 실패!</h3></td></tr>")
});