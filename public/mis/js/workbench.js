var workbench = function(){
	var form;
	
	var init = function(){
		form = $(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		
		$('#service_time').focus(function(){
			WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		
		$('.auditActivity').click(auditActivity);
		$('.repairConfirm').click(repairConfirm);
		$('.complainConfirm').click(complainConfirm);
		$('.projectApplyConfirm').click(projectApplyConfirm);
		$('.roomBookingConfirm').click(roomBookingConfirm);
		$('.enterpriseUserApprove').click(enterpriseUserApprove);
	};
	
	var enterpriseUserApprove = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#apply_id').val($(event.currentTarget).attr('aid'));
		$('#user_id').val($(event.currentTarget).attr('uid'));
		$('#enterprise_id').val($(event.currentTarget).attr('eid'));
		layer.open({
		    type: 1,
		    area: '500px',
		    title: [
		        '企业用户审核',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#enterpriseUserApproveWindow')
		});
	};
	
	var roomBookingConfirm = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.open({
  			type: 2,
  			title: '确认',
  			shadeClose: true,
  			shade: 0.8,
  			area: ['600px', '90%'],
  			content: $('#roomBookingConfirmUrl').val()+'?id='+id,
			end : function(index, layero){
    			layer.close(index); 
				window.location.reload();
  			}
		}); 
	};
	
	var auditActivity = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#activity_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '500px',
		    title: [
		        '活动审核',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#auditWindow')
		});
	};
	
	var repairConfirm = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#repair_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '800px',
		    title: [
		        '物业报修申请确认',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#repairConfirmWindow')
		});
	};
	
	var complainConfirm = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#complain_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '800px',
		    title: [
		        '物业投诉申请确认',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#complainConfirmWindow')
		});
	};
	
	var projectApplyConfirm = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#apply_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '800px',
		    title: [
		        '项目需求申请确认',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#projectApplyConfirmWindow')
		});
	};

	init();
}();