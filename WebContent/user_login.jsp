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

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
	
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
		width: 100vw;
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
	    margin-top: 10vh;
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
	    height: 23vh;
	    padding-top: 50px;
	    display: flex;
	    flex-direction: column;
	}
	
	/* 회원가입+회원수정 */
	#btnDiv
	{
	    width: 300px;
	    height: 100px;
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
	    height: 100px;
	}
	
	#userId, #userPw
	{
	    width: 300px;
	    height: 35px;
	    margin-bottom: 2vh;
	    border-radius: 5px;
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
	
	/* loginBtn */
	#loginBtnDiv
	{
		width: 300px;
	    height: 50px;
	    margin-top: 2vh;
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
</head>
<body>


<div id="fullscreen">
	<div id="logoArea">
		<img src="<%=cp %>/images/logo_text.png" id="logo">
	</div>

	<div id="loginArea">
		<form action="" id="loginForm">
			<div id="loginDiv">
				<div id="idPwDiv">
					<input type="text" id="userId" name="userId" placeholder=" 사용자 ID"><br>
					<input type="password" id="userPw" name="userPw" placeholder=" 사용자 PW">
				</div>
				<div id="loginBtnDiv">
					<input type="button" id="loginBtn" name="loginBtn" class="Btn" value="LOGIN">
				</div>
			</div>
			
			<div id="btnDiv">
				<input type="button" id="joinBtn" name="joinBtn" class="Btn" value="회원가입">
				<input type="button" id="searchBtn" name="searchBtn" class="Btn" value="정보찾기">
			</div>
			
		</form>
	</div>
</div>

</body>
</html>