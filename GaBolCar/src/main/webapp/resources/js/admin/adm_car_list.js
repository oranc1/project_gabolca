let pageNum = 1;
let chk_type = '';
let search_type = '';
let search_keyword = '';

$(function() {
	carAjax();
	
	$("#nextPage").on("click",function() {
		if (pageNum > 0) {
			pageNum++; 
			carAjax();	
		}
	})
	
	$("#prvsPage").on("click",function() {
		if (pageNum > 1) {
			pageNum--; 
			carAjax();	
		}
	})
	// 스크롤 바
//	$(window).scroll(function() {
//		let scrollTop = $(window).scrollTop();
//		let windowHeight = $(window).height();
//		let documentHeight = $(document).height();
//		if (scrollTop + windowHeight + 1 >= documentHeight) {
//			pageNum++;
//			carAjax();
//		}
//	})
	
	// 차량리스트 조회 func
	function carAjax() {
		$("#nowPage").empty().html("<b>"+pageNum+"</b>");
		search_type = $("#search_cate").val();
		search_keyword = $("#search_box").val();
		
		$.ajax({
			type: "GET",
			url: "carList.ajax",
			data: {
				'admin': '',
				'pageNum': pageNum,
				'chk_type': chk_type,
				'search_type': search_type,
				'search_keyword': search_keyword
			},
			dataType: "json"
		})
		.done(function(carList){
			if (carList.length > 0) {
				doneResult(carList);
			} else {
				noSearchResult();
			}
		})
		.fail(function(){
			failResult();
		});
	};
	
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
		$(".car_content").remove();
		$("#adm_car_list").append("<tr class=car_content><th colspan='9'><h3>요청 실패</h3></th></tr>")
	}	
	// 검색 결과가 없을경우
	function noSearchResult() {
		$(".car_content").remove();
		$("#adm_car_list").append("<tr class=car_content><th colspan='9'><h3>검색 결과가 없습니다.</h3></th></tr>")
	}	
	
    // 차종 선택시 체크박스 및 라벨 변경
    $("#adm_car_top > label").on("click", function() {
//		$(this).addClass("on");
//		$(this).removeClass("on");
        if ($(this).children().is(":checked")) {
			$("#adm_car_top label").css({"background": "#fff","color": "#000"})                    
           $("input[type=checkbox]").prop('checked',false);
            $(this).css({
                "background": "rgb(28, 28, 80)",
                "color": "#fff"
            });
			$(this).children().prop('checked',true);
			pageNum = 1;
            chk_type = $(this).children().val();
            carAjax();
        } else {
//			$(this).removeClass("on");
            $(this).css({
                "background": "#fff",
                "color": "#000"
            });
            $(this).children().prop('checked',false);
			pageNum = 1;
            chk_type = '';
            carAjax();
        }
	});
	
	// 버튼 기능부여
	$("button[name=item_search]").on("click", function() {
		pageNum = 1;
		carAjax();
	});
	
	$("button[name=item_insert]").on("click", function() {
		location.href="CarRegister";
	});
	
	$("button[name=option_list]").on("click", function() {
		location.href="optionList";
	});
	
});