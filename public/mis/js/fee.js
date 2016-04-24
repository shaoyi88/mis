var fee = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true,
			datatype:{
				"num":function(gets,obj,curform,regxp){
					var reg=/^(\d*\.)?\d+$/;
					if(reg.test(gets)){return true;}					
					return false;
				}	
			}
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
		
		$('#property_fee_unit_price').blur(fee_amount);
		$('#property_fee_num').blur(fee_amount);
	};
	
	var fee_amount = function(){
		if($('#property_fee_unit_price').val() != '' && $('#property_fee_num').val() != ''){
			var fee_unit_price = parseFloat($('#property_fee_unit_price').val());
			var amount = parseFloat($('#property_fee_num').val());
			$('#property_fee_amount').val((fee_unit_price*amount).toFixed(2));
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