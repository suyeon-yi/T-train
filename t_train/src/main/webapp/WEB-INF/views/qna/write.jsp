<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 등록</title>
<script type="text/javascript">
  	$(function(){
  		$("#cancelBtn").click(function(){
  			history.back();
  		});
</script>
</head>
<body>
<div class="page-header" style="text-align: center;">
    <h1>고객 소리함 - 질문 등록</h1>      
  <p>사이트 관리자에게 이용에 관한 궁금점을 남겨주시면 빠른 시일 내에 답변 드리겠습니다.</p>
</div>
<div class="container">
<form action="write.do" method="post">
<input type="hidden" value="${param.perPageNum }" name="perPageNum">
	<div class="form-group">
		<label>제목</label>
		<input name="title" id="title" class="form-control">
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea name="content" id="content" class="form-control" rows="7"></textarea>
	</div>
<button class="btn btn-default">등록</button>	
<button type="reset" class="btn btn-default">새로입력</button>	
<button type="button" id="cancelBtn" onclick="history.back()" class="btn btn-default">취소</button>	
</form>
</div>
</body>
</html>