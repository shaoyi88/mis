var fee = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		
		$('#fee_date').focus(function(){
			WdatePicker({
				readOnly:true,
				dateFmt:'yyyy-MM',
				onpicking:function(dp){
					$('#fee_date_str').val(Date.parse(new Date(dp.cal.getNewDateStr()))/1000);
				}
			});
		});
		
		$('.del').click(del);
		$('#user_id').change(userChange);
	};
	
	var userChange = function(event){
		if($('#user_id option:selected').val() == ''){
			$('#enterprise_name').val('');
		}else{
			$('#enterprise_name').val($('#user_id option:selected').text());
		}
	}
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除吗？',function(index){
		    window.location.href = $('#delUrl').val()+'&id='+id;
		});
	};
	
	init();
}();