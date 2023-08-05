<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storeErrReportForm.jsp</title>

<style type="text/css">
#title
{
	text-align: center;
}
#leftSide, #rightSide
{
	width: 10%;
	height: 500px;
}
#center, #leftSide
{
	float: left;
}
#center
{
	width: 80%;
}
#stInfo
{
	width: auto;
	margin: 10vh 0vh 10vh 0vh;
	text-align: center;
	
}
#box
{
	padding-bottom: 2vh;
}
#bottom
{
	width: 100%;
	background-color: lightgray;
	height: auto;
	width: flex;
}

#requestReason, #returnReason
{
	/* display: inline-block; */
	margin-left: 7vh;
	margin-right: 5vh;
	margin-top: 2vh;
}

#menu
{
	background-color: #EDE9D0;
	width: 20vh;
	height: 3vh;
}
#menuChild
{
	padding-right: 50%;
}
textarea {
	resize: none;
	width: 81%;
}

</style>

</head>
<body>

<!-- header -->
<c:import url="/WEB-INF/view/header_admin.jsp"></c:import>
<!-- 사이드바 -->
<div id="leftSideBar">
</div>


<!-- body -->
<div id="title" style="padding: 10px;">
<h1>가게정보오류수정요청서</h1><br>
</div>

<div id="body">
	<div id="leftSide"></div>
	
	<div id="center">
		<hr>
		<br>
		<h2>토리네 도토리묵집</h2>
		
		<div id="stInfo">
			<div id="menu" style="float: left;">
				애견동반
			</div>
			<div id="menuChild">
				가능
			</div>
		</div>
		
		
		<div id="bottom">
			<div id="box" style="padding-top: 5px;">
				<div id="requestReason" style="width: auto;">
					요청사유
					<textarea rows="8px" readonly="readonly"></textarea>
					<button id="agree">요청승인</button>
				</div>
				<div id=returnReason>
					반려사유
					<textarea rows="8px"></textarea>
					<button id="return">요청반려</button>
				</div>
			
			</div>
		</div>
		
		
		
				
	</div>
</div>



</body>
</html>