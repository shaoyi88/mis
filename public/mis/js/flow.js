var club = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		$('.del').click(del);
		
		$('textarea').each(function(){
			//实例化编辑器
	    	var um = UM.getEditor($(this).attr('id'));
		});
		
		
		$('.addStep').click(addStep);
		$('#form-flow-add').delegate('.delStep', 'click', delStep);
	};
	
	var addStep = function(event){
		 var template = Hogan.compile($('#stepTpl').html(),{delimiters:'<% %>'});
		 var step_id = 'step_' + (+new Date());
	     $('#opt').before(template.render({step_id:step_id}));
		 var um = UM.getEditor(step_id);
	};
	
	var delStep = function(event){
		$(event.currentTarget).parents('tr').remove();
	};
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除吗？',function(index){
		    window.location.href = $('#delUrl').val()+'?id='+id;
		});
	};
	
	init();
}();