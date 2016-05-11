var apply = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype: 4,
			tipSweep: true
		});
		
		$('.change').click(change);
	};
	
	var change = function(){
		window.location.href = $('#changeUrl').val();
	};
	
	init();
}();