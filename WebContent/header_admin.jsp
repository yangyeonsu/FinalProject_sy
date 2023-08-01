<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>user store</title>

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">

	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500&display=swap');
	
	body
	{
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
		
	header
	{
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 90vw;
		height: 8vh;
		margin-top: 1vh;
		margin-left: 6vw;
		margin-right: 4vw;
	}
	
	.gotoMain
	{
		width: 5vw;
		height: 3vh;
	}
	
	 .gotoMainImg
	{
		max-width: 10vw;
	}
	
	.menu
	{
		display: flex;
		justify-content: space-evenly;
	    align-items: center;
		width: 25vw;
	}
	
	.cl
	{
		font-size: 0.8vw;
	}
	
	#mypagetxt
	{
		font-size: 1vw;
	}
	
	#mypage a, #main a, #logout a, #alarm a, #stMain a
	{
		text-decoration: none;
		color: #3a001e;
	}
	
	#mypage a
	{
		font-weight: bold;
	}
	
	#gotoMainImg
	{
		size: 100%;
	}

</style>

</head>

<body>
<!-- 사용구역 : 관리자페이지 -->
<header>
	<div>
		<a href="" class="gotoMain">
			<img class="gotoMainImg" src = "<%=cp %>/images/logo_text.png">
		</a>
	</div>
	<div class="menu">
		<div id="mypage">
			<a href="" class="cl" id="mypagetxt">이순신(관리자)님</a>			
		</div>
		<div id="logout">
			<a href="" class="cl">로그아웃</a>
		</div>
<!-- 		<div id="alarm">
			<a href="" class="cl">알림</a>
		</div> -->
	</div>
</header>