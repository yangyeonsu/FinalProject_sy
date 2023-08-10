<%@page import="com.yameokja.mc.ReqApplyViewDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	ReqApplyViewDTO dto = (ReqApplyViewDTO)request.getAttribute("err");
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
.errorMsg
{
	color: #ef6351;
	font-size: small;
	display: none;
}

</style>
<script type="text/javascript">
	function reqBtn()
	{
		if ($("#errReport").val() == "")
		{
			$("#err").css("display", "inline");
			$("#errReport").focus();
			return;
		}
	};
</script>

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
		<h2>${err.getSt_name()}</h2>
		
		<div id="stInfo">
			<div id="menu" style="float: left;">
				${err.getChbox_name() }
			</div>
			<div id="menuChild">
				${err.getYn_name() }
			</div>
		</div>
		
		
		<div id="bottom">
			<div id="box" style="padding-top: 5px;">
				<div id="requestReason" style="width: auto;">
					요청사유
					<textarea rows="8px" readonly="readonly" style="font-size: 11pt; ">${err.getReq_rs() }</textarea>
					<button id="agree">요청승인</button>
				</div>
				
				<div id=returnReason>
					반려사유
					<textarea rows="8px" placeholder="반려사유 기재" id="errReport" style="font-size: 11pt;"></textarea>
					<button id="return" onclick="reqBtn()">요청반려</button>
				</div>
				<span class="errorMsg" id="err" style="padding-left: 15vh; font-size: 11pt;">반려사유를 입력해야 합니다.</span>
			</div>
		</div>
		
		
		
				
	</div>
</div>



</body>
</html>