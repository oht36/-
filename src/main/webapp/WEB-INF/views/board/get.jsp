<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>



function checkrno(id){
	
	var rno = id;
	var bno = '<c:out value="${board.bno}" />';
		
	replyService.remove({bno:bno, rno:rno}, function(result){
		
		alert(result);
		
		showList(1);
	});
}


$(document).ready(function(){
	
	var bnoValue = '<c:out value="${board.bno}" />';
	var replyUL = $(".comments");
		
	showList(1);
		
	function showList(page){
		
		replyService.list({bno:bnoValue, page:page}, function(list){
			
			var str="";
			
			if(list == null || list.length == 0){
			
				replyUL.html("<div align='center'>등록된 댓글이 없습니다</div>");
			
				return;
			};
			
			for (var i =0, leng = list.length || 0; i<leng; i++){
								
				str += "<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
				str += "<small class='pull-right text-muted'>"+list[i].regdate+"<button id = '"+list[i].rno+"'name = 'valuewhat' onclick='checkrno(this.id)' class = 'pull-right btn btn-link '  >delete</button></small></div></div></li>";
				str += "<p>" + list[i].reply + "</p>";
				
			};
			
			replyUL.html(str);
		
		});
		
		
		
	};
	
	
	
	$("#addComment").on("click", function(e){
		
		var text = $("textarea[name='reply']").val();
		
		if(text == null || text ==''){
			alert("내용을 입력하세요");
			return false;
		}
		
		var reply = {
				replyer : $(document).find("input[name='replyer']").val(),
				reply : $(document).find("textarea[name='reply']").val(),
				bno : bnoValue
		};
		
		replyService.add(reply, function(result){
			alert(result);
			
			$(document).find("textarea[name='reply']").val("");
			
			showList(1);
		});
	});
	
//	function checkrno(id){
		
//		var rno = id;
		
//		replyService.remove(rno, function(result){
//			
//			alert(result);
			
//			showList(1);
//		});
//	}
	

	
})
	
</script>

<script>
	
	function list(){
		
		self.location = "/board/list";
	}
		
	function modify(){
		
		self.location = "/board/modify?bno=${board.bno}";
	}
	
	

</script>



<style>
#table{ width:55%; margin:0 auto;}
</style>
</head>
<%@include file="../include/header.jsp" %>
<body >

<br>
<table id="table" class="table table-responsive-xl">
<tr>
<td width="15%">Title</td>
<td colspan="3"><input class="form-control" readonly="readonly" value = "<c:out value='${board.title }' />"></td>
</tr>

<tr>
<td>writer</td>
<td colspan="3"><input class="form-control" readonly="readonly" value = "<c:out value='${board.writer }' />"></td>
</tr>

<tr>
<td>register date</td>
<td><input class="form-control" readonly="readonly" value = "<fmt:formatDate value='${board.regdate }' pattern="yyyy-MM-dd HH:mm:ss" /> "></td>
<td>update date</td>
<td><input class="form-control" readonly="readonly" value = "<fmt:formatDate value='${board.updatedate }' pattern="yyyy-MM-dd HH:mm:ss" />"> </td>
</tr>

<tr>
<td height="100px">content</td>
<td colspan="3"><textarea class="form-control" style="height:350px;"readonly = "readonly"><c:out value="${board.content }" /></textarea></td>
</tr>


</table>

<br>
<div align = "center">
<button onclick="modify()" class="btn btn-warning">modify</button>
<button onclick="list()" class="btn btn-secondary">list</button>
</div>
<br>
<br>
<div style= "width:55%; margin:auto;" >
	<table align="center">
	<tr>
	<td width="15%"><input name = "replyer" class="form-control" style=" align:center; margin:auto;" /></td>
	<td width="85%"><textarea name = "reply" class="form-control" style="width:95%; align:center; margin:auto;" ></textarea></td>
	<td><button id = "addComment" class="btn btn-primary">Comment</button></td>
	</tr>
	</table>
	<br>
	
	
	<ul class = "comments" style="list-style:none;">
	
		<li class="page-item">
			<div class="header">
				<strong class="primary-font">user00</strong>
				<small class="pull-right text-muted">2018-01-01</small>
			</div>
			<p>Good job</p>
		</li>
	</ul>
	
	
</div>


</body>
</html>