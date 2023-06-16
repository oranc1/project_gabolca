$(function(){
	// submit 버튼 클릭 - 부모창 새로고침 및 submit
	$("#submitBtn").on("click",function() {
		if($("input[name=option_name]").val() != '' && $("input[name=option_image]").val() != '') {
			$("form").submit();
			setTimeout(() => window.open("about:blank","_self"), 100);
			return false;
		}
	});
	
	$("#submitBtn").css({
		"background" : "rgb(255, 94, 0)",
		"color" : "#FFFFFF"
	});
    
	$("#closeBtn").on("click", function() {
		window.close();
	});
    
    // 파일등록 태그 생성
    $("#imageDelete").on("click",function() {
		$("#opth_1").empty().html("<td class='td_left'><label for='option_image'>옵션 이미지</label></td>");
		$("#opth_2").empty().html("<td class='td_right'><input type='file' accept='image/*' name='option_image' required='required' class='form-control'/></td>");
	});

	
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