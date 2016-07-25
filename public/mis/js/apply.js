var apply = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype: 4,
			tipSweep: true
		});
		$(".checkapproval").click(showApproval);
	};
	
	var showApproval = function(event){
		//$("#approvalWindow").show();
	};
	
	init();
}();