<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		
});
</script>
</head>
<%@include file="../include/header.jsp" %>
<body>
<br>
<br>
<form action = "/board/insert" method="post">
<table id="table" class="table table-responsive-xl">
<tr>
<td width="15%">Title</td>
<td colspan="3"><input  name="title" class="form-control" ></td>
</tr>

<tr>
<td>writer</td>
<td colspan="3"><input  name="writer" class="form-control" ></td>
</tr>

<tr>
<td height="100px">content</td>
<td colspan="3"><textarea  name="content" class="form-control" style="height:350px;"></textarea></td>
</tr>


</table>

<br>
<div align = "center">
<button type="reset" class="btn btn-danger">reset</button>
<button type = "button" id = "list" class="btn btn-secondary">list</button>
<button type="submit" class="btn btn-success">submit</button>
</div>

</form>


</body>
</html>