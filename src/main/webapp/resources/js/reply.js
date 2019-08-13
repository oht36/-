var replyService = (function(){
	
	function add(reply, callback, error){
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result,status, xhr){
				
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
			
		})
	}
	
	function list(param, callback, error){
		
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/" +bno+ "/" +page+".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function remove(param, callback, error){
		
		var bno = param.bno;
		var rno = param.rno;
		
		$.ajax({
			type: 'delete',
			url: '/replies/' + bno + '/' + rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
			
		});
	}
	
	function update(reply, callback, error){
		$.ajax({
			type: 'put',
			url: 'replies/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
			
		});
	}
	
	return {
		add : add,
		list : list,
		remove : remove,
		update : update
	}
	
	
})();