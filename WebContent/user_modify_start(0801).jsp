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
<title>user_modify.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_modify_start(0801).css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>


</head>
<body>

<c:import url="header_user_sh(0801).jsp"></c:import>

<div class="modifyPwTitleDiv">

	<div class="modifyPwTitle">
		<span id="modifyTitle">비밀번호 입력</span>
	</div>

	<!-- 비밀번호 확인 내역 -->
	<div class="pwInsertDiv">
		<!-- 회원정보기입 항목 영역 -->
		<div class="pwInsertListDiv">
			<div>비밀번호</div>
			<div>비밀번호 확인</div>
		</div>
		
		<!-- 회원정보 입력란 영역 -->
		<div class="pwInsert">
			<div>
				<input type="password" id="userPw1">
			</div>
			<div>
				<input type="password" id="userPw2">
			</div>
		</div>
	</div>
	
	<!-- 가입하기 버튼 -->
	<div class="pwInsertBtnDiv">
		<button type="button" id="pwInsertBtn" class="pwInsertBtn">입력</button>
	</div>
</div>

<c:import url="footer.jsp"></c:import>

</body>
</html>