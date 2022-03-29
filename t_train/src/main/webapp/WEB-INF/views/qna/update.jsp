<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 수정</title>
<script type="text/javascript">
  	$(function(){
  		$("#cancelBtn").click(function(){
  			history.back();
  		});
  	});
</script>
</head>
<body>
<div class="page-header" style="text-align: center;">
    <h1>고객 소리함 - 질문/답변 수정</h1>      
  <p>사이트 관리자에게 이용에 관한 궁금점을 남겨주시면 빠른 시일 내에 답변 드리겠습니다.</p>
</div>
<div class="container">
<form action="update.do" method="post">
<input type="hidden" name="page" value="${param.page }">
<input type="hidden" name="perPageNum" value="${param.perPageNum }">
<input type="hidden" name="key" value="${param.key }">
<input type="hidden" name="word" value="${param.word }">
<div class="form-group">
		<label>번호</label>
		<input name="no" id="no" class="form-control" value="${vo.no }" readonly="readonly">
	</div>
	<div class="form-group">
		<label>제목</label>
		<input name="title" id="title" class="form-control" value="${vo.title }">
	</div>
	<div class="form-group">
		<label>내용</label>
		<textarea name="content" id="content" class="form-control" rows="7">${vo.content }</textarea>
	</div>
<button class="btn btn-default">수정</button>	
<button type="reset" class="btn btn-default">새로입력</button>	
<button type="button" id="cancelBtn" class="btn btn-default" onclick="history.back()">취소</button>
</form>
</div>
</body>
</html>