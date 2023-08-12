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
<title>Main Page</title>

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">
	body5
	{
		margin: 0px;
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	
	#store_header5
	{
		/* position: relative;
	    width: 88vw;
	    align-items: flex-start;
	    padding-top: 1vh;
	    height: 30vh;
	    max-height: 10vh; */
	    
	    position: relative;
      	display: flex;
       	width: 88vw;
       	align-items: flex-start;
       	padding-top: 1vh;
      	margin-left: 6vw;
      	height: 10vh;
     	max-height: 10vh;
	    
	}

	#headerAlarm5
	{
	    width: 70vw;
	    padding-left: 10vw;
	}
	
	#headerLogo5
	{
		display: flex;
		justify-content: flex-end;	
		max-width: 8vw;
	}

	.headerBtn5
	{
	    display: flex;
	    width: 10vw;
	    margin-top: 3vh;
	    padding-left: 55vw;
	    justify-content: space-between;
	    position: static;
	}
	
	.menuBtn5
	{
		display: flex;
		width: 7vw;
		flex-direction: row-reverse;
	}
	
	a
	{
		text-decoration-line: none;
	}
	
	#mypage a
	{
		font-size: 0.9vw;
    	font-weight: bold;
    	color: black;
	}
	
	.sub_list
	{
		position: relative;
	    display: flex;
	    flex-direction: row-reverse;
	    width: 65vw;
	    margin-left: 4.3vw;
	}
	
	.mypage_menu
	{
		position: relative;
	    transition-duration: 0.5s;
	    font-size: 0.8vw;
	    padding-right: 1.8vw;
	    background-color: #f5f3e7;
	    margin-right: 4vw;
	}
	
	.person_listA
	{
		padding-bottom: 0.6vh;
		width: 16vh;
		height: 4em;
		margin-bottom: 2vh;
		margin-top: 1vh;
	}
	
	.person_listB
	{
		padding-bottom: 0.6vh;
		width: 16vh;
		height: 9em;
		margin-bottom: 2vh;
		margin-top: 1vh;
	}
	
	.person_listA li, .person_listB li
	{
		padding-left: 0.5vw;
		padding-top: 0.5vh;
		margin-bottom: 0.5;
	}
	
	.alarm_menu
	{
		transition-duration: 0.5s;
	    font-size: 0.8vw;
	    background-color: #f5f3e7;
	}
	
	.person_listA, .person_listB
	{
		list-style-type: none;
		padding: 0;
	}
	
	.alarm_cl
	{
		font-size: 0.9vw;
    	font-weight: bold;
    	color: black;
	}
	
	.subListBtn
	{
		border: 0;
	}
</style>

<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script type="text/javascript">

$(function() {
    $(".mypage_menu").hide();
    $(".alarm_menu").hide();
    
    $(".mypage_cl").click(function() {
        $(".mypage_menu").fadeToggle(300);
        /* 
        if ($('.alarm_menu').is(':visible'))
        {
        	$(".alarm_menu").hide();
        }
         */
    });
    /* 
    $(".alarm_cl").click(function() {
        $(".alarm_menu").fadeToggle(300);
        
        if ($('.mypage_menu').is(':visible'))
        {
        	$(".mypage_menu").hide();
        }
    });
     */
    
    $("#logout").click(function()
	{
    	//alert("확인");
    	$("#adminForm").attr("action","logout.action");
		$("#adminForm").submit();
	});
   
});

</script>

</head>

<body5>

	<header id="store_header5">
		<div class="headerImg">
			<a href="adminmain.action"><img id="headerLogo5" src="<%=cp %>/images/logo_text.png"></a>
		</div>
		
		<div id="headerAlarm5">
			<div class="headerBtn5">
				<div class="menuBtn5">
					<div id="mypage">
						<a href="#" class="mypage_cl" id="mypagetxt">${admin_name }</a>			
					</div>
				</div>
				
				<!-- 
				<div id="alarm">
						<a href="#" class="alarm_cl">알림</a>
				</div>
				 -->
			</div>
			<div class="sub_list">
				<div class="mypage_menu">
					<ul class="person_listA">
						<li><button type="button" id="adminReg" class="subListBtn">관리자 등록</button>
						<!-- <li><button type="button" id="storeMyPage" class="subListBtn">사업자 메인 페이지</button> -->
						<li><button type="button" id="logout" class="subListBtn" >로그아웃</button>
					</ul>
				</div>
				
				<!-- 
				<div class="alarm_menu">
					<ul class="person_listB">
						<li><a href="#">OOO경고 들어옴</a>
						<li><a href="#">리뷰신고한거 처리됨</a>
						<li><a href="#">리뷰신고한거 처리됨</a>
						<li><a href="#">리뷰신고한거 처리됨</a>
					</ul>
				</div>
				 -->
			</div>
		</div>
	</header>
</body>