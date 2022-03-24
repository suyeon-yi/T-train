<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 소리함</title>
 <style type="text/css">
  	.dataRow:hover{
  		background: #eee;
  		cursor: pointer;
  	}
  </style>
  <script type="text/javascript">
  	$(function(){
  		$(".dataRow").click(function(){
  			var no = $(this).find(".no").text();
  			location = "view.do?no=" + no 
  					+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}&key=${pageObject.key}&word=${pageObject.word}";
  		});
  		//perPageNum 데이터의 변경 이벤트 처리 -> jQuery에 대한 이벤트
  		$("#perPageNumSelect").change(function(){
  			//alert("변경");
  			$("#perPageNumForm").submit();
  		});
  	});
  </script>
</head>
<body>
<div><img src="/upload/banner/qna.jpg" style="width: 100%;">
</div>
<div class="container">
	<div class="row" style="margin-bottom: 5px; margin-top: 10px;">
	<!-- 검색에 대한 div -->
	<div class="col-md-8">
			<form class="form-inline">
			<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
			<div class="input-group">
	   		 	<select name="key" class="form-control">
	   		 		<option value="t" ${(pageObject.key == "t")?"selected":"" }>제목</option>
	   		 		<option value="c" ${(pageObject.key == "c")?"selected":"" }>내용</option>
	   		 		<option value="tc" ${(pageObject.key == "tc")?"selected":"" }>전체</option>
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
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list }" var="vo">
		<tr class="dataRow" data-no=${vo.no }>
			<td class="no">${vo.no }</td>
			<td>
			<!-- 들여쓰기 levNo를 이용해서 공백문자 표시 3칸 적용. &nbsp; - 공백문자 
				 begin : 시작 숫자, end : 끝 숫자 -->
			<c:forEach begin="1" end="${vo.levNo * 2 }">
				&nbsp;
			</c:forEach>
			<!-- 답변글 기호 표시 -->
			<c:if test="${vo.levNo > 0 }">
				<i class="material-icons"><img alt="답글" src="/upload/qna/answer.png" style="width: 20px; height: 20px;"></i>
			</c:if>
			${vo.title }</td>
			<td>${vo.name }(${vo.id })</td>
			<td><fmt:formatDate value="${vo.writeDate }" pattern="yyyy-MM-dd" /></td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="5">
			<pageNav:pageNav listURI="list.do" pageObject="${pageObject }" 
				query="&key=${pageObject.key }&word=${pageObject.word }" />
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<a href="write.do?perPageNum=${pageObject.perPageNum }" class="btn btn-default">질문등록</a>
		</td>
	</tr>
	</table>
</div>
</body>
</html>