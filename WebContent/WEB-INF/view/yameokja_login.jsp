<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500&display=swap');
		
	body
	{
		font-family: 'IBM Plex Sans KR', sans-serif;
		margin: 0;
	}
	
	/* 전체 */
	#fullscreen 
	{
		width: 100%;
	    height: 100vh;
	    display: flex;
	    flex-direction: column;
	    justify-content: flex-start;
	    align-items: center;
	}
	
	/* 로고 */
	#logoArea
	{
		width: 300px;
	    height: 200px;
	    float: left;
	    margin-top: 5vh;
	    margin-bottom: 3vh;
	}
	
	#logo
	{
		max-height: 300px;
		max-width: 300px;
	}
	
	/* 전체로그인구역 */
	#loginArea
	{
		display: flex;
	    flex-direction: column;
	    justify-content: center;
	    width: 350px;
	    height: 40vh;
	    /* float: right; */
	    align-items: center;
	    border: 3px solid #f7f4ea;
	}
	
	#loginForm
	{
		display: flex;
		flex-direction: column;
	}
	
	/* id+pw+loginBtn */
	#loginDiv
	{
		width: 300px;
	    height: 200px;
	    padding-top: 100px;
	    display: flex;
	    flex-direction: column;
	}
	
	/* 회원가입+회원수정 */
	#btnDiv
	{
	    width: 300px;
	    height: 100px;
	    padding-top: 3vh;
	}
	
	#joinBtn, #searchBtn
	{
		width: 148px;
	    border-radius: 5px;
	    margin: auto;
	    font-size: 10pt;
	}
	
	
	/* id+pw */
	#idPwDiv
	{
	    width: 300px;
	    height: 200px;
	}
	
	#user_id, #user_pw
	{
	    width: 300px;
	    height: 35px;
	    border-radius: 5px;
	    margin-top: 1vh;
	}
	
	#user_pw
	{
		margin-top: 30px;
	}
	
	input[type=text], input[type=password]
	{
		height: 25px;
		border: 1px solid #dfdfdf;
	  	border-radius:5px;
	  	text-align: center;
	}
	
	input[type=text]:focus, input[type=password]:focus
	{
		outline: none; 
		border-color: #ef6351; 
		box-shadow: 0 0 5px #ef6351;
	}
	
	.errorMsg
	{
		color: #ef6351;
		font-size: small;
		display: none;
	}
	
	.failLogin
	{
		color: #ef6351;
		font-size: small;
	}
	
	/* loginBtn */
	#loginBtnDiv
	{
		width: 300px;
	    height: 50px;
	}
	
	#loginBtn
	{
		height: 40px;
		width: 300px;
		border-radius: 5px;
		font-size: 12pt;
		font-weight: bold;
	}
	
	.Btn 
	{
		width: 5.5vw;
		height: 28px;
		border-radius: 30px;
		font-size: 0.6vw;
		border: 1px solid #ef6351;
	  	background-color: white;
	  	color: #ef6351;
	  	cursor: pointer;
	  	align-content: center;
	}

	.Btn:hover {
		width: 5.5vw;
		height: 28px;
		border-radius: 30px;
		font-size: 0.6vw;
		border: 1px solid #ef6351;
	  	background-color: #fef1ef;
	  	color: #ef6351;
	  	cursor: pointer;
	  	align-content: center;
	  	box-shadow: 0 0 10px #ef6351;
	}
	
	.Btn:active
	{
		width: 5.5vw;
		height: 28px;
		border-radius: 30px;
		font-size: 0.6vw;
		border: 1px solid #ef6351;
	  	background-color: #f9ab9f;
	  	color: #ef6351;
	  	cursor: pointer;
	  	align-content: center;
	  	box-shadow: 0 0 10px #ef6351;
	}

</style>

<script type="text/javascript">

	$(function()
	{
		window.history.forward(); function noBack()
		{
			window.history.forward();
		}
		
		if ('<%=(String)session.getAttribute("loginCheck")%>' != "null")
			alert("로그인 실패");
		
		$("#loginBtn").click(function()
		{
			$("#IdErr").css("display", "none");	
			$("#PwErr").css("display", "none");
			
			if ($("#user_id").val() == "")
			{
				$("#IdErr").css("display", "inline");
				$("#user_id").focus();
				return;
			}
			
			if ($("#user_pw").val() == "")
			{
				$("#PwErr").css("display", "inline");
				$("#user_pw").focus();
				return;
			}
			
			$("#loginForm").attr("action", "login.action");
			$("#loginForm").submit();
			
		});
		
		$("#joinBtn").click(function()
		{
			$("#loginForm").attr("action", "join.action");
			$("#loginForm").submit();
		});
	});
	
	function enterkey() 
	{
		if (window.event.keyCode == 13) 
		{
			$("#IdErr").css("display", "none");	
			$("#PwErr").css("display", "none");
			
			if ($("#user_id").val() == "")
			{
				$("#IdErr").css("display", "inline");
				$("#user_id").focus();
				return;
			}
			
			if ($("#user_pw").val() == "")
			{
				$("#PwErr").css("display", "inline");
				$("#user_pw").focus();
				return;
			}
			
			$("#loginForm").attr("action", "login.action");
			$("#loginForm").submit();
	    }
	}

</script>

</head>
<body>


<div id="fullscreen">
	<div id="logoArea">
		<img src="<%=cp %>/images/logo_text.png" id="logo">
	</div>

	<div id="loginArea">
		<form action="" id="loginForm" method="post">
			<div id="loginDiv">
				<div id="idPwDiv">
					<input type="text" id="user_id" name="user_id" placeholder=" 사용자 ID">
					<span class="errorMsg" id="IdErr">아이디를 입력해야 합니다.</span>
					<input type="password" id="user_pw" name="user_pw" placeholder=" 사용자 PW" onkeyup="enterkey()">
					<span class="errorMsg" id="PwErr">비밀번호를 입력해야 합니다.</span>
				</div>
				<div id="loginBtnDiv">
					<input type="button" id="loginBtn" name="loginBtn" class="Btn" value="LOGIN">
				</div>
			</div>
			
			<div id="btnDiv">
				<input type="button" id="joinBtn" name="joinBtn" class="Btn" value="회원가입">
				<input type="button" id="searchBtn" name="searchBtn" class="Btn" value="정보찾기">
			</div>
			<input type="hidden" value="${check }" id="check">
		</form>
	</div>
	<c:if test="${sessionScope.check eq 'fail' }">
		 <p class="failLogin">아이디 또는 비밀번호를 잘못 입력했습니다.<br>
		 입력하신 내용을 다시 확인해주세요.</p>
	</c:if>
</div>


</body>
</html>