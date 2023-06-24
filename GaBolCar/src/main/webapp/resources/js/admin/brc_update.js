
$(function(){
	const width = 504;
	const height = 443;
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let tops = (document.body.offsetHeight / 2) - (height / 2);
	left += window.screenLeft;
	let geocoder = new kakao.maps.services.Geocoder();
	$("#address").on("click focus",function(){
	    new daum.Postcode({
			width: width,
			height: height,
	        oncomplete: function(data) {
	            $("#address").val(data.address);
	            $("#address").prop("readonly",true);
	            $("input[name=place]").val(data.sido);
	            var juso =  $("#address").val();
	        	geocoder.addressSearch(juso, callback);  
	        }
	    }).open({
			left: left,
			top: tops,
			popupKey: 'brcJuso',
			popupTitle: '지점등록 주소검색'
		});
		
		$("input[name=brc_addrDetail]").focus();
	});
	
    let callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			$("input[name=map_x]").val(result[0].x);
			$("input[name=map_y]").val(result[0].y);
		}
	};
	
	// submit 색상변경, 클릭이벤트
	$("#submitBtn").css({
		"background" : "rgb(255, 94, 0)",
		"color" : "#FFFFFF"
	}).on("click",function() {
		if($("#address").val()!="" && $("input[name=brc_name]").val()!="" && $("input[name=brc_tel]").val() !="") {
			$("form").submit
		}
	});
	
	$("#closeBtn").on("click", function() {
		window.close();
	});
	
	let brcNmChk = $("input[name=brc_name]").val();
	$("input[name=brc_name]").on("blur",function() {
		if (brcNmChk != $(this).val() && $(this).val() != '') {
			$.ajax({
				type: "get",
				url: "brcCheckRdndn",
				data: {
					'brc_name': $(this).val()
				}
			}).done(function(result) {
				if (result == '1') {
					$("input[name=brc_name]").attr("placeholder",$("input[name=brc_name]").val()+"은 등록되어있는 지점명입니다.");
					$("input[name=brc_name]").val('').focus();
				}
			});
		};
	});
	
	$("input[type=reset]").on("click",function(){
		location.reload();
	});
	
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