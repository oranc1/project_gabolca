// select 값 검색창 name명 전달
$(function() {
	$("#search_cate").on("change", function() {
		$("#search_text").attr("name",$(this).val());
	});
	
	$("button[name=item_update]").on("click", function() {
		location.href="carUpdate?car_idx="+$(this).val();
	});
	
	$("button[name=item_delete]").on("click", function() {
		if (confirm("삭제하시겠습니까?")) location.href="carDeletePro?car_idx="+$(this).val() 
	});
	
	$("button[name=item_insert]").on("click", function() {
		console.log("insert");
		location.href="CarRegister";
	});
	
	$("button[name=item_search]").on("click", function() {
		location.href="";
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
	
//	$("label[name=car_type").hover(function(){
//		$(this).css({
//			"color":"#ff6600",
//			"transition": "0.1s"
//		});
//		
//	$(".adm_car_button").hover(function(){
//		$(this).css({
//			"color":"#ff6600",
//			"transition": "0.1s"
//		});
//      
//	});
	
});

