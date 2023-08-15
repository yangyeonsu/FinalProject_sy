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
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_modify.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".accept").css("display", "none");
		
		
		$(".ibmatlabel").click(function()
		{
			$(".ibmatCB").each(function()
			{
				var $this = $(this);
				
				var id = $this.attr("id");
				
				if ($this.is(":checked"))					
					$(".ibmatlabel[for="+id+"]").css("border-bottom","3px solid #ef6351");
				else
					$(".ibmatlabel[for="+id+"]").css("border-bottom","none");
					
			})
		}) 
	});
</script>


</head>
<body>

<c:import url="header_user.jsp"></c:import>

<div class="joinContainer">
	<!-- 회원가입타이틀영역 -->
	<div class="joinTitleDiv">
		<div class="joinTitle">
			<span id="joinTitle">회원정보 수정</span>
		</div>
	</div>
	
	<div class="insertTitleDiv">
		<span id="insertTitle">기본정보 수정</span>
	</div>
	
	<!-- 회원정보기입영역 -->
	<div class="userInfoDiv">
		<!-- 회원정보기입 항목 영역 -->
		<div class="joinListDiv">
		
			<div class="name">
				이름 
			</div>
			
			<div class="ssn">
				주민번호 
			</div>
			
			<div class="tel">
				<div>핸드폰번호</div>
			</div>
			
			<div class="id">
				아이디
			</div>
			
			<div class="password">
				<div>비밀번호</div>
				<div>비밀번호 확인</div>
			</div>
			
			<div class="nickname">
				닉네임
			</div>
			
			<div class="email">
				이메일
			</div>
			
		</div>
		
		<!-- 회원정보 입력란 영역 -->
		<div class="joinInsertDiv">
		
			<div class="userName">
				<input type="text" id="userName" readonly="readonly">
			</div>
			<div class="userSsn">
				<input type="text" id="userSsn1" readonly="readonly">&nbsp;&nbsp;-&nbsp;
				<input type="password" id="userSsn2" readonly="readonly">
			</div>
			
			<div class="userTel">
				<div>
					<input type="text" id="userTel" readonly="readonly">
				</div>
			</div>
			
			<div class="userId">
				<input type="text" id="userId">
			</div>
			
			<div class="userPw">
				<div>
					<input type="password" id="userPw1">
				</div>
				<div>
					<input type="password" id="userPw2">
					<i id="pwAcceptText" class="accept">확인되었습니다.</i>
				</div>
			</div>
			
			<div class="userNickName">
				<input type="text" id="userNickName">&nbsp;&nbsp;
				<button type="button" id="nickNameAccept" class="joinBtn">중복검사</button>
				<i id="nNAcceptText" class="accept">사용할 수 있는 닉네임입니다.</i>
				<br>
			</div>
			
			<div class="userEmail">
				<input type="text" id="userEmail"> @ 
				<select name="email" class="emailSelect">
					<option value="self" selected="selected">직접입력</option>
					<option value="naver">naver.com</option>
					<option value="kakao">kakao.com</option>
					<option value="google">google.com</option>
					<option value="yahoo">yahoo.com</option>
				</select>
			</div>
			
		</div>
	</div>
	
	
	<!-- 회원입맛정보기입영역 -->
	<div class="userIbmat">
		<div class="ibmatTitleDiv">
			<span id="ibmatTitle">입맛키워드 수정</span> &nbsp;&nbsp;&nbsp;&nbsp;
			<i id="ibmatText">추후 가게 추천에 사용됩니다.</i>
		</div>
	
		<div class="ibmatSelectDiv">
			<div class="selectLeft">
				<label class="ibmatlabel" for="ibmat1">
					<input type="checkbox" class="ibmatCB" id="ibmat1">
					진라면 순한맛 맵기가 좋아요
				</label>
				<br><br>
				
				
				<label class="ibmatlabel" for="ibmat2">
					<input type="checkbox" class="ibmatCB" id="ibmat2">
					신라면 맵기가 좋아요
				</label>
				<br><br>
			
				<label class="ibmatlabel" for="ibmat3">
					<input type="checkbox" class="ibmatCB" id="ibmat3">
					불닭 맵기가 좋아요
				</label>
				<br><br>
					
			
				<label class="ibmatlabel" for="ibmat4">
					<input type="checkbox" class="ibmatCB" id="ibmat4">
					담백한게 좋아요
				</label>
				<br><br>
			</div>
			
			<div class="selectRight">	
				<label class="ibmatlabel" for="ibmat5">
					<input type="checkbox" class="ibmatCB" id="ibmat5">
					단맛이 좋아요
				</label>
				<br><br>
			
				<label class="ibmatlabel" for="ibmat6">
					<input type="checkbox" class="ibmatCB" id="ibmat6">
					향신료는 어려워요
				</label>
				<br><br>
				
				<label class="ibmatlabel" for="ibmat7">
					<input type="checkbox" class="ibmatCB" id="ibmat7">
					매운맛을 좋아해요?
				</label>
			</div>
		</div>
	</div>
	
	<!-- 가입하기 버튼 -->
	<div class="joinBtnDiv">
		<button type="button" id="joinBtn" class="joinBtn">수정하기</button>
	</div>
	
	<!-- 탈퇴하기 버튼 -->
	<div class="leaveBtnDiv">
		<button type="button" id="leaveBtn" class="leaveBtn">계정탈퇴하기</button>
	</div>
</div>

<c:import url="footer.jsp"></c:import>

</body>
</html>