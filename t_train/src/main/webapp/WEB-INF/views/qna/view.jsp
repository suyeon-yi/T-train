<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 소리함</title>
</head>
<body>
<div><img src="/upload/banner/qna.jpg" style="width: 100%;" >
</div>
<div class="container">
	<div class="form-group" style="float: right; margin-top: 10px;">
		<label for="no">번호 : </label> ${vo.no } | <label for="id">작성자 : </label> ${vo.name}(${vo.id }) 
	</div>
	<div class="form-group" style="float: left; margin-top: 10px;">
		<label for="writeDate">작성일 : </label> <fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd" />
	</div>
	<div class="title" style="text-align: center; margin-top: 20px;">
		<h3>${vo.title }</h3>
	</div>
	<table class="table">
		<tr>
			<th>내용</th>
			<td>${vo.content }</td>
		</tr>
		<tr>
		<td colspan="2">
			<a href="answer.do?no=${vo.no }&refNo=${vo.no }&parentNo=${vo.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}" class="btn btn-default">답변등록</a>
			<a href="update.do?no=${vo.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}" class="btn btn-default">수정</a>
			<a href="delete.do?no=${vo.no }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}" class="btn btn-default" id="deleteBtn">삭제</a>
			<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}" class="btn btn-default">리스트</a>
		</td>
	</tr>		
	</table>
</div>
</body>
</html>