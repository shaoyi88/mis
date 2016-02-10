var article = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		$('.del').click(del);
		//实例化编辑器
	    var um = UM.getEditor('article_content');
	};
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除吗？',function(index){
		    window.location.href = $('#delUrl').val()+'?did='+id;
		});
	};
	
	init();
}();