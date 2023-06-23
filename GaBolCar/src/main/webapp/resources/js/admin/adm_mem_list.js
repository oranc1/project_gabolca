let pageNum = 1;

$(function() {
	// 스크롤 바
	$(window).scroll(function() {
		let scrollTop = $(window).scrollTop();
		let windowHeight = $(window).height();
		let documentHeight = $(document).height();
		if (scrollTop + windowHeight + 1 >= documentHeight) {
			pageNum++;
			memAjax(requestUrl);
		}
	})

	// 회원리스트 조회 func
	function memAjax(requestUrl) {
		$.ajax({
			type: "GET",
			url: requestUrl,
			data: {
				'admin': '',
				'pageNum': pageNum
			},
			dataType: "json"
		})
		.done(function(memList){
			doneResult(memList);
		})
		.fail(function(){
			failResult();
		});
	};

	// ajax 성공 함수
	function doneResult(memList) {
		$(".mem_content").remove();
		for (let mem of memList) {
		let result =
			"<tr class=mem_content>"
			+ "<td>" + mem.mem_idx + "</td>"
			+ "<td>" + mem.mem_id + "</td>"
			+ "<td>" + mem.mem_name + "</td>"	
			+ "<td>" + mem.mem_sign_date + "</td></tr>";					
		$("#adm_mem_list").append(result);
		}			
	}

	// ajax 실패 함수
	function failResult() {
		$("#adm_mem_list").empty().append("<tr><td colspan='9'><h3>요청 실패!</h3></td></tr>")
	}	

	// 회원리스트 조회 func 호출
	memAjax("memList.ajax");	


	// 버튼 기능부여
	$("button[name=item_search]").on("click", function() {
		carAjax("carList.ajax?search_type="+$("#search_cate").val()+"&search_keyword="+$("#search_box").val());
	});


});