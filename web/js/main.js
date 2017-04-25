$(document).ready(function() {
	$(".logo").click(function(){
    $('.mtnInfo').html('Mountain Info for ID: '+$(this).attr("id").toString())
	});
});