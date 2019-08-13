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
<style>
#table{ width:55%; margin:0 auto;}
</style>
<script>

$(document).ready(function(){
	
	$("#list").on("click",function(){
		
		self.location = "/board/list";
		
	})
	
	$("#delete").on("click",function(e){
		
		e.preventDefault();
		
		var delConfirm = confirm("삭제하시겠습니까?");
		
		if(delConfirm){
							
			$("#isForm").attr("action", "/board/remove");
			
			$("#isForm").submit();
		
		}else{
			history.back();
		}
		
	})
	
});
</script>


</head>
<%@include file="../include/header.jsp" %>
<body>

<form id = "isForm" action="/board/modify" method="post">
<br>
<br>
<table id="table" class="table table-responsive-xl">
<tr>
<td width="15%">Title</td>
<td colspan="3"><input  name="title" class="form-control" value = "<c:out value='${board.title }' />"></td>
</tr>

<tr>
<td>writer</td>
<td colspan="3"><input name="writer" class="form-control" readonly="readonly" value = "<c:out value='${board.writer }' />"></td>
</tr>

<tr>
<td>register date</td>
<td><input class="form-control" readonly="readonly" value = "<fmt:formatDate value='${board.regdate }' pattern="yyyy-MM-dd HH:mm:ss" /> "></td>
<td>update date</td>
<td><input class="form-control" readonly="readonly" value = "<fmt:formatDate value='${board.updatedate }' pattern="yyyy-MM-dd HH:mm:ss" />"> </td>
</tr>

<tr>
<td height="100px">content</td>
<td colspan="3"><textarea name="content" class="form-control" style="height:350px;"><c:out value="${board.content }" /></textarea></td>
</tr>


</table>

<br>
<input type="hidden" name="bno" value = '<c:out value="${board.bno }" />' />

<div align = "center">
<button type = "submit"  class="btn btn-warning">modify</button>
<button id = "delete" type = "submit" class="btn btn-danger">delete</button>
<button type = "button" id = "list" class="btn btn-secondary">list</button>
</div>
</form>


</body>
</html>