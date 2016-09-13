var file = function(){
	var init = function(){
		var dir = +new Date();
		var uploader = WebUploader.create({
    		swf: '/public/common/js/webuploader-0.1.5/Uploader.swf',

    		server: $('#uploadUrl').val(),

    		pick: '#picker',
			
			formData: {'dir': dir},
			
			fileSingleSizeLimit : 1024*1024*10,
			
    		resize: false,
			
			auto: true
		});
		
		uploader.on( 'fileQueued', function( file ) {
    		$('#result').html('上传中...');
		});
		
		uploader.on( 'error', function( type  ) {
			if(type == 'F_EXCEED_SIZE'){
				alert('仅支持10M以下文件上传');
			}
		});
		
		uploader.on( 'uploadSuccess', function( file ) {
			$('#result').html(file.name+'已上传');
		});

		uploader.on( 'uploadError', function( file ) {
			$('#result').html('已上传出错');
		});

		uploader.on( 'uploadComplete', function( file ) {
			$('#attachment').val('/upload/file/'+dir+'/'+file.name);
		});
		
		
		var uploader1 = WebUploader.create({
    		swf: '/public/common/js/webuploader-0.1.5/Uploader.swf',

    		server: $('#uploadUrl').val(),

    		pick: '#picker1',
			
			formData: {'dir': dir},
			
			fileSingleSizeLimit : 1024*1024*10,
			
    		resize: false,
			
			auto: true
		});
		
		uploader1.on( 'fileQueued', function( file ) {
    		$('#result1').html('上传中...');
		});
		
		uploader1.on( 'error', function( type  ) {
			if(type == 'F_EXCEED_SIZE'){
				alert('仅支持10M以下文件上传');
			}
		});
		
		uploader1.on( 'uploadSuccess', function( file ) {
			$('#result1').html(file.name+'已上传');
		});

		uploader1.on( 'uploadError', function( file ) {
			$('#result1').html('已上传出错');
		});

		uploader1.on( 'uploadComplete', function( file ) {
			$('#attachment1').val('/upload/file/'+dir+'/'+file.name);
		});
	};
	
	init();
}();