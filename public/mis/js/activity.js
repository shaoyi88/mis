var activity = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		$('.del').click(del);
		$('.delRegister').click(delRegister);
		$('.delComment').click(delComment);
		//实例化编辑器
	    var um = UM.getEditor('activity_content');
		if(typeof $('#dateRange').attr('class') != 'undefined'){
			var activity_start_time = $('#activity_start_time').val();
			var activity_end_time = $('#activity_end_time').val();
			$('#dateRange').dateRangePicker({
				startDate: moment().startOf('day').toDate(),
				autoClose: true,
				format: 'YYYY-MM-DD',
				separator: '~',
			}).bind('datepicker-change',function(event,obj){
				$('#activity_start_time').val(Date.parse(new Date(obj.date1.toLocaleDateString()))/1000);
				$('#activity_end_time').val(Date.parse(new Date(obj.date2.toLocaleDateString()))/1000);
			});
		}
	};
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('删除活动会同时删除相关的活动报名和活动评论数据，确定删除吗？',function(index){
		    window.location.href = $('#delUrl').val()+'?id='+id;
		});
	};
	
	var delRegister = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除该报名用户吗？',function(index){
		    window.location.href = $('#delRegisterUrl').val()+'&id='+id;
		});
	};
	
	var delComment = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除该用户评论吗？',function(index){
		    window.location.href = $('#delCommentUrl').val()+'&id='+id;
		});
	};
	
	init();
}();