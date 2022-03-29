<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표 등록 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$("#cancelBtn").click(function(){
  			history.back();
  		});
  </script>
</head>
<body>
<div class="page-header" style="text-align: center;">
    <h1>시간표 등록</h1>      
  <p>관리자가 직접 시간표를 등록할 수 있습니다.</p>
</div>
<div class="container">
<form action="write.do" method="post">
<input type="hidden" value="${param.page }" name="page">
<input type="hidden" value="${param.perPageNum }" name="perPageNum">
<input type="hidden" value="${param.key }" name="key">
<input type="hidden" value="${param.word }" name="word">
	<div class="form-group">
		<label>구분</label>
		<input name="traingradename" id="traingradename" class="form-control">
	</div>
	<div class="form-group">
		<label>출발역</label>
		<input name="depplacename" id="depplacename" class="form-control">
	</div>
	<div class="form-group">
		<label>도착역</label>
		<input name="arrplacename" id="arrplacename" class="form-control">
	</div>
	<div class="form-group">
		<label>운임요금</label>
		<input name="adultcharge" id="adultcharge" class="form-control">
	</div>
	<div class="form-group">
		<label>출발시간</label>
		<input name="depplandtime" id="depplandtime" class="form-control" required="required" autocomplete="off" placeholder="예) 05시 05분" >
	</div>
	<div class="form-group">
		<label>도착시간</label>
		<input name="arrplandtime" id="arrplandtime" class="form-control" required="required" autocomplete="off" placeholder="예) 05시 05분" >
	</div>
<button class="btn btn-default">등록</button>	
<button type="reset" class="btn btn-default">새로입력</button>	
<button type="button" id="cancelBtn" class="btn btn-default">취소</button>	
</form>
</div>
</body>
</html>