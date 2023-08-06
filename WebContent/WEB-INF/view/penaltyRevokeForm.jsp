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
<h1>패널티 회수 신청서</h1><br>
</div>

<div id="body">
	<div id="leftSide"></div>
	
	<div id="center">
		<hr>
		<br>
		<div id="more">
			<div style="width: 50%;">
				아이디 : <input type="text" id="id" value="orange" style="border: 0px; width: 70px;">
			</div>
			<div style="width: 50%; text-align: right;"">
				신청날짜 : <input type="text" id="date" value="2023.08.01" style="border: 0px; width: 70px;">
			</div>
		</div>
		
		
		<div style="width: 100%;">
			<textarea id="reviewReport" rows="10px;" readonly="readonly">가게명 : 토리네 쌀국수</textarea>
		</div>
		<div style="width: 100%;">
			<textarea id="reviewReport" rows="10px;" readonly="readonly">패널티 받은 사유 : 화장실 없음</textarea>
		</div>
		
		<div style="width: 100%; text-align: right; margin-bottom: 3vh;">
			<button id="button">승인</button>
		</div>
		
		<div style="width: 100%;">
			<textarea id="reviewReject" rows="6px;" readonly="readonly">패널티회수 요청 사유 : 화장실 있음</textarea>
			첨부파일 : 파일다운로드하는부분
		</div>
		
		<div style="width: 100%; text-align: right; margin-bottom: 3vh;">
			<button id="button">반려</button>
		</div>
		
	</div>
	
	<div id="rightSide"></div>
</div>

<!-- footer -->
<c:import url="/WEB-INF/view/footer.jsp"></c:import>

</body>
</html>