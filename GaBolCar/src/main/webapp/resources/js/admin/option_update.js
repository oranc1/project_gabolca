$(function(){
	// 옵션명 중복여부
	let isChecked = false;	
	// 전송버튼 색상 변경 및 클릭 - submit
	$("#submitBtn").css({
		"background" : "rgb(255, 94, 0)",
		"color" : "#FFFFFF"
	}).on("click",function() {
		if($("input[name=option_name]").val() != '' && $("input[name=option_image]").val() != '') {
			if (isChecked) {
				$("form").submit();
			}
		}
	});
	
	// 기존 옵션명 저장
	let optionNmChk = $("input[name=option_name]").val();
	
	// 옵션명에서 포커스가 옮겨질때 실행 
	$("input[name=option_name]").on("blur",function() {
		if (optionNmChk != $(this).val() && $(this).val() != '') {
			$.ajax({
				type: "get",
				url: "optCheckRdndn",
				data: {
					'option_name': $(this).val()
				}
			}).done(function(result) {
				if (result == '1') { // 중복레코드값수; 1 = 중복
					$("input[name=option_name]").attr("placeholder",$("input[name=option_name]").val()+"은 중복되는 옵션명입니다.");
					$("input[name=option_name]").val('').focus();
				} else { // 중복이 아닐경우
					isChecked = true; // 옵션명 중복여부 true로 변경
				}
			});
		}
	});
	
	// 초기화 버튼
	$("input[type=reset]").on("click",function(){
		location.reload();
	});
    
    // 닫기 버튼
	$("#closeBtn").on("click", function() {
		window.close();
	});
    
    // 파일등록 태그 생성
    $("#imageDelete").on("click",function() {
		$("#opth_1").empty().html("<td class='td_left' id='opth_1'><label for='option_image'>옵션 이미지</label></td>");
		$("#opth_2").empty().html("<td class='td_right' id='opth_1'><input type='file' accept='image/*' name='option_image' required='required' class='form-control'/></td>");
		
		// 파일 변경시 확장자 및 용량 제한
		$("input[type=file]").on("change",function() {
			let file_val = $(this).val()
			const reg = /(.*?)\.(xbm|tif|jfif|ico|tiff|gif|svg|jpeg|svgz|jpg|webp|png|bmp|pjp|apng|pjeg|avif|jpg)$/; // 제한 확장자
			let fileSize = $(this)[0].files[0].size;
			const maxSize = 1024 * 1024 * 5; // 용량 제한
			// 파일 확장자 제한
			if (file_val != "" && (file_val.match(reg) == null || reg.test(file_val) == false)) {
				$(this).val('');
				alert("이미지 파일만 업로드 가능합니다.");
			// 파일 사이즈 제한
			} else if (fileSize > maxSize) {
				$(this).val('');
				alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
			}
		});	
		
		
	});
	
	
	// 옵션명 변경시 정규식 검사
	$("input[name=option_name]").on("change",function() {
		let optionName = $(this).val();
		const regStr = /[^가-힣\w\s]/g;
		if (regStr.test(optionName) && optionName.length >= 1) {
			$(this).val('').focus();
			$(this).attr("placeholder","한글 또는 영문 숫자만 사용 가능합니다.")
			
		}
	})	
});