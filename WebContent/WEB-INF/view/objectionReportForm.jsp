<%@page import="com.yameokja.mc.ObjApplyViewDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	ObjApplyViewDTO dto = (ObjApplyViewDTO)request.getAttribute("obj");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>objectionReportForm.jsp</title>

<style type="text/css">

#title
{
	text-align: center;
}
#more
{
	/* display: flex; */
    width: 100%;
    justify-content: space-between;
}
#body div
{
	float: left;
}
#leftSide, #rightSide
{
	width: 10%;
	height: 500px;
}
#center
{
	width: 80%;
}

textarea {
	text-align: left;
	width: 100%;
	
}
#menuTitle
{
	background-color: #EDE9D0;
	width: 20vh;
	height: 3vh;
	text-align: center;
	padding-top: 1vh;
	margin-bottom: 1vh;
	margin-top: 2vh;
}
#button
{
	width: 120px; 
	border-radius: 20px;
}
.errorMsg
{
	color: #ef6351;
	font-size: small;
	display: none;
}

</style>

<script type="text/javascript">
	function rejectBtn()
	{
		if ($("#errReport").val()=="")
		{
			$("#err").css("display", "inline");
			$("#errReject").focus();
			return;
		}
	};
</script>

</head>
<body>

<!-- <form id="adminForm" method="post"> -->

<!-- header -->
<c:import url="/WEB-INF/view/header_admin.jsp"></c:import>
<!-- 사이드바 -->
<div id="leftSideBar">
</div>
		
<!-- body -->
<div id="title" style="padding: 10px;">
<h1>이의 제기 신청서</h1><br>
</div>
		
<div id="body">
	<div id="leftSide"></div>
	
	<div id="center">
		<hr>
		<br>
		<div id="menuTitle">
			경고 내용
		</div>
		
		<div style="width: 100%;">
			<textarea id="objReport" rows="10px;" readonly="readonly" style="font-size: 11pt;">${obj.getReq_rs() }</textarea>
		</div>
		
		<div id="menuTitle">
			이의제기 사유
		</div>
		
		<div style="width: 100%;">
			<textarea id="objReport" rows="10px;" readonly="readonly" style="font-size: 11pt;">${obj.getObj_rs() }</textarea>
		</div>
		
		<div style="width: 100%;">
			${obj.getPhoto_link() }
		</div>
		
		<div style="width: 100%; text-align: right; margin-bottom: 3vh;">
			<button>파일다운로드</button>
		</div>
		
		<div style="width: 100%; text-align: right; margin-bottom: 3vh;">
			<button id="button">승인</button>
		</div>
		
		<div id="menuTitle">
			반려 사유
		</div>
		<div style="width: 100%;">
			<textarea id="errReport" rows="10px;" placeholder="반려사유 기재" style="font-size: 11pt;"></textarea>
		</div>
		
		<span class="errorMsg" id="err">반려사유를 입력해야 합니다.</span>
		<div style="width: 100%; text-align: right;">
			<button id="button" value="반려" onclick="rejectBtn()">반려</button>
		</div>
		
	</div>
	
	<div id="rightSide"></div>
</div>

<!-- footer -->
<c:import url="/WEB-INF/view/footer.jsp"></c:import>
	
</body>
</html>