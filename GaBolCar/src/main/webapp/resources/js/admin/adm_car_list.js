let pageNum = 1;
let chk_type = '';
let search_type = '';
let search_keyword = '';

$(function() {
	carAjax();
	
	// 차량리스트 조회
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
			if (carList.length > 1) {
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
		// 이전 데이터 삭제
		$(".car_content").remove();
		$("#pageList").empty();
		
		// pageInfo 꺼내오기
		let pageInfo = carList.pop();
		
		// 검색데이터 반복문 저장 및 출력
		for (let item of carList) {
			let result =
				"<tr class=car_content>"
				+ "<td>" + item.car_idx + "</td>"
				+ "<td>" + item.car_company + "</td>"
				+ "<td>" + item.car_model + "</td>"
				+ "<td>" + item.car_type + "</td>"
				+ "<td>" + item.car_old + "</td>"
				+ "<td>" + item.brc_name + "</td>"
				+ "<td>" + item.option_name + "</td>"
				+ "<td>" + item.car_status + "</td>"
				+ "<td><button name=item_update class=adm_car_button value=" + item.car_idx +">수정</button></td>"
				+ "<td><button name=item_delete class=adm_car_button value=" + item.car_idx +">삭제</button></td></tr>";
			$("#adm_car_list").append(result);
		}
		
//		console.log("pageInfo.listCount : " + pageInfo.listCount);
//		console.log("pageInfo.pageListLimit : " + pageInfo.pageListLimit);
//		console.log("pageInfo.maxPage : " + pageInfo.maxPage);
//		console.log("pageInfo.startPage : " + pageInfo.startPage);
//		console.log("pageInfo.endPage : " + pageInfo.endPage);
//		console.log("pageInfo.pageNum : " + pageInfo.pageNum);
//		console.log("pageNum : " + pageNum);

		// 버튼 출력태그 저장
		let page = '';
		
		// 이전 버튼 판별
		if(pageNum > 1) {
			page += "<input type='button' id='prvsPage'class='adm_car_button' value='이전'>";	
		}
		
		// 페이지목록 생성
		for (let i=pageInfo.startPage; i<= pageInfo.endPage; i++) {
			if (pageNum == i) {
				page += "<span class='pageMove'><input type='hidden' value='"+i+"'><b>"+i+"</b></span>";
			} else {
				page += "<span class='pageMove'><input type='hidden' value='"+i+"'>"+i+"</span>";
			}
		}
		
		// 다음 버튼 판별
		if(pageNum < pageInfo.maxPage) {
			page += "<input type='button' id='nextPage' class='adm_car_button' value='다음'>";
		}
		
		// 저장된 태그 출력
		$("#pageList").append(page)
		
		// 수정버튼 클릭이벤트
		$("button[name=item_update]").on("click", function() {
			location.href="carUpdate?car_idx="+$(this).val();
		});
		
		// 삭제버튼 클릭이벤트
		$("button[name=item_delete]").on("click", function() {
			if (confirm("삭제하시겠습니까?")) location.href="carDeletePro?car_idx="+$(this).val() 
		});
		
		// 페이지 다음버튼 클릭이벤트
	    $("#nextPage").on("click",function() {
	        if (pageNum > 0) {
	            pageNum++; 
	            carAjax();    
	        }
	    });
    	
    	// 페이지 이전버튼 클릭이벤트
		$("#prvsPage").on("click",function() {
	        if (pageNum > 1) {
	            pageNum--; 
	            carAjax();    
	        }
	    });
	    
	    // 페이지목록 클릭이벤트
	    $(".pageMove").on("click",function() {
			pageNum = $(this).children().val();
			carAjax();
		})
	}
	
	// ajax 실패 함수
	function failResult() {
		$(".car_content").remove();
		$("#adm_car_list").append("<tr class=car_content><th colspan='9'><h3>요청 실패</h3></th></tr>")
	}	
	// ajax 검색 결과가 없을경우
	function noSearchResult() {
		$(".car_content").remove();
		$("#adm_car_list").append("<tr class=car_content><th colspan='9'><h3>검색 결과가 없습니다.</h3></th></tr>")
	}	
	
    // 해당태그 클릭시 차종 데이터 출력 및 색상 변경
    $(".cts").on("click", function() {
		if ($(this).children().hasClass("on") && $(this).parent().hasClass("active")) {
			$(".on").parent().css({"background": "#fff","color": "#000"});
			$(this).parent().removeClass("active");
			$(this).children().removeClass("on");
			chk_type = '';
		} else if (!$(this).children().hasClass("on") && $(this).parent().hasClass("active")) {
			$(".on").parent().css({"background": "#fff","color": "#000"});
			$(".on").removeClass("on");
			$(this).css({"background": "rgb(28, 28, 80)","color": "#fff"});
			$(this).children().addClass("on");
			chk_type = $(this).children().val();
		} else {
			$(this).css({"background": "rgb(28, 28, 80)","color": "#fff"});
			$(this).children().addClass("on");
			$(this).parent().addClass("active");
			chk_type = $(this).children().val();
		}
		
		pageNum = 1;
        carAjax();
	});
	
	// 검색 클릭이벤트
	$("button[name=item_search]").on("click", function() {
		pageNum = 1;
		carAjax();
	});
	
	// 차량등록 클릭이벤트
	$("button[name=item_insert]").on("click", function() {
		location.href="CarRegister";
	});
	
	// 옵션리스트 클릭이벤트
	$("button[name=option_list]").on("click", function() {
		location.href="optionList";
	});
	
});