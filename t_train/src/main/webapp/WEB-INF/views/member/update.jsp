<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<script type="text/javascript">
	$(function() {
		// datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능
		$(".datepicker").datepicker(
				{
					changeMonth : true,
					changeYear : true,
					dateFormat : "yy-mm-dd",
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ]
				});

		var now = new Date();
		var startYear = now.getFullYear();
		var yearRange = (startYear - 100) + ":" + startYear;
		// datepicker - 초기값으로 셋팅하는 방법을 사용하면 2번째는 무시 당한다.
		//원래 있던 datepicker에 option을 추가하는 방법이다.
		$(".datepicker").datepicker("option", {
			"maxDate" : new Date(),
			"yearRange" : yearRange
		});

	});// $(function(){}) 의 끝
</script>
<style type="text/css">
 .get-in-touch { 
   max-width: 800px; 
   margin: 50px auto; 
   position: relative; 

 }
 .get-in-touch .title { 
   text-align: center; 
   text-transform: uppercase; 
   letter-spacing: 3px; 
   font-size: 3.2em; 
   line-height: 48px; 
   padding-bottom: 48px; 
      color: #5543ca; 
     background: #5543ca; 
     background: -moz-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important; 
     background: -webkit-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important; 
     background: linear-gradient(to right,#f4524d  0%,#5543ca  100%) !important; 
     -webkit-background-clip: text !important; 
     -webkit-text-fill-color: transparent !important; 
 }
  .contact-form .form-field { 
   position: relative; 
   margin: 32px 0; 
 }
 .contact-form .input-text { 
   display: block; 
   width: 100%; 
   height: 36px; 
   border-width: 0 0 2px 0; 
   border-color: #5543ca; 
   font-size: 18px; 
   line-height: 26px; 
   font-weight: 400; 
 }
 .contact-form .input-text:focus { 
   outline: none; 
 }
 .contact-form .input-text:focus + .label, 
 .contact-form .input-text.not-empty + .label { 
   -webkit-transform: translateY(-24px); 
           transform: translateY(-24px); 
 }
 .contact-form .label { 
   position: absolute; 
   left: 20px; 
   bottom: 11px; 
   font-size: 18px; 
   line-height: 26px; 
   font-weight: 400; 
   color: #5543ca; 
   cursor: text; 
   transition: -webkit-transform .2s ease-in-out; 
   transition: transform .2s ease-in-out; 
   transition: transform .2s ease-in-out,  
   -webkit-transform .2s ease-in-out; 
 }
  .contact-form .submit-btn { 
   display: inline-block; 
   background-color: #000; 
    background-image: linear-gradient(125deg,#a72879,#064497); 
   color: #fff;
   text-transform: uppercase; 
   letter-spacing: 2px; 
   font-size: 16px; 
	padding: 8px 16px; 	
	border: none;	
	width:200px;
	cursor: pointer;
}
</style>
</head>
<body>
<section class="get-in-touch">
<!-- 	<div class="container"> -->
		<h1 class="title">Edit member information</h1>
		<form action="update.do" method="post" id="updateForm" class="contact-form row">
			<div class="form-field col-lg-6">
				<input id="id" name="id" class="input-text js-input" pattern="[A-Za-z0-9]{4,20}" value="${vo.id }" readonly="readonly" autocomplete="off">
				<label class="label" for="id">Id</label>
			</div>
			
			 <div class="form-field col-lg-6">
				<input id="name" name="name"
					class="input-text js-input" required="required" pattern="[가-힣]{2,10}"
					value="${vo.name }">
				<label class="label" for="name">Name</label> 
			</div>
			
			<div class="form-field col-lg-6">
				<input id="birth" name="birth"
					class="input-text js-input datepicker" required="required"
					value='<fmt:formatDate value="${vo.birth }"/>' autocomplete="off">
				<label class="label" for="birth">Birth</label> 
			</div>
			<div class="form-field col-lg-6">
				<input id="tel" name="tel"
					class="input-text js-input" required="required" value="${vo.tel }">
				<label class="label" for="tel">Tel</label> 
			</div>
			<div class="form-field col-lg-6">
				<input id="email" name="email"
					class="input-text js-input" required="required" value="${vo.email }">
				<label class="label" for="email">E-mail</label> 
			</div>
			<div class="form-field col-lg-6">
				<label class="label" for="gender">성별 : </label>
					<label class="radio-inline">
					<input name="gender" type="radio" value="남자" ${(vo.gender == '남자')?'checked':'' }>남자</label>
					<label class="radio-inline">
					<input name="gender" type="radio" value="여자" ${(vo.gender == '여자')?'checked':'' }>여자</label>
			</div>
			<div class="form-field col-lg-12">
			<input class="submit-btn" type="submit" value="Submit">
			</div>
		</form>
<!-- 	</div> -->
</section>
</body>
</html>