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
				},
				oncleared:function(){
					$('#fee_date_str').val('');
				}
			});
		});
		
		$('.del').click(del);
		$('#enterprise_key').keyup(searchEnterprise);
		$('#water_fee_unit_price').blur(water_fee_amount);
		$('#water_fee_num').blur(water_fee_amount);
		$('#elec_fee_unit_price').blur(elec_fee_amount);
		$('#elec_fee_num').blur(elec_fee_amount);
	};
	
	var searchEnterprise = function(){
		var key = $(event.currentTarget).val();
		var getEnterpriseUrl = $('#getEnterpriseUrl').val()+'?key='+key;
		$('.auto-complete-result').html('').hide();
		$('#enterprise_id').val('');
		$('#enterprise_email').val('');
		$('#rent_fee').val('');
		$('#property_fee').val('');
		$('#submitFee').addClass('disabled');
		if(key == ''){
			return;
		}
		$.ajax({
            type: "GET",
            url: getEnterpriseUrl,
            dataType: "json",
            success: function(data){
            	if(data.status == 1){
            		var template = Hogan.compile($('#enterpriseTpl').html(),{delimiters:'<% %>'});
            		$('.auto-complete-result').html(template.render({enterpriseList:data.enterpriseList})).show();
            		$('.auto-complete-result').find('li').click(function(event){
						$('#enterprise_id').val($(event.currentTarget).attr('eid'));
						$('#enterprise_email').val($(event.currentTarget).attr('email'));
						$('#rent_fee').val($(event.currentTarget).attr('rent_fee'));
						$('#property_fee').val($(event.currentTarget).attr('property_fee'));
						$('#submitFee').removeClass('disabled');
            			$('#enterprise_key').val($(event.currentTarget).html());
            			$('.auto-complete-result').hide();
            		});
            	}
            }
        });
	};
	
	var water_fee_amount = function(){
		if($('#water_fee_unit_price').val() != '' && $('#water_fee_num').val() != ''){
			var fee_unit_price = parseFloat($('#water_fee_unit_price').val());
			var amount = parseFloat($('#water_fee_num').val());
			$('#water_fee_amount').html('（水费：'+(fee_unit_price*amount).toFixed(2)+'元）');
		}else{
			$('#water_fee_amount').html('');
		}
	};
	
	var elec_fee_amount = function(){
		if($('#elec_fee_unit_price').val() != '' && $('#elec_fee_num').val() != ''){
			var fee_unit_price = parseFloat($('#elec_fee_unit_price').val());
			var amount = parseFloat($('#elec_fee_num').val());
			$('#elec_fee_amount').html('（电费：'+(fee_unit_price*amount).toFixed(2)+'元）');
		}else{
			$('#elec_fee_amount').html('');
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