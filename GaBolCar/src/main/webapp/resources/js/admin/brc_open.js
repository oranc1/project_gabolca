
$(function(){
	let geocoder = new kakao.maps.services.Geocoder();
	$("#address").on("click",function(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            $("#address").val(data.address);
	            $("#address").prop("readonly",true);
	            $("input[name=place]").val(data.sido);
	            var juso =  $("#address").val();
	        	geocoder.addressSearch(juso, callback);  
	        }
	    }).open()
	});
	
    let callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			$("input[name=map_x]").val(result[0].x);
			$("input[name=map_y]").val(result[0].y);
		}
	};
	
	// submit 창이동 및 지연
	$("#submitBtn").on("click",function() {
		if($("#address").val()!="" && $("input[name=brc_name]").val()!="" && $("input[name=brc_tel]").val() !="") {
			$("form").submit
	        setTimeout(() => window.open("about:blank","_self"), 100);
		}
	});
	
	// submit 버튼 색상
	$("#submitBtn").css({
		"background" : "rgb(255, 94, 0)",
		"color" : "#FFFFFF"
	})
    
	$("#closeBtn").on("click", function() {
		window.close();
	})
	
	$("input[name=brc_tel]").on("change",function() {
		let brcTel = $(this).val();
		const regTel = /\d{2,3}-\d{3,4}-\d{4}/g;
		if (!regTel.test(brcTel) && brcTel.length >= 1) {
			$(this).val('').focus();
			$(this).attr("placeholder","전화번호 형식에 맞지 않습니다.")
			
		}
	})
	
	$("input[name=brc_name]").on("change",function() {
		let brcName = $(this).val();
		const regStr = /[^가-힣\w\s]/g;
		if (regStr.test(brcName) && brcName.length >= 1) {
			$(this).val('').focus();
			$(this).attr("placeholder","한글 또는 영문 숫자만 사용 가능합니다.")
			
		}
	})
	
});