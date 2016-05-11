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
		
		$('.del').click(del);
		
		//实例化编辑器
		try{
			var um = UM.getEditor('room_desc');
		}catch(e){}
		
		$('#date').focus(function(){
			WdatePicker({
				readOnly:true,
				dateFmt:'yyyy-MM-dd'
			});
		});
		
		$('.view').click(view);
	};
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('相关的预订信息也将会删除，确定删除吗？',function(index){
		    window.location.href = $('#delUrl').val()+'&id='+id;
		});
	};
	
	var view = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.open({
  			type: 2,
  			title: '查看/确认',
  			shadeClose: true,
  			shade: 0.8,
  			area: ['1000px', '600px'],
  			content: $('#viewUrl').val()+'?id='+id,
			end : function(index, layero){
    			layer.close(index); 
				window.location.reload();
  			}
		}); 
	};
	
	init();
}();