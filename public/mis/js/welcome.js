var admin = function(){
	var init = function(){
		$('.tab').click(tab);
	};
	
	var tab = function(event){
		Hui_admin_tab(this);
	};
	
	init();
}();