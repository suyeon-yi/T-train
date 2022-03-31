<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표 조회</title>
</head>
<body>
<div><img src="/upload/banner/train.jpg" style="width: 100%;" >
</div>
<div class="container">
	<div class="form-group" style="float: right; margin-top: 10px;">
		<label for="no">번호 : </label> ${vo.no }
	</div>
	<div class="title" style="text-align: center; margin-top: 20px;">
		<h3>${vo.depplacename } - ${vo.arrplacename } 구간</h3>
	</div>
	<table class="table">
		<tr>
			<th>구분</th>
			<td>${vo.traingradename }</td>
		</tr>
		<tr>
			<th>운임요금</th>
			<td>${vo.adultcharge }원</td>
		</tr>
		<tr>
			<th>출발시간</th>
			<td>${vo.depplandtime }</td>
		</tr>
		<tr>
			<th>도착시간</th>
			<td>${vo.arrplandtime }</td>
		</tr>
		<tr>
		<td colspan="2">
		<c:if test="${login.gradeNo == 9 }">
			<a href="update.do?no=${vo.no }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}" class="btn btn-default">수정</a>
			<a href="delete.do?no=${vo.no }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}" class="btn btn-default" id="deleteBtn">삭제</a>
		</c:if>
			<a href="https://www.letskorail.com/ebizprd/EbizPrdTicketpr21100W_pr21110.do" class="btn btn-default">코레일 바로 가기</a>
			<a href="list.do?page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}" class="btn btn-default">리스트</a>
		</td>
	</tr>	
	</table>
</div>
</body>
</html>