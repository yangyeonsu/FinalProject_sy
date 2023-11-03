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
	footer
	{
	    display: flex;
	    justify-content: space-around;
	    width: 95.8vw;
	    height: 15vh;
	    font-size: 0.8vw;
	    color: #9b9b9b;
	    background-color: #f9f9f9;
	    padding-top: 10vh;
	    padding-left: 3vw;
	    margin-top: 5vh;
	}
	
	.ftNav
	{
		padding-top: 5vh;
		padding-left: 4.5vw;
	}
	
	.ftStAdd
	{
		padding-top: 5vh;
		padding-right: 4vw;
	}
	
	#fsa
	{
		background-color: #EF6351;
		border: 1px #EF6351;
		border-radius: 8px;
		color: white;
		font-size: 10pt;
		font-family: 'IBM Plex Sans KR', sans-serif;
		cursor: pointer;
	}
	

</style>

<script type="text/javascript">

	$(function()
	{
		$("#fsa").click(function()
		{
			$("#userForm").attr("action","storegiinsertform.action");
			$("#userForm").submit();
		});
	});

</script>

</head>

<body>

<footer>
	<div class="ftCompany">
		[회사정보]<br>
		상호 : 야먹자어때<br>
		대표 : 양수현<br>
		주소 : 서울 마포구 월드컵북로 21, 2층<br>
		개인정보관리 책임자 : 양수현 (xuhyeon@yameokja.com)<br>
	</div>
	
	<div class="ftNav">
		회사소개   |   이용 가이드   |   개인정보보호정책   |   이용약관
	</div>
	
	<div class="ftCs">
	
	</div>
	<!-- onclick="location.href='storegiinsertform.action'" -->
	<c:if test="${admin_num eq NULL }">
		<div class="ftStAdd">
			<button type="button" id="fsa" class="fsaBtn" >사업자 등록하기</button>
		</div>
	</c:if>
</footer>	

</body>

</html>