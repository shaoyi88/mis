var hidden = function(){
	var form;
	
	var init = function(){
		form = $(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		
		$('.hiddenAssign').click(hiddenAssign);
		$('.hiddenFollow').click(hiddenFollow);
	};
	
	var hiddenAssign = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#f_enterprise_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '500px',
		    title: [
		        '指派跟进人',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#hiddenAssignWindow')
		});
	};
	
	var hiddenFollow = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#enterprise_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: ['600px'],
		    title: [
		        '跟进',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#hiddenFollowWindow')
		});
	};
	
	init();
}();
