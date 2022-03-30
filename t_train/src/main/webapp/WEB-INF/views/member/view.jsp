<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<script type="text/javascript">
    // body(문서-document)가 가 로딩되면 동작이 되도록 선언한 상태
$(function(){
    // deleteDiv id를 찾아서 숨긴다.(hide)
    // deleteDiv가 보였다가 숨겨진다. -> 원래부터 안보이기 CSS의 visiability
    $("#updateDiv").hide();
    $("#deleteDiv").hide();
});
</script>
</head>
<body>
<div class="container">
	<h2>${title }</h2>
	<table class="table">
	<tr>
		<th>아이디</th>
		<td>${vo.id }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${vo.name }</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${vo.gender }</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><fmt:formatDate value="${vo.birth }" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<th>연락처</th>
		<td>${vo.tel }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${vo.email }</td>
	</tr>
	<tr>
		<th>가입일</th>
		<td><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<th>등급</th>
		<td>${vo.gradeName }</td>
	</tr>
	<tr>
		<td colspan="2">
		<c:if test="${empty param.id }">
		<!-- 개인 메뉴 -->
			<a onclick="$('#updateDiv').show();" class="btn btn-default">정보수정</a>
			<c:if test="${login.gradeNo != 9}">
			<a onclick="$('#deleteDiv').show();" class="btn btn-default">회원탈퇴</a>
			</c:if>
            	<div id="updateDiv">
					<h3>수정에 필요한 정보입력</h3>
				        <form action="update.do?id=${vo.id }&page=${param.page }&perPageNum=${param.perPageNum}&key=${param.key }&word=${param.word}">
				            <label for="id">아이디</label><input name="id" id="id">
				            <label for="pw">비밀번호</label><input name="pw" id="pw" type="password">
				            <button class="btn btn-default">수정</button>
				            <a type="button" onclick="$('#updateDiv').hide();" class="btn btn-default">취소</a>
				        </form>
				</div>
            	<div id="deleteDiv">
					<h3>삭제에 필요한 정보입력</h3>
				        <form action="delete.do">
				            <label for="id">아이디</label><input name="id" id="id">
				            <label for="pw">비밀번호</label><input name="pw" id="pw" type="password">
				            <button class="btn btn-default">삭제</button>
				            <a type="button" onclick="$('#deleteDiv').hide();" class="btn btn-default">취소</a>
				        </form>
				</div>
		</c:if>
		<c:if test="${login.gradeNo == 9 && !empty param.id && login.id != vo.id}">
		<!-- 관리자 메뉴 : 관리자 & 넘어오는 아이디가 있다 & 넘어오는 아이디가 관리자가 아니다 -->
		<!-- 상태 변경 -->
			<form action="changeStatus.do" method="post">
			<input type="hidden" name="id" value="${vo.id }">
			<input type="hidden" name="page" value="${param.page }">
			<input type="hidden" name="perPageNum" value="${param.perPageNum }">
				<div class="input-group">
					<select name="status" class="form-control">
						<option ${(vo.status == "정상")?"selected":"" }>정상</option>
						<option ${(vo.status == "탈퇴")?"selected":"" }>탈퇴</option>
						<option ${(vo.status == "강퇴")?"selected":"" }>강퇴</option>
						<option ${(vo.status == "휴면")?"selected":"" }>휴면</option>
					</select>
					<div class="input-group-btn">
						<button class="btn btn-default">변경</button>
					</div>
				</div>
			</form>
			<!-- 등급 변경 -->
			<form action="changeGradeNo.do" method="post">
			<input type="hidden" name="id" value="${vo.id }">
			<input type="hidden" name="page" value="${param.page }">
			<input type="hidden" name="perPageNum" value="${param.perPageNum }">
				<div class="input-group">
					<select name="gradeNo" class="form-control">
						<option ${(vo.gradeNo == 1)?"selected":"" } value="1">일반회원</option>
						<option ${(vo.gradeNo == 9)?"selected":"" } value="9">관리자</option>
					</select>
					<div class="input-group-btn">
						<button class="btn btn-default">변경</button>
					</div>
				</div>
			</form>
		</c:if>
		</td>
	</tr>
	</table>
</div>
</body>
</html>