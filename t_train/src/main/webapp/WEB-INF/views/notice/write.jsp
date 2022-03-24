<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$("#cancelBtn").click(function(){
  			history.back();
  		});
  		
  	// datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능
		   $(".datepicker").datepicker({
			   changeMonth: true,
			   changeYear: true,
			   dateFormat: "yy-mm-dd",
			   dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
			   monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
		   });
		  
		// datepicker 클래스 이벤트
		   var now = new Date();
		   var startYear = now.getFullYear();
		   var yearRange = (startYear - 100) +":" + startYear ;
		   // datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
		   //원래 있던 datepicker에 option을 추가하는 방법이다.
		   $( ".datepicker" ).datepicker("option", {
		      "maxDate" : new Date(),
		      yearRange: yearRange
		   });
  	});
  </script>
</head>
<body>
<div class="page-header" style="text-align: center;">
    <h1>공지사항 - 공지 등록</h1>      
  <p>관리자가 직접 공지사항을 등록할 수 있습니다.</p>
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
	<div class="form-group">
		<label>공지시작일</label>
		<input name="startDate" id="startDate" class="form-control datepicker" required="required" autocomplete="off" placeholder="yyyy-MM-dd" >
	</div>
	<div class="form-group">
		<label>공지종료일</label>
		<input name="endDate" id="endDate" class="form-control datepicker" required="required" autocomplete="off" placeholder="yyyy-MM-dd" >
	</div>
<button class="btn btn-default">등록</button>	
<button type="reset" class="btn btn-default">새로입력</button>	
<button type="button" id="cancelBtn" class="btn btn-default">취소</button>	
</form>
</div>
</body>
</html>