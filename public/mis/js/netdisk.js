var netdisk = function(){
	var init = function(){
		$(".Huiform").Validform({
			tiptype : 4,
			tipSweep : true
		});
		$('.del').click(del);
		$('#allrole').click(allrole);

		var uploader = WebUploader.create({
    		swf: '/public/common/js/webuploader-0.1.5/Uploader.swf',

    		server: $('#uploadUrl').val(),
			
			formData: {'dirId': $('#did').val()},

    		pick: '#picker',
			
			fileSingleSizeLimit : 1024*1024*10,
			
    		resize: false,
			
			auto: true
		});
		
		uploader.on( 'fileQueued', function( file ) {
    		$('.uploader-list').append( '<div id="' + file.id + '" class="item">' +
        		'<h4 class="info">' + file.name + '</h4>' +
        		'<p class="state">等待上传...</p>' +
    		'</div>' );
		});
		
		uploader.on( 'error', function( type  ) {
			if(type == 'F_EXCEED_SIZE'){
				alert('仅支持10M以下文件上传');
			}
		});
		
		// 文件上传过程中创建进度条实时显示。
		uploader.on( 'uploadProgress', function( file, percentage ) {
    		var $li = $( '#'+file.id ),
        	$percent = $li.find('.progress .progress-bar');

    		// 避免重复创建
    		if ( !$percent.length ) {
        		$percent = $('<div class="progress progress-striped active">' +
          			'<div class="progress-bar" role="progressbar" style="width: 0%">' +
          				'</div>' +
        				'</div>').appendTo( $li ).find('.progress-bar');
    		}

    		$li.find('p.state').text('上传中');

    		$percent.css( 'width', percentage * 100 + '%' );
		});
		
		uploader.on( 'uploadSuccess', function( file ) {
    		$( '#'+file.id ).find('p.state').text('已上传');
		});

		uploader.on( 'uploadError', function( file ) {
   			 $( '#'+file.id ).find('p.state').text('上传出错');
		});

		uploader.on( 'uploadComplete', function( file ) {
    		window.location.replace(window.location.href);
		});

	};
	
	var del = function(event){
		var id = $(event.currentTarget).attr('did');
		layer.confirm('确定删除吗？',function(index){
			var delUrl = $('#delUrl').val();
			if(delUrl.indexOf('?') != -1){
				window.location.href = delUrl+'&id='+id;
			}else{
				window.location.href = delUrl+'?id='+id;
			}
		});
	};
	
	var allrole = function(event){
		var val = $(event.currentTarget).prop('checked');
		if(val==true){
			$('.serole').prop('checked',true);
		}else{
			$('.serole').prop('checked',false);
		}
	}
	
	init();
}();