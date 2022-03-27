<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Train Timetable</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
$( function() {
    $( ".datepicker" ).datepicker({ minDate: 0});
} );
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
	background: -moz-linear-gradient(left, #f4524d 0%, #5543ca 100%)
		!important;
	background: -webkit-linear-gradient(left, #f4524d 0%, #5543ca 100%)
		!important;
	background: linear-gradient(to right, #f4524d 0%, #5543ca 100%)
		!important;
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

.contact-form .input-text:focus+.label, .contact-form .input-text.not-empty+.label
	{
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
	transition: transform .2s ease-in-out, -webkit-transform .2s ease-in-out;
}

.contact-form .submit-btn {
	display: inline-block;
	background-color: #000;
	background-image: linear-gradient(125deg, #a72879, #064497);
	color: #fff;
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 16px;
	padding: 8px 16px;
	border: none;
	width: 200px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div>
		<img src="/upload/banner/train.jpg" style="width: 100%;">
	</div>
	<script type="text/javascript">
	$(".submit-btn").click(function(){
		
	});
	</script>
	<section class="get-in-touch">
		<form action="write.do" method="post" class="contact-form row"
			id="writeForm">
			<div class="form-field col-lg-6">
				<input id="depPlandTime" name="depPlandTime" class="input-text js-input datepicker"
					type="text" autocomplete="off" required> <label class="label" for="depPlandTime">출발일</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="depplacename" name="depplacename"
					class="input-text js-input" type="text" required> <label
					class="label" for="depplacename">출발역</label>
			</div>
			<div class="form-field col-lg-6">
				<input id="arrplacename" name="arrplacename"
					class="input-text js-input" type="text" required> <label
					class="label" for="arrplacename">도착역</label>
			</div>
			<div class="form-field col-lg-12">
				<input class="submit-btn" type="submit" value="시간표 조회">
			</div>
		</form>
	</section>
</body>
</html>