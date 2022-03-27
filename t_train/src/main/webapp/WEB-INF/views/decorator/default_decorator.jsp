<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 이영환 -->
<!-- 작성일 : 2020-06-30 -->
<%@page import="com.t_train.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%
LoginVO loginVO = (LoginVO) session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><decorator:title /></title>
<!-- CDN 방식의 Bootstrap 라이브러리 등록 -> 디자인의 웹표준을 구현한 웹 라이브러리 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<!-- CDN 방식의 Google Icon 라이브러리 등록 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">	

<!-- jQuery UI 라이브러리 CDN 방식으로 등록 : Datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<style type="text/css">
header, footer {
	background: AntiqueWhite;
}

pre {
	background: white;
	border: 0px;
	height: 80px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: white;
	padding: 25px;
	color: black;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

article {
	min-height: 400px;
	margin-top: 80px;
	margin-bottom: 120px;
}

#welcome {
	color: grey;
	margin: 0 auto;
}
#image{
	width: 90px;
	height: 40px;
}
.myNavbar{
 text-align: center;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
		
		//삭제 버튼 이벤트 처리
  		$("#deleteBtn").click(function(){
  			
  			//사용자에게 확인/취소 선택 창 열기 - confirm : 확인 - true, 취소 - false
  			//alert(confirm("정말 삭제하시겠습니까?"));
  			
  			return confirm("정말 삭제하시겠습니까?");
  		
  			//패이지 이동을 막는다 -> 나중에 주석 처리
  			//return false;
  		});
		
	});
</script>
<c:if test="${!empty msg }">
	<script type="text/javascript">
	$(function(){
		var msgShow = true;
		if(msgShow){
			//0.2초(200) 동안 기다렸다가 시간이 끝나면 function을 실행한다.
			//화면에 데이터 보다 alert이 먼저 실행되면 경고창이 떠있는 뒤에 데이터가 보이지 않고 빈창으로 보여진다.
			setTimeout(
				function(){
					alert("${msg}");
				}, 200
			);
			msgShow = false;
		}
	});
	//다른 페이지로 이동을 했다가 뒤로가기 아이콘을 클릭해서 돌아왔을 때
	//해결 방법 -> js 자동 새로고침
// 	alert("${msg}");
// 	location.reload();// F5 누른것과 같음.
	
	//-> 두번째 해결 방법 : 쿠키를 사용하는 방법 -> 사용자 컴퓨터에 데이터 저장(파일로 저장) -> 브라우저 개별 가능
	//isMsg라는 쿠키를 찾아서 가져오는 처리문(정규표현식 사용)
// 	var isMsg = document.cookie.match('^|;) ?isMsg=([^;]*)(;|$');
// 		//isMsg 쿠키가 존재하지 않으면 실행한다.
// 		if(!isMsg){
// 			//메세지 출력
// 			alert("${msg}");
// 			//isMsg 쿠키를 굽는 처리
// 			//1. 현재 날짜 객체를 만들어서 저장한다. expired 날짜 객체 변수가 된다.
// 			expired = new Date();
// 			//2. 현재 날짜 정보를 가지고 7일 동안 유효한 쿠키 셋팅을 위해서 7일 이후 날짜를 계산해서 다시 세팅해준다.
// 			expired.setTime(expired.getTime() + 7 * 24 * 60 * 60 * 1000);
// 			//3. 쿠키 굽기 -> cookie에 key=value;쿠키가 유효한 기간=시간;path=저장위치; => 쿠키의 형식
// 			document.cookie = 'isMsg=' + encodeURIComponent('true') + ';expired=' +expired.toUTCString() + ';path=/';
// 		}
	
	</script>
</c:if>

<decorator:head/>
</head>
<body>
	<header>
<!-- 		<div><img href="#"/></div> -->
		<nav class="navbar navbar-inverse navbar-fixed-top" style="background: #eee; border: none; ">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/main/main.do"><img alt="로고" src="/upload/logo/logo.png" id="image"></a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar" style="padding: 15px;">
					<ul class="nav navbar-nav">
						<li><a href="/train/list.do">기차예매</a></li>
						<li><a href="/notice/list.do">공지사항</a></li>
						<li><a href="/qna/list.do">고객소리함</a></li>
						<% if(loginVO != null && loginVO.getGradeNo() == 9) { %>
							<li><a href="/member/list.do">회원관리</a></li>
						<% } %>
						
					</ul>
					<ul class="nav navbar-nav navbar-right">
					  <% if(loginVO == null){ %>
				      	<li><a href="/member/write.do">회원가입</a></li>
				      	<li><a href="/member/login.do">로그인</a></li>
				      <% } else { %>
				      	<li><a href="/member/view.do">
				      			<%= loginVO.getName() %>(<%= loginVO.getGradeName() %>)
				      		</a></li>
				      	<li><a href="/member/logout.do">로그아웃</a></li>
				      <% } %>
				    </ul>
					
				</div>
			</div>
		</nav>
	</header>
	<!-- header, article, section, footer : HTML 5에서 의미 없는 구성 태그인 div 태그를
		 의미있는 태그로 작성되도록 만든 태그 - 시멘틱 태그 -> 낮은 버전에서는 div로 인식하게 한다. -->
	<article>
		<decorator:body />
	</article>
	<footer class="container-fluid text-center navbar navbar-inverse navbar-fixed-bottom" style="background: #eee; border: none; ">
		<p>개인 프로젝트 - 기차 예매 사이트</p>
	</footer>
</body>
</html>