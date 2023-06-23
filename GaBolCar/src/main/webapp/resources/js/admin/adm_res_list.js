let pageNum = 1;

$(function() {
	// 스크롤 바
	$(window).scroll(function() {
		let scrollTop = $(window).scrollTop();
		let windowHeight = $(window).height();
		let documentHeight = $(document).height();
		if (scrollTop + windowHeight + 1 >= documentHeight) {
			pageNum++;
			resAjax(requestUrl);
		}
	})

	// 차량리스트 조회 func
	function resAjax(requestUrl) {
		$.ajax({
			type: "GET",
			url: requestUrl,
			data: {
				'admin': '',
				'pageNum': pageNum
			},
			dataType: "json"
		})
		.done(function(resList){
			doneResult(resList);
		})
		.fail(function(){
			failResult();
		});
	};

	// ajax 성공 함수
	function doneResult(resList) {
		$(".res_content").remove();
		for (let res of resList) {
		let result =
			"<tr class=res_content>"
			+ "<td>" + res.res_idx + "</td>"
			+ "<td>" + res.res_time + "</td>"
			+ "<td>" + res.car_idx + "</td>"
			+ "<td>" + res.mem_idx + "</td>"
			+ "<td>" + res.res_rental_date + "</td>"
			+ "<td>" + res.res_return_date + "</td></tr>";			
		$("#adm_res_list").append(result);
		}			
	}

	// ajax 실패 함수
	function failResult() {
		$("#adm_res_list").empty().append("<tr><td colspan='9'><h3>요청 실패!</h3></td></tr>")
	}	

	// 예약리스트 조회 func 호출
	resAjax("resList.ajax");	


	// 버튼 기능부여
	$("button[name=item_search]").on("click", function() {
		carAjax("carList.ajax?search_type="+$("#search_cate").val()+"&search_keyword="+$("#search_box").val());
	});

});