var apply = function(){
	var init = function(){
		$('#confirm').click(confirm);
		$('#finish').click(finish);
	};
	
	var confirm = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确认已跟进该申请吗？',function(index){
		    window.location.href = $('#confirmUrl').val()+'?apply_id='+id+'&status=1';
		});
	};
	
	var finish = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确认已完成该申请吗？',function(index){
		    window.location.href = $('#confirmUrl').val()+'?apply_id='+id+'&status=2';
		});
	};

	init();
}();