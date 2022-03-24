<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<style type="text/css">
	.dataRow:hover{
		background: #eee;
		cursor: pointer;
	}
</style>
<script type="text/javascript">
//아래 document가 다 표시가 되면 처리되도록 한다.
$(function(){
	$(".dataRow").click(function(){
		var id = $(this).find(".id").text();
		location = "view.do?id=" + id + "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
	});
});
</script>
</head>
<body>
<div><img src="/upload/banner/member.jpg" style="width: 100%;" >
</div>
<div class="container">
<div class="row" style="margin-bottom: 5px; margin-top: 10px;">
	<!-- 검색에 대한 div -->
	<div class="col-md-8">
			<form class="form-inline">
			<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
			<div class="input-group">
	   		 	<select name="key" class="form-control">
	   		 		<option value="i" ${(pageObject.key == "i")?"selected":"" }>아이디</option>
	   		 		<option value="n" ${(pageObject.key == "n")?"selected":"" }>이름</option>
	   		 		<option value="in" ${(pageObject.key == "in")?"selected":"" }>전체</option>
	   		 	</select>
			</div>
	   		 <div class="input-group">
	      		<input type="text" class="form-control" placeholder="Search" name="word" value="${pageObject.word }">
	      			<div class="input-group-btn">
	       			 <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	     		 	</div>
	   			 </div>
	 		 </form>
	</div>
	<!-- 한 페이지당 보여주는 데이터 갯수 -->
	<div class="col-md-4 text-right">
		<form action="list.do" class="form-inline" id="perPageNumForm">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="key" value="${pageObject.key }">
			<input type="hidden" name="word" value="${pageObject.word }">
			<div class="form-group">
				<label> 1페이지 당 개수
				<select name="perPageNum" class="form-control" id="perPageNumSelect">
					<option ${(pageObject.perPageNum == 5 )?"selected":"" }>5</option>
					<option ${(pageObject.perPageNum == 10 )?"selected":"" }>10</option>
					<option ${(pageObject.perPageNum == 15 )?"selected":"" }>15</option>
					<option ${(pageObject.perPageNum == 20 )?"selected":"" }>20</option>
				</select>
				</label>
			</div>
		</form>
	</div>
</div>
	<table class="table">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>생년월일</th>
		<th>성별</th>
		<th>연락처</th>
		<th>이메일</th>
		<th>상태</th>
		<th>등급</th>
	</tr>
	<c:forEach items="${list }" var="vo">
		<tr class="dataRow">
			<td class="id">${vo.id }</td>
			<td>${vo.name }</td>
			<td><fmt:formatDate value="${vo.birth }" pattern="yyyy-MM-dd"/></td>
			<td>${vo.gender }</td>
			<td>${vo.tel }</td>
			<td>${vo.email }</td>
			<td>${vo.status }</td>
			<td>${vo.gradeName }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="9">
			<pageNav:pageNav listURI="list.do" pageObject="${pageObject }"/>
		</td>
	</tr>
	</table>
</div>
</body>
</html>