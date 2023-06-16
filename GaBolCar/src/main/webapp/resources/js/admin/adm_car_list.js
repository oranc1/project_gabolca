

$(function() {
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
	
	
	$("button[name=item_search]").on("click", function() {
		$.ajax({
			type: "GET",
			url: "carList.ajax?search_type="+$("#search_cate").val()+"&search_keyword="+$("#search_box").val(),
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
		})
	
	});
	$("button[name=item_update]").on("click", function() {
		location.href="carUpdate?car_idx="+$(this).val();
	});
		
	$("button[name=item_delete]").on("click", function() {
		if (confirm("삭제하시겠습니까?")) location.href="carDeletePro?car_idx="+$(this).val() 
	});
	
	$("button[name=item_insert]").on("click", function() {
		location.href="CarRegister";
	});
	
	$("button[name=option_list]").on("click", function() {
		location.href="optionList";
	});
	
	$("button[name=car_type]").on("click", function() {
		console.log($(this).val());
	});
	
	// 차종 선택시 체크박스 및 라벨 변경
	$("#adm_car_top > label").on("click", function() {
		$(this).addClass("on");
		if ($(this).children().is(":checked")) {
			$(this).css({
				"background": "rgb(28, 28, 80)",
				"color": "#fff"
			});
			
			$.ajax({
				type: "GET",
				url: "carList.ajax?search_type="+$(this).children().val(),
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
		})
			
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
	
});