$(function() {
	const width = 480;
	const height = 530;
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let tops = (document.body.offsetHeight / 2) - (height / 2);
	left += window.screenLeft;
	
	$("button[name=brc_update]").on("click", function() {
		window.open("brcUpdate?brc_idx="+$(this).val(),"brcUpdate","width="+width+",height="+height+",left="+left+",top="+tops);
	});
	
	$("button[name=brc_delete]").on("click", function() {
		if (confirm("삭제하시겠습니까?")) location.href="brcDeletePro?brc_idx="+$(this).val() 
	});
	
	$("button[name=brc_insert]").on("click", function() {
		window.open("brcRegister","brcRegister","width="+width+",height="+height+",left="+left+",top="+tops);
	});
	
});

