<%@page import="com.yameokja.mc.RevoApplyViewDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	RevoApplyViewDTO dto = (RevoApplyViewDTO)request.getAttribute("revo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>penaltyRevoketForm.jsp</title>
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
	function revokeBtn()
	{
		//alert("확인");
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

<!-- header -->
<c:import url="/WEB-INF/view/header_admin.jsp"></c:import>
<!-- 사이드바 -->
<div id="leftSideBar">
</div>
	
	
<!-- body -->
<div id="title" style="padding: 10px;">
<h1>패널티 회수 신청서</h1><br>
</div>

<div id="body">
	<div id="leftSide"></div>
	
	<div id="center">
		<hr>
		<br>
		<div id="more">
			<div style="width: 50%;">
				아이디 : <input type="text" id="id" value=<%=dto.getUser_id() %> style="border: 0px; width: 70px;">
			</div>
			<div style="width: 50%; text-align: right;"">
				신청날짜 : <input type="text" id="date" value=<%=dto.getReg_date() %> style="border: 0px; width: 70px;">
			</div>
		</div>
		
		<div style="width: 100%;">
			가게명 : <input type="text" id="id" value=<%=dto.getSt_name() %> style="border: 0px; width: 70px;">
		</div>
		<div style="width: 100%;">
			<textarea id="penaltyRevokeReport" rows="8px;" readonly="readonly" wrap="hard" style="font-size: 11pt;">패널티 받은 사유 : ${revo.getReq_rs() }</textarea>
		</div>
		<div style="width: 100%;">
			<textarea id="penaltyRevokeReport" rows="8px;" readonly="readonly" style="font-size: 11pt;">패널티회수 요청 사유 : ${revo.getRevo_rs() }</textarea>
		</div>
		
		<div style="width: 100%; text-align: right; margin-bottom: 3vh;">
			<button id="button">승인</button>
		</div>
		
		<div style="width: 100%;">
			<textarea id="errReport" rows="6px;" style="font-size: 11pt;" placeholder="반려사유 기재"></textarea>
			<span class="errorMsg" id="err">반려사유를 입력해야 합니다.</span>
		</div>
		첨부파일 : ${revo.getPhoto_link() }
		
		<div style="width: 100%; text-align: right;">
			<button id="button" value="반려" onclick="revokeBtn()">반려</button>
		</div>
	
		
		
	</div>
	
	<div id="rightSide"></div>
</div>

<!-- footer -->
<c:import url="/WEB-INF/view/footer.jsp"></c:import>


</body>
</html>