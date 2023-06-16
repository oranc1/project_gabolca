$(function() {
	$("button[name=option_update]").on("click", function() {
		window.open("optionUpdate?option_idx="+$(this).val(),"optionUpdate","width=480, height=530");
	});
	
	$("button[name=option_delete]").on("click", function() {
		if (confirm("삭제하시겠습니까?")) location.href="optionDeletePro?option_idx="+$(this).val() 
	});
	
    $("#option_insert").on("click",function() {
        window.open("optionInsert","optionInsert","width=480, height=530");
    });
    
})