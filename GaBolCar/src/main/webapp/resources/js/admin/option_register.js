$(function(){
    $("input[type=submit]").on("click", function() {
        setTimeout(() => window.open("about:blank","_self"), 100);
    });
});