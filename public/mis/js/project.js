var project = function(){
	var form;
	var init = function(){
		form = $(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		$('.applyConfirm').click(applyConfirm);
		$('.applyFollow').click(applyFollow);
	};
	
	var applyConfirm = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#apply_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '800px',
		    title: [
		        '项目申请审核',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#applyWindow')
		});
	};
	
	var applyFollow = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#f_apply_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '800px',
		    title: [
		        '指派跟进人',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#followWindow')
		});
	};
	
	init();
}();