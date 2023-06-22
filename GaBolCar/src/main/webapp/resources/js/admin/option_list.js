$(function() {
	const width = 480;
	const height = 530;
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let tops = (document.body.offsetHeight / 2) - (height / 2);
	left += window.screenLeft;
		
	$("button[name=option_update]").on("click", function() {
		window.open("optionUpdate?option_idx="+$(this).val(),"optionUpdate","width="+width+",height="+height+",left="+left+",top="+tops);
	});
	
	$("button[name=option_delete]").on("click", function() {
		if (confirm("삭제하시겠습니까?")) location.href="optionDeletePro?option_idx="+$(this).val() 
	});
	
    $("#option_insert").on("click",function() {
        window.open("optionInsert","optionInsert","width="+width+",height="+height+",left="+left+",top="+tops);
    });
    
})