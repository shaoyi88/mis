var enterprise = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		$('.del').click(del);
		$('#enterprise_reg_time').focus(function(){
			WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'});
		});
		$('#enterprise_enter_time').focus(function(){
			WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'});
		});
		
		var uploader = WebUploader.create({
    		auto: true,
			swf: '/public/common/js/webuploader-0.1.5/Uploader.swf',
			server: $('#uploadUrl').val(),
   			pick: '#filePicker',
    		accept: {
        		title: 'Images',
        		extensions: 'gif,jpg,jpeg,bmp,png',
        		mimeTypes: 'image/*'
    		},
			fileSingleSizeLimit : 1024*1024*10
		});
		
		uploader.on( 'error', function( type  ) {
			if(type == 'F_EXCEED_SIZE'){
				alert('仅支持10M以下文件上传');
			}
		});

		uploader.on( 'uploadError', function( file) {
   			 alert('上传失败，请重试');
		});

		uploader.on( 'uploadSuccess', function( file, response) {
			var json = eval( "(" + response._raw + ")" );
			if(json.result){
				$('#enterprise_business_licence').val(json.result);
				$('#previewImg').attr('src', json.result).show();
			}else{
				 alert('上传失败，请重试');
			}
		});
		
		var uplogo = WebUploader.create({
    		auto: true,
			swf: '/public/common/js/webuploader-0.1.5/Uploader.swf',
			server: $('#uploadLogoUrl').val(),
   			pick: '#filePickerLogo',
    		accept: {
        		title: 'Images',
        		extensions: 'gif,jpg,jpeg,bmp,png',
        		mimeTypes: 'image/*'
    		},
			fileSingleSizeLimit : 1024*1024*10
		});
		
		uplogo.on( 'error', function( type  ) {
			if(type == 'F_EXCEED_SIZE'){
				alert('仅支持10M以下文件上传');
			}
		});

		uplogo.on( 'uploadError', function( file) {
   			 alert('上传失败，请重试');
		});

		uplogo.on( 'uploadSuccess', function( file, response) {
			var json = eval( "(" + response._raw + ")" );
			if(json.result){
				$('#enterprise_logo').val(json.result);
				$('#previewLogoImg').attr('src', json.result).show();
			}else{
				 alert('上传失败，请重试');
			}
		});
		
	};
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除吗？',function(index){
		    window.location.href = $('#delUrl').val()+'?id='+id;
		});
	};
	
	init();
}();