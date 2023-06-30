
$(function(){
	// 팝업창 크기 조절
	const width = 504;
	const height = 443;
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let tops = (document.body.offsetHeight / 2) - (height / 2);
	left += window.screenLeft;
	let geocoder = new kakao.maps.services.Geocoder();
	// 주소창 클릭이나 포커스가 될경우 실행
	$("#address").on("click focus",function(){
	    new daum.Postcode({
			width: width,
			height: height,
	        oncomplete: function(data) {
	            $("#address").val(data.address); // 주소값 저장
	            $("#address").prop("readonly",true); // 주소값 읽기전용 변경
//	            $("input[name=place]").val(data.sido); // 시,도 값 저장
	            var juso =  $("#address").val();
	        	geocoder.addressSearch(juso, callback); //위경도 변환 메서드호출
	        }
	    }).open({
			left: left,
			top: tops,
			popupKey: 'brcJuso',
			popupTitle: '지점등록 주소검색'
		});
		
		$("input[name=brc_addrDetail]").focus(); // 입력완료후 상세주소로 포커스 이동
	});
	
    let callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			$("input[name=map_x]").val(result[0].x);
			$("input[name=map_y]").val(result[0].y);
		}
	};
	
	let isChecked = false;
	// submit버튼 색상변경 및 클릭
	$("#submitBtn").css({
		"background" : "rgb(255, 94, 0)",
		"color" : "#FFFFFF"
	}).on("click",function() {
		if($("#address").val()!="" && $("input[name=brc_name]").val()!="" && $("input[name=brc_tel]").val() !="") {
			if(isChecked) $("form").submit;
		}
	});
	
	// 닫기 버튼
	$("#closeBtn").on("click", function() {
		window.close();
	})
	
	// 기존지점명 중복검사
	$("input[name=brc_name]").on("blur",function() {
		let brcName = $(this).val();
		if (brcName != '') {
			$.ajax({
				type: "get",
				url: "brcCheckRdndn",
				data: {
					'brc_name': $(this).val()
				}
			}).done(function(result) {
				if (result == '1') {
					$("input[name=brc_name]").attr("placeholder",brcName+"은 중복되는 지점명입니다.");
					$("input[name=brc_name]").val('').focus();
				} else {
					isChecked = true;
				}
			});
		}
	});
	
	$("input[type=reset]").on("click",function(){
		location.reload();
	});
	
    $("input[name=brc_tel]").on("change",function() {
		let brcTel = $(this).val();
        const regExp = new RegExp(/^\d{2,3}-^\d{3,4}-^\d{4}/g);
        if( brcTel.replace(regExp, "").length != 0 ) {                
            if( checkPhoneNumber(brcTel) == true ) {
                let number = brcTel.replace( /[^0-9]/g, "" );
                let tel = "";
                let seoul = 0;
                $(this).attr("maxlength", "13");
                if( number.substring( 0, 2 ).indexOf( "02" ) == 0 ) {
                    seoul = 1;
                    $(this).attr("maxlength", "12");
                } 
                
                if( number.length < ( 4 - seoul) ) {
                    return number;
                } else if( number.length < ( 7 - seoul ) ) {
                    tel += number.substr( 0, (3 - seoul ) );
                    tel += "-";
                    tel += number.substr( 3 - seoul );
                } else if(number.length < ( 11 - seoul ) ) {
                    tel += number.substr( 0, ( 3 - seoul ) );
                    tel += "-";
                    tel += number.substr( ( 3 - seoul ), 3 );
                    tel += "-";
                    tel += number.substr( 6 - seoul );
                } else {
                    tel += number.substr( 0, ( 3 - seoul ) );
                    tel += "-";
                    tel += number.substr( ( 3 - seoul), 4 );
                    tel += "-";
                    tel += number.substr( 7 - seoul );
                }
                $(this).val(tel);
            } else {
                const regExp = new RegExp( /[^0-9|^-]*$/ );
                $(this).val(brcTel.replace(regExp, ""));
            }
        }
    });

    function checkPhoneNumber( number ) {
        const regExp = new RegExp( /^[0-9|-]*$/ );
        if( regExp.test( number ) == true ) { return true; }
        else { return false; }
    }
	
	
	$("input[name=brc_name]").on("change",function() {
		let brcName = $(this).val();
		const regStr = /[^가-힣\w\s]/g;
		if (regStr.test(brcName) && brcName.length >= 1) {
			$(this).val('').focus();
			$(this).attr("placeholder","한글 또는 영문 숫자만 사용 가능합니다.")
			
		}
	})
	
});