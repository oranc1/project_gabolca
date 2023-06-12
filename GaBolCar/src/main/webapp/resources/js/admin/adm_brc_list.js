// select 값 검색창 name명 전달
$(function() {
	$("button[name=brc_update]").on("click", function() {
		window.open("brcUpdate?brc_idx="+$(this).val(),"brcUpdate","width=500, height=300");
	});
	
	$("button[name=brc_delete]").on("click", function() {
		if (confirm("삭제하시겠습니까?")) location.href="brcDeletePro?brc_idx="+$(this).val() 
	});
	
	$("button[name=brc_insert]").on("click", function() {
		window.open("brcRegister","brcRegister","width=500, height=300");
	});
	
});

