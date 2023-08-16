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
<title>user_join.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_info_search.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

</head>
<body>

	

	<div id="infoContainer">
		<!-- 정보찾기타이틀영역 -->
		<div id="searchTitleDiv">
			<div class="headerImg">
				<img id="headerLogo" src="<%=cp %>/images/logo_text.png" onclick="redirect:yameokja.action">
			</div> 
			<div class="searchTitle">
				<span id="searchTitle"> &nbsp;&nbsp;  정보 찾기</span>
			</div>
		</div>

		
		<div class="idSearchTitleDiv">
			<span id="idSearchTitle">아이디 찾기</span>
		</div>

		<!-- 아이디찾기 영역 -->
		<div id="idSearchDiv">


			<!-- 아이디 찾기 위한 항목 영역 -->
			<div class="idSearchListDiv">

				<div class="name">
					이름 <span class="require">*</span>
				</div>

				<div class="tel">
					<div>
						핸드폰번호 <span class="require">*</span>
					</div>
					<div style="margin-top: 9px">인증번호</div>
				</div>

			</div>

			<!-- 아이디 찾기 위한 입력란 영역 -->
			<div class="idSearchInsertDiv">

				<div class="userName">
					<input type="text" id="userName">
				</div>


				<div class="userTel">
					<div>
						<input type="text" id="userTel1">
						<button type="button" id="telAccept1" class="modifyBtn">인증번호전송</button>
						<i id="telSendText" class="accept">인증번호가 전송되었습니다.</i>
					</div>
					<div style="margin-top: 7px">
						<input type="text" id="AcceptNum1">
						<button type="button" id="AcceptNumAccept1" class="modifyBtn">인증번호확인</button>
						<i id="telAcceptText" class="accept">인증번호가 확인되었습니다.</i>
					</div>
				</div>
			</div>
		</div>
		
		
		<div id="idSearchBtnDiv">
			<button type="button" id="idSearchBtn" class="modifyBtn">아이디 찾기</button>
		</div>

		<div id="idSearchReturn" class="accept">
			<i>고객님의 아이디는 ---- 입니다.</i>
		</div>
	

		<div class="pwSearchTitleDiv">
			<span id="pwSearchTitle">비밀번호 찾기</span>
		</div>
		
		<!-- 비밀번호 찾기 영역 -->
		<div id="pwSearchDiv">

			<!-- 비밀번호 찾기 위한 항목 영역 -->
			<div class="pwSeachListDiv">
				<div class="id">
					아이디 <span class="require">*</span>
				</div>

				<div class="tel">
					<div>
						핸드폰번호 <span class="require">*</span>
					</div>
					<div style="margin-top: 9px">인증번호</div>
				</div>

				<div class="password">
					<div>비밀번호 재설정</div>
					<div style="margin-top: 9px">비밀번호 확인</div>
				</div>
			</div>


			<!-- 비밀번호 찾기 위한 입력란 영역 -->
			<div class="pwSearchInsertDiv">
				<div class="userId">
					<input type="text" id="userId">
				</div>

				<div class="userTel">
					<div>
						<input type="text" id="userTel2">
						<button type="button" id="telAccept2" class="modifyBtn">인증번호전송</button>
						<i id="telSendText" class="accept">인증번호가 전송되었습니다.</i>
					</div>
					<div style="margin-top: 7px">
						<input type="text" id="AcceptNum2">
						<button type="button" id="AcceptNumAccept2" class="modifyBtn">인증번호확인</button>
						<i id="telAcceptText" class="accept">인증번호가 확인되었습니다.</i>
					</div>
				</div>

				<div class="userPw">
					<div>
						<input type="password" id="userPw1">
					</div>
					<div style="margin-top: 7px">
						<input type="password" id="userPw2"> <i id="pwAcceptText"
							class="accept">확인되었습니다.</i>
					</div>
				</div>
			</div>
		</div>
		
		<div id="idSearchBtnDiv">
			<button type="button" id="idSearchBtn" class="modifyBtn">비밀번호 변경하기</button>
		</div>
	</div>
	
	<c:import url="footer.jsp"></c:import>

</body>
</html>