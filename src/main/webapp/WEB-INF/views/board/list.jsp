<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Insert title here</title>

<script>

$(document).ready(function(){
	
	
	$("#new").on("click",function(){
		
		self.location = "/board/insert";
		
	});
	
	$("#btnSearch").on("click", function(e){
		

		var searchForm = $("#searchForm");
		var keyWord = searchForm.find("input[name='keyword']").val();
				
		if(keyWord == null || keyWord ==''){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='page']").val("1");
		e.preventDefault();
		
		searchForm.submit();
		
	});
	
});
</script>
<style>
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}
</style>
</head>
<%@include file="../include/header.jsp" %>
<body>
<br>
<div style="width:85%; margin:auto;">
<table width = "50%" class="table table-responsive-xl table-hover">

<tr>
<td width="8%" align = "center">No.</td>
<td width="*">title</td>
<td width="10%">writer</td>
<td width="10%">register</td>
<td width="10%">modify</td>
</tr>

<c:forEach items="${list}" var="board">
<tr>
<td align = "center"><c:out value="${board.bno }" /></td>
<td><a href="get?bno=${board.bno}" ><c:out value="${board.title }" /> <b>[<c:out value="${board.replies}" />]</b></a></td>
<td><c:out value="${board.writer }" /></td>
<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></td>
<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updatedate }" /></td>
</tr>
</c:forEach>

</table>

<div align="right" style = "padding: 0px 50px 0px 0px;">
<button id = "new"  class="btn btn-primary">글쓰기</button>
</div>

				<div align = "center" >
                   	<ul class = "pagination">
                   		<c:if test="${pageMaker.prev }">
                   			<li  class="page-item"><a href="/board/list?page=${pageMaker.startPage -1 }">Previous</a></li>
                   		</c:if>
                   		
                   		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                   			<li  class="page-item"><a href= '<c:url value="/board/list?page=${num }" />'> ${num }</a></li>
                   		</c:forEach>
                   		
                   		<c:if test="${pageMaker.next }">
                   			<li  class="page-item"><a href="/board/list?page=${pageMaker.endPage +1 }">Next</a></li>
                   		</c:if>
                   		
                   	</ul>
                </div>
                
                <!-- search -->

		<div align="center" class="form-group " >
		
		<form id='searchForm' action="/board/list" method='get'>
			<div  style="padding-right:10px; display: inline-block;" align="center">

				<select class="form-control" name="searchType" id="searchType" >

					<option value="title">제목</option>

					<option value="Content">본문</option>

					<option value="writer">작성자</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px; display: inline-block; width:40%;">

				<input type="text" class="form-control " name="keyword" id="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' />
				<input type="hidden" name='page' value= '<c:out value= "${pageMaker.cri.page }"/>' />
				<input type="hidden" name='amount' value= '<c:out value= "${pageMaker.cri.amount }"/>' />
			</div>

			<div style="display: inline-block;">

				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch" >검색</button>

			</div>
		</form>
		</div>

		
</div>
</body>
</html>