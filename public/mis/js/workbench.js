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
		$('.repairFollow').click(repairFollow);
		$('.complainConfirm').click(complainConfirm);
		$('.complainFollow').click(complainFollow);
		$('.projectApplyConfirm').click(projectApplyConfirm);
		$('.projectApplyFollow').click(projectApplyFollow);
		$('.roomBookingConfirm').click(roomBookingConfirm);
		$('.enterpriseUserApprove').click(enterpriseUserApprove);
		$('.auditFollow').click(auditFollow);
		$('.enterpriseUserFollow').click(enterpriseUserFollow);
		$('.potentialFollow').click(potentialFollow);
		$('.potentialConfirm').click(potentialConfirm);
	};
	
	var potentialFollow = function(event){
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
		    content: $('#potentialFollowWindow')
		});
	};
	
	var potentialConfirm = function(event){
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
		    content: $('#potentialConfirmWindow')
		});
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
	
	var enterpriseUserFollow = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#f_apply_id').val($(event.currentTarget).attr('aid'));
		layer.open({
		    type: 1,
		    area: '500px',
		    title: [
		        '指派跟进人',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#enterpriseUserFollowWindow')
		});
	};
	
	var roomBookingConfirm = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.open({
  			type: 2,
  			title: '确认',
  			shadeClose: true,
  			shade: 0.8,
  			area: ['600px'],
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
	
	var auditFollow = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#f_activity_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '500px',
		    title: [
		        '指派跟进人',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#followWindow')
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
	
	var repairFollow = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#f_repair_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '800px',
		    title: [
		        '指派跟进人',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#repairFollowWindow')
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
	
	var complainFollow = function(event){
		form.resetForm();
		$('.Validform_checktip').html('');
		$('#f_complain_id').val($(event.currentTarget).attr('did'));
		layer.open({
		    type: 1,
		    area: '800px',
		    title: [
		        '指派跟进人',
		        'border:none; background:#61BA7A; color:#fff;' 
		    ],
		    bgcolor: '#eee', //设置层背景色
		    content: $('#complainFollowWindow')
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
	
	var projectApplyFollow = function(event){
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
		    content: $('#projectApplyFollowWindow')
		});
	};

	init();
}();