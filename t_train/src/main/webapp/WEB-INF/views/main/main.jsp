<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T-train</title>
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

:root {
  --secondary-color: #151226;
  --contrast-color: #3385ff;
}
.overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  height: 100%;
  z-index: -10;
  background-color: var(--contrast-color);
}

.container {
  display: flex;
  height: 100vh;
  justify-content: space-around;
  align-items: center;
  color: #fff;
  animation: expand .8s ease forwards;
  background-color: var(--secondary-color);
  position: relative;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  transition: all .8s ease;
}

.container_content {
 width: 50%;
}

.container_content_inner {
  width: 80%;
  margin-left: 80px;
}

.container_outer_img {
  margin: 50px;
  width: 50%;
  overflow: hidden;
}   
    
.container_img {
  width: 100%;
  animation: slideIn 1.5s ease-in-out forwards;
}

.par {
  height: auto;
  overflow: hidden;
}

p{
  line-height: 28px;
  transform: translateY(300px);
  animation: slideUp .8s ease-in-out forwards .8s;
}

.btns {
  height: 100%;
  position: relative;
  width: 150px;
  overflow: hidden;
}

.btns_more {
  background: transparent;
  border: 1px solid var(--contrast-color);
  border-radius: 50px;
  padding: 8px 12px;
  color: #b3d1ff;
  font-size: 16px;
  text-transform: uppercase;
  position: relative;
  margin-top: 15px;
  outline: none;
  transform: translateY(50px);
  animation: slideUp .8s ease-in-out  forwards 1s;
}

.title {
  overflow: hidden;
  height: auto;
}

h1 {
    font-size: 40px;
    color: var(--contrast-color);
    margin-bottom: 20px;
    transform: translateY(100px);
    animation: slideUp .8s ease forwards .5s;
}

@keyframes slideIn {
  0% {
    transform: translateX(500px) scale(.2);
  }
  100% {
    transform: translateX(0px) scale(1);
  }
}

@keyframes slideUp {
  0% {
    transform: translateY(300px);
  }
  100% {
    transform: translateY(0px);
  }
}

@keyframes expand {
  0% {
    transform: translateX(1400px);
  }
  100% {
    transform: translateX(0px);
  }
}

</style>
</head>
<body>
<div class= 'container'>
<div class="container_content">
<div class="container_content_inner">
<div class="title">
  <h1>T-train</h1>
</div>
<div class="par">
<p>
기차 예매를 위한 시간표 조회, 명절 기간 예매에 관한 공지, 사이트 이용에 관한 고객 소리함까지 필요한 서비스를 자유롭게 이용하세요.
</p>
</div>
<div class="btns">
<c:if test="${!empty login }">
<button class='btns_more' onclick="location.href='/train/write.do'"> Train </button>
<button class='btns_more' onclick="location.href='/notice/list.do'"> Notice </button>
<button class='btns_more' onclick="location.href='/qna/list.do'"> QnA </button>
</c:if>
<c:if test="${empty login }">
<button class='btns_more' onclick="location.href='/member/login.do'"> Login </button>
</c:if>
</div>
</div>
</div>
 <div class="container_outer_img">
 <div class="img-inner">
 <img src='/upload/main/trainimg.jpg'  alt="" class="container_img"/>
       </div>
     </div>
  </div>
<div class="overlay"></div>
</body>
</html>