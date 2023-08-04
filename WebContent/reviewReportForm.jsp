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
<title>reviewReportForm.jsp</title>
<style type="text/css">

#title
{
	text-align: center;
}
#more
{
	
	display: flex;
    width: 65vw;
    justify-content: space-between;
    align-items: center;
}



</style>

</head>
<body>

<!-- header -->
<c:import url="/WEB-INF/view/header_user.jsp"></c:import>

<!-- body -->
<div id="title">
<h2>리뷰신고서</h2><br>
</div>

<hr>

<div id="body">
	<div id="more">
	<button style="width:100px; height: 30px;">신고자</button>
	<button style="width:100px; height: 30px;">신고함</button>
	</div>
	

</div>

</body>
</html>