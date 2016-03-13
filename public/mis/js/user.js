var user = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		$('.del').click(del);
		$('#user_type').change(user_type_change);
	};
	
	var user_type_change = function(event){
		if($(event.currentTarget).val() === '0'){
			$('#user_second_type').show();
			$('#td_user_second_type').show().find('input').attr('ignore', '');
		}else{
			$('#user_second_type').hide().val('');
			$('#td_user_second_type').hide().find('input,select').attr('ignore', 'ignore').val('');
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