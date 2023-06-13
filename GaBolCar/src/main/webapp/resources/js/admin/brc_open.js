
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
	
	$("input[type=submit]").on("click", function() {
		$("form").submit();
		opener.location.reload();
		setTimeout(() => window.open("about:blank","_self"), 100);
	});
	
});