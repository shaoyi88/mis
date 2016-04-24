var user = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		$('.del').click(del);
		$('#user_type').change(user_type_change);
		$('#user_second_type').change(user_second_type);
	};
	
	var user_type_change = function(event){
		if($(event.currentTarget).val() === '0'){
			$('#td_user_second_type').show().find('select').attr('ignore', '');
		}else{
			$('#td_user_second_type').hide().find('select').attr('ignore', 'ignore').val('');
			$('#td_enterprise').hide().find('select').attr('ignore', 'ignore').val('');
		}
	};
	
	var user_second_type = function(event){
		if ($(event.currentTarget).val() === '1') {
			$('#enterprise_require').hide();
			$('#td_enterprise').show().find('select').attr('ignore', 'ignore').val('');
		}else if($(event.currentTarget).val() === '2'){
			$('#enterprise_require').show();
			$('#td_enterprise').show().find('select').attr('ignore', '').val('');
		}else{
			$('#td_enterprise').hide().find('select').attr('ignore', 'ignore').val('');
		}
	};
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除吗？',function(index){
		    window.location.href = $('#delUrl').val()+'?id='+id;
		});
	};
	
	init();
}();