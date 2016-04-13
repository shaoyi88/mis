var project = function(){
	var form;
	var init = function(){
		form = $(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		$('.del').click(del);
		//实例化编辑器
		if($('#project_desc').length > 0){
			var um = UM.getEditor('project_desc');
		}	
		$('.applyConfirm').click(applyConfirm);
	};
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除吗？',function(index){
		    window.location.href = $('#delUrl').val()+'?id='+id;
		});
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
	
	init();
}();