
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
    
    $("#resetBtn").on("click", function() {
		location.reload();
	});
	
	$("#closeBtn").on("click", function() {
		window.close();
	})
	
	
});