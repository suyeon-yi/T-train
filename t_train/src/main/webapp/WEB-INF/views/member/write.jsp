<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	$(function(){
		
		//id 중복체크 변수, 비밀번호와 비밀번호 확인이 같은지 체크 변수 -> 전역 변수 선언
		var idCheck = false;
		var pwCheck = false;
		
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
				   
		   //아이디 체크 이벤트
		  $("#id").keyup(function(){
			  idCheck = false;
			 var id = $("#id").val();
			 //공백 문자 처리
			 id = $.trim(id);
			 $("#id").val(id);
			 //alert("입력한 아이디 : " + id);
			 
			 //4자 미만
			 if(id.length < 4){
				 $("#idCheckDiv").removeClass("alert-success");
				 $("#idCheckDiv").addClass("alert-danger");
				 $("#idCheckDiv").text("아이디는 4자 이상 영숫자이여야 합니다.");
				 return;
			 }
			 
			 //20자 초과
			 if(id.length > 20){
				 $("#idCheckDiv").removeClass("alert-success");
				 $("#idCheckDiv").addClass("alert-danger");
				 $("#idCheckDiv").text("아이디는 20자 이내 영숫자이여야 합니다.");
				 return;
			 }
			 
			 //4~20 사이 아이디인 경우 - 중복체크하러 간다. -> 서버로 간다. URL 필요 -> 
			 //화면에 다른 데이터는 변하지 않으면서 일부 처리에 필요한 데이터만 변경. URL은 같다. ->Ajax
			 //중복 안된 경우 (아이디가 null인 경우) -  사용 가능한 아이디 입니다, 중복이 된 경우(아이디가 null이 아닌 경우) - 중복된 아이디 입니다. -> 서버에서 처리
			 // /member/idCheck -> *.do:sitemest 위 아래 메뉴와 카피라이트가 붙는다.
			 //result -> 서버에서 전달해 주는 데이터
			 $("#idCheckDiv").load("/member/idCheck?id="+id, function(result){
				 
				 //결과에 따른 배경색 처리
				 //alert(result);
				 //클래스 다 지우기
				 $("#idCheckDiv").removeClass("alert-success alert-danger");
				 if(result.indexOf("가능한") ==  -1){
				 	//중복된 아이디 인 경우 배경은 빨간색
					 $("#idCheckDiv").addClass("alert-danger");
				 	idCheck = false;
				 }else{
				 	//사용 가능한 아이디 인 경우 배경은 파란색	 
					 $("#idCheckDiv").addClass("alert-success");
				 	idCheck = true;
				 }
			 });
			 
		  });//$("#id").keyup() 이벤트의 끝
			
			 //비밀번호 처리 이벤트
			 $("#pw").keyup(function(){
				 pwCheck = false;
				 //$(this) = $("#pw")
				 var pw = $(this).val();
				 //alert(pw.length);
				 //4자 미만
				 if(pw.length < 4){
					 $("#pwCheckDiv").removeClass("alert-success");
					 $("#pwCheckDiv").addClass("alert-danger");
					 $("#pwCheckDiv").text("비밀번호는 4자 이상이여야 합니다.");
					 return;
				 }
				 //20자 초과
				 if(pw.length > 20){
					 $("#pwCheckDiv").removeClass("alert-success");
					 $("#pwCheckDiv").addClass("alert-danger");
					 $("#pwCheckDiv").text("비밀번호는 20자 이내여야 합니다.");
					 return;
				 }
				 
				 //4 ~ 20 사이 pw2와 같은지 체크
				 var pw2 = $("#pw2").val();
				 if(pw == pw2){
				 //비밀번호와 비밀번호 확인이 같은 경우
					 $("#pwCheckDiv, #pw2CheckDiv").removeClass("alert-danger");
					 $("#pwCheckDiv, #pw2CheckDiv").addClass("alert-success");
					 $("#pwCheckDiv, #pw2CheckDiv").text("적당한 비밀번호 입니다.");
					 pwCheck = true;
				 }else {
				 //비밀번호와 비밀번호 확인이 같지 않은 경우
					 $("#pwCheckDiv, #pw2CheckDiv").removeClass("alert-success");
					 $("#pwCheckDiv, #pw2CheckDiv").addClass("alert-danger");
					 $("#pwCheckDiv").text("비밀번호와 비밀번호 확인은 같아야 합니다.");
					 if(pw2.length < 4)
						 $("#pw2CheckDiv").text("비밀번호확인은 4자 이상이여야 합니다.");
					 else if(pw2.length > 20)
						 $("#pw2CheckDiv").text("비밀번호확인은 20자 이내여야 합니다.");
					 else
						 $("#pwCheckDiv").text("비밀번호와 비밀번호 확인은 같아야 합니다.");
				 }
			 });
			 
			 //비밀번호 확인 처리 이벤트
			 $("#pw2").keyup(function(){
				 pwCheck = false;
				 //$(this) = $("#pw2")
				 var pw2 = $(this).val();
				 //alert(pw2.length);
				 //4자 미만
				 if(pw2.length < 4){
					 $("#pw2CheckDiv").removeClass("alert-success");
					 $("#pw2CheckDiv").addClass("alert-danger");
					 $("#pw2CheckDiv").text("비밀번호확인은 4자 이상이여야 합니다.");
					 return;
				 }
				//20자 초과
				 if(pw2.length > 20){
					 $("#pw2CheckDiv").removeClass("alert-success");
					 $("#pw2CheckDiv").addClass("alert-danger");
					 $("#pw2CheckDiv").text("비밀번호확인은 20자 이내여야 합니다.");
					 return;
				 }
				
				 //4 ~ 20 사이 pw2와 같은지 체크
				 var pw = $("#pw").val();
				 if(pw == pw2){
				 //비밀번호와 비밀번호 확인이 같은 경우
					 $("#pw2CheckDiv, #pwCheckDiv").removeClass("alert-danger");
					 $("#pw2CheckDiv, #pwCheckDiv").addClass("alert-success");
					 $("#pw2CheckDiv, #pwCheckDiv").text("적당한 비밀번호 입니다.");
					 pwCheck = true;
				 }else {
				 //비밀번호와 비밀번호 확인이 같지 않은 경우
					 $("#pwCheckDiv, #pw2CheckDiv").removeClass("alert-success");
					 $("#pwCheckDiv, #pw2CheckDiv").addClass("alert-danger");
					 $("#pw2CheckDiv").text("비밀번호와 비밀번호 확인은 같아야 합니다.");
					 if(pw.length < 4)
						 $("#pwCheckDiv").text("비밀번호확인은 4자 이상이여야 합니다.");
					 else if(pw.length > 20)
						 $("#pwCheckDiv").text("비밀번호확인은 20자 이내여야 합니다.");
					 else
						 $("#pw2CheckDiv").text("비밀번호와 비밀번호 확인은 같아야 합니다.");
				 }
			 });
			 //비밀번호 처리 이벤트의 끝
		
		//회원 가입 이벤트	 
		$("#writeForm").submit(function(){
			
			//alert("아이디 체크 : " + idCheck + "\n비밀번호 체크 : " + pwCheck)
			
			//아이디 중복 체크 - 사용 가능한 아이디인지 확인
			if(!idCheck){
				alert("중복이 되지 않는 적당한 형식의 아이디를 사용하셔야 합니다.");
				$("#id").focus();
				//form 전송을 무시시킨다.
				return false;
			}
			//비밀번호와 비밀번호 확인
			if(!pwCheck){
				alert("비밀번호와 비밀번호 확인의 길이가 4~20이여야 하고 같아야 합니다.");
				$("#pw").focus();
				//form 전송을 무시시킨다.
				return false;
			}
			
			//form 전송을 무시시킨다. -> 나중에 주석 처리
			//return false;
		});
		   
	});//$(function()의 끝
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
   <h1 class="title">Sign Up</h1>
   <form class="contact-form row" action="write.do" method="post" id="writeForm">
      <div class="form-field col-lg-6">
         <div class="alert alert-danger" id="idCheckDiv">아이디는 4자 이상의 영숫자를 입력하셔야 합니다.</div>
         <input id="id" name="id" class="input-text js-input" type="text" pattern="[A-Za-z0-9]{4,20}" required>
         <label class="label" for="id">Id</label>
      </div>
      <div class="form-field col-lg-6">
         <div id="pwCheckDiv" class="alert alert-danger">비밀번호는 4자 이상 입력하셔야 합니다.</div>
         <input id="pw" name="pw" class="input-text js-input" type="password" pattern=".{4,20}" required>
         <label class="label" for="pw">Password</label>
      </div>
      <div class="form-field col-lg-6">
         <div id="pw2CheckDiv" class="alert alert-danger">비밀번호 확인은 4자 이상 입력하셔야 합니다.</div>
         <input id="pw2" name="pw2" class="input-text js-input" type="password" pattern=".{4,20}" required>
         <label class="label" for="pw">Password Check</label>
      </div>
      <div class="form-field col-lg-6">
         <input id="name" name="name" class="input-text js-input" type="text" required>
         <label class="label" for="name">Name</label>
      </div>
      <div class="form-field col-lg-6 ">
         <input id="birth" name="birth" class="input-text js-input datepicker" autocomplete="off" required>
         <label class="label" for="birth">Birth</label>
      </div>
      
      <div class="form-field col-lg-6 ">
         <input id="tel" name="tel" class="input-text js-input" type="text" required>
         <label class="label" for="tel">Tel</label>
      </div>
      
      <div class="form-field col-lg-6 ">
         <input id="email" name="email" class="input-text js-input" type="email" required>
         <label class="label" for="email">E-mail</label>
      </div>
       
      <div class="form-field col-lg-6">
         <label class="label" for="gender">성별 : </label>
         <label class="radio-inline" for="gender">
         <input type="radio" class="btn-check" name="gender" id="gender" value="남자" autocomplete="off" required>남자</label>
         <label class="radio-inline" for="gender">
         <input type="radio" class="btn-check" name="gender" id="gender" value="여자" autocomplete="off" required>여자</label>
      </div>
      
      <div class="form-field col-lg-12">
         <input class="submit-btn" type="submit" value="Submit">
      </div>
   </form>
</section>
</body>
</html>