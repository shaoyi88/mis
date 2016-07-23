var club = function(){
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
	};
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除吗？',function(index){
		    window.location.href = $('#delUrl').val()+'?id='+id;
		});
	};
	
	init();
}();