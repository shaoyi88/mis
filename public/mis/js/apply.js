var apply = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype: 4,
			tipSweep: true
		});
		$(".checkapproval").click(showApproval);
	};
	
	var showApproval = function(event){
		layer.open({
		    type: 1,
		    area: '500px',
		    title: [
		        '立项表',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#approvalWindow')
		});
	};
	
	init();
}();