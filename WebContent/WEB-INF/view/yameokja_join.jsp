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
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_join.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".accept").css("display", "none");
		
		
		$(".ibmatlabel").click(function()
		{
			var $this = $(this);
			
			var id = $this.attr("for");
			
			if ($("#"+id).is(":checked"))			
				$(".ibmatlabel[for="+id+"]").css("border-bottom","3px solid #ef6351");
			else
				$(".ibmatlabel[for="+id+"]").css("border-bottom","none");
		});
		
		
		$("#joinBtn").click(function()
		{
			$(".accept").css("display", "none");
			var blank_pattern = /[\s]/g;
			
			if ($("#userName").val() == "")
			{
				$("#nameError").css("display", "inline");
				$("#userName").focus();
				return;
			}
			if ($("#userSsn1").val() == "")
			{
				$("#ssnError").css("display", "inline");
				$("#userSsn1").focus();
				return;
			}
			if ($("#userSsn2").val() == "")
			{
				$("#ssnError").css("display", "inline");
				$("#userSsn2").focus();
				return;
			}
			if ($("#userTel").val() == "")
			{
				$("#telError").css("display", "inline");
				$("#userTel").focus();
				return;
			}
			
			if ($("#telAccept").val() == "false")
			{
				$("#telError").html("인증번호 전송 버튼을 눌러주세요.");
				$("#telError").css("display", "inline");
				$("#telAccept").focus();
				return;
			}
			
			if ($("#AcceptNum").val() == "")
			{
				$("#acceptNumError").css("display", "inline");
				$("#AcceptNum").focus();
				return;
			}
			
			if ($("#AcceptNumAccept").val() == "false")
			{
				$("#acceptNumError").html("인증번호 확인 버튼을 눌러주세요.");
				$("#acceptNumError").css("display", "inline");
				$("#AcceptNumAccept").focus();
				return;
			}
			
			if ($("#userId").val() == "")
			{
				$("#idError").css("display", "inline");
				$("#userId").focus();
				return;
			}
			else if (blank_pattern.test($("#userId").val()) == true)
			{
				$("#idError").html("아이디에는 공백을 사용할 수 없습니다.");
				$("#idError").css("display", "inline");
				$("#userId").focus();
				return;
			}
			
			if ($("#idAccept").val() == "false")
			{
				$("#idError").html("중복 확인 버튼을 눌러주세요.");
				$("#idError").css("display", "inline");
				$("#idAccept").focus();
				return;
			}
			
			if ($("#userPw").val() == "")
			{
				$("#pw1Error").css("display", "inline");
				$("#userPw1").focus();
				return;
			}
			if ($("#userPwCheck").val() == "")
			{
				$("#pw2Error").css("display", "inline");
				$("#userPw2").focus();
				return;
			}
			if ($("#userNickName").val() == "")
			{
				$("#nickNameError").css("display", "inline");
				$("#userNickName").focus();
				return;
			}
			
			if ($("#nickNameAccept").val() == "false")
			{
				$("#nickNameError").html("중복 확인 버튼을 눌러주세요.");
				$("#nickNameError").css("display", "inline");
				$("#nickNameAccept").focus();
				return;
			}
			
			$("#joinForm").attr("action", "joinsend.action");
			$("#joinForm").submit();			
			
		});
		
		
		
		
		$("#telAccept").click(function()
		{
			$("#telError").css("display", "none");
			$("#telAccept").val("true");
		});
		
		$("#AcceptNumAccept").click(function()
		{
			$("#acceptNumError").css("display", "none");
			$("#AcceptNumAccept").val("true");
		});
		
		
		$("#idAccept").click(function()
		{
			var blank_pattern = /[\s]/g;
			$("#idError").css("display", "none");

			$.ajax(
			{
				type: "GET"
				, url:"idduplicheck.action" 
	            , data: "userid=" + $.trim($("#userId").val())
				, dataType: "json"
				, beforeSend: function()
				{
					var str = $("#userId").val();
					if (str == "")
					{
						$("#idError").css("display", "inline");
						$("#userId").focus();
						return false;
					}
				}
				, success:function(data)
				{
					if (data.count == "0")
					{
						$("#idAcceptText").css("display", "inline");
						$("#idAccept").val("true");
					}
					else if (data.count == "-1")
					{
						$("#idAcceptText").html("아이디에는 공백을 사용할 수 없습니다.");
						$("#idAcceptText").css("display", "inline");
					}
					else
					{
						$("#idAcceptText").html("이미 존재하는 아이디 입니다.");
						$("#idAcceptText").css("display", "inline");
					}
				}
				, err:function(e)
				{
					alert(e.responseText);
				}
			});
		});
		
		$("#nickNameAccept").click(function()
		{
			$("#nickNameError").css("display", "none");
			
			$.ajax(
			{
				type: "GET"
				, url:"nickduplicheck.action" 
	            , data: "usernick=" + $.trim($("#userNickName").val())
				, dataType: "json"
				, beforeSend: function()
				{
					if ($("#userNickName").val() == "")
					{
						$("#nickNameError").css("display", "inline");
						$("#userNickName").focus();
						return false;
					}
				}
				, success:function(data)
				{
					if (data.count == "0")
					{
						$("#nNAcceptText").css("display", "inline");
						$("#nickNameAccept").val("true");
					}
					else
					{
						$("#nNAcceptText").html("이미 존재하는 닉네임 입니다.");
						$("#nNAcceptText").css("display", "inline");
					}
				}
				, err:function(e)
				{
					alert(e.responseText);
				}
			});
		});
		
		
	});
	
	
	
</script>


</head>
<body>
<form action="" id="joinForm" method="post">


<div class="joinContainer">
	<!-- 회원가입타이틀영역 -->
	<div class="joinTitleDiv">
		<a href="" class="gotoMain">
			<img class="gotoMainImg" src ="<%=cp %>/images/logo_text.png">
		</a>
		<div class="joinTitle">
			<span id="joinTitle">회원가입</span>
		</div>
	</div>
	
	<div class="insertTitleDiv">
		<span id="insertTitle">기본정보 기입</span>
	</div>
	

	<!-- 회원정보기입영역 -->
	<div class="userInfoDiv">
		<!-- 회원정보기입 항목 영역 -->
		<div class="joinListDiv">
		
			<div class="name">
				이름 <span class="require">*</span>
			</div>
			
			<div class="ssn">
				주민번호 <span class="require">*</span>
			</div>
			
			<div class="tel">
				<div>핸드폰번호 <span class="require">*</span></div>
				<div>인증번호</div>
			</div>
			
			<div class="id">
				아이디 <span class="require">*</span>
			</div>
			
			<div class="password">
				<div>비밀번호 <span class="require">*</span></div>
				<div>비밀번호 확인 <span class="require">*</span></div>
			</div>
			
			<div class="nickname">
				닉네임 <span class="require">*</span>
			</div>
			                            
			<div class="email">
				이메일
			</div>
			
		</div>
		
		<!-- 회원정보 입력란 영역 -->
		<div class="joinInsertDiv">
		
			<div class="userName">
				<input type="text" id="user_name" name="user_name">
				<span id="nameError" class="accept">이름을 입력해주세요.</span>
			</div>
			
			<div class="userSsn">
				<input type="text" id="user_ssn1" name="user_ssn1">&nbsp;&nbsp;-&nbsp;
				<input type="password" id="user_ssn2" name="user_ssn2">
				<span id="ssnError" class="accept">주민등록번호를 입력해주세요.</span>
			</div>
			
			<div class="userTel">
				<div>
					<input type="text" id="user_tel" name="user_tel">
					<button type="button" id="telAccept" class="joinBtn" value="false">인증번호전송</button>
					<span id="telError" class="accept">전화번호를 입력해주세요.</span>
					<i id="telSendText" class="accept">인증번호가 전송되었습니다.</i>
				</div>
				<div>
					<input type="text" id="AcceptNum">
					<button type="button" id="AcceptNumAccept" class="joinBtn" value="false">인증번호확인</button>
					<span id="acceptNumError" class="accept">인증번호를 입력해주세요.</span> 
					<i id="telAcceptText" class="accept">인증번호가 확인되었습니다.</i>
				</div>
			</div>
			
			<div class="userId">
				<input type="text" id="user_id" name="user_id">
				<button type="button" id="idAccept" class="joinBtn" value="false">중복검사</button>
				<span id="idError" class="accept">아이디를 입력해주세요.</span> 
				<span id="idAcceptText" class="accept">사용할 수 있는 아이디입니다.</span>
				<br>
			</div>
			
			<div class="userPw">
				<div>
					<input type="password" id="user_pw" name="user_pw">
					<span id="pw1Error" class="accept">비밀번호를 입력해주세요.</span> 
				</div>
				<div>
					<input type="password" id="userPwCheck">
					<span id="pw2Error" class="accept">비밀번호를 한번 더 입력해주세요.</span> 
					<i id="pwAcceptText" class="accept">확인되었습니다.</i>
				</div>
			</div>
			
			<div class="userNickName">
				<input type="text" id="user_nickname" name="user_nickname">
				<button type="button" id="nickNameAccept" class="joinBtn" value="false">중복검사</button>
				<span id="nickNameError" class="accept">닉네임을 입력해주세요.</span> 
				<i id="nNAcceptText" class="accept">사용할 수 있는 닉네임입니다.</i>
			</div>
			
			<div class="userEmail">
				<input type="text" id="user_email" name="user_email"> @ 
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
			<span id="ibmatTitle">입맛키워드 선택</span> &nbsp;&nbsp;&nbsp;&nbsp;
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
				
			</div>
		</div>
	</div>
	
	<!-- 가입하기 버튼 -->
	<div class="joinBtnDiv">
		<button type="button" id="joinBtn" class="joinBtn">가입하기</button>
	</div>
</div>

</form>
</body>
</html>