<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h2>auth_error</h2>
	<div class="alert alert-danger">
		잘못된 요청입니다.
	</div>
	<ul class="list-group">
	  		<li class="list-group-item">이용권한을 확인해주세요.</li>
	  		<a href="/main/main.do" class="btn btn-default">메인으로 이동</a>
	</ul>
</div>
</body>
</html>