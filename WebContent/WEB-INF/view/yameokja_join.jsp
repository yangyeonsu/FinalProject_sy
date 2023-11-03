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
<title>회원가입</title>
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
		
		
		$("#backBtn").click(function()
		{
			$(location).attr("href","yameokja.action");
		});
		
		
		$("#joinBtn").click(function()
		{
			 $(".accept").css("display", "none");
			 /*var blank_pattern = /[\s]/g; */
			
			if ($("#user_name").val() == "")
			{
				$("#nameError").css("display", "inline");
				$("#user_name").focus();
				return;
			}
			if ($("#user_ssn1").val() == "")
			{
				$("#ssnError").css("display", "inline");
				$("#user_ssn1").focus();
				return;
			}
			if ($("#user_ssn2").val() == "")
			{
				$("#ssnError").css("display", "inline");
				$("#user_ssn2").focus();
				return;
			}
			if ($("#user_tel").val() == "")
			{
				$("#telError").css("display", "inline");
				$("#user_tel").focus();
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
			
			if ($("#user_id").val() == "")
			{
				$("#idError").css("display", "inline");
				$("#user_id").focus();
				return;
			}
			
			if ($("#idAccept").val() == "false")
			{
				$("#idError").html("중복 확인 버튼을 눌러주세요.");
				$("#idError").css("display", "inline");
				$("#idAccept").focus();
				return;
			}
			
			if ($("#user_pw").val() == "")
			{
				$("#pw1Error").css("display", "inline");
				$("#user_pw").focus();
				return;
			}
			if ($("#userPwCheck").val() == "")
			{
				$("#pw2Error").css("display", "inline");
				$("#userPwCheck").focus();
				return;
			}
			else if ($("#pwCheckVal").val() != "true")
			{
				$("#pw2Error").html("비밀번호가 일치하지 않습니다.");
				$("#pw2Error").css("display", "inline");
				$("#userPwCheck").focus();
				return;
			}
			if ($("#user_nickName").val() == "")
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
			
			// 이메일 입력
	    	if($("#userEmail").val().includes('@'))
	    	{
	    		$("#userEmailFinal").val($("#userEmail").val());
	    		//alert($("#userEmailFinal").val());
	    	}
	    	else if(($("#userEmail").val() != "") && ($("#userEmail2").val()=='self'))
	    	{
	    		alert("이메일 형식을 확인해주세요");
	    		$("#userEmail2").focus();
	    		return;
	    	}
	    	else if(($("#userEmail").val() != ""))
	    	{
	    		$("#userEmailFinal").val($("#userEmail").val() + '@' + $("#userEmail2").val());
	    		//alert($("#userEmailFinal").val());
	    	}

	    	// 입맛 키워드 선택
	    	var ibmatChk = [];

			$("input:checkbox[name=ibmatCB]:checked").each(function(){
				ibmatChk.push($(this).val()); 
			});

			$("#ibmatChk").val(ibmatChk);

			$("#userForm").attr("action", "filterSearch.action");
			$("#userForm").submit();
			
	    	$("#updateForm").attr("action", "userinfomodify.action");
			// 확인
			alert("입맛키워드 : " + $("#ibmatChk").val());
	    	alert("비번 : " + $("#userPwCheck").val());
	    	alert("닉네임 : " + $("#userNickName").val());
	    	alert("이메일 : " + $("#userEmailFinal").val());
	    	
	    	alert("회원가입이 완료되었습니다.");
			
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
			$("#idAcceptText").css("display", "none");
			
			
			var originId = $.trim($("#user_id").val());
			
			if (originId == "" || originId == null)
			{
				$("#idError").html("아이디를 입력해주세요.");
				$("#idError").css("display", "inline");
				$("#user_id").focus();
				return;
			}
			else 
			{
				var Id = originId.replace(/\s/g, '');
				
				if (originId.length !== Id.length)
				{					
					$("#idError").html("아이디에는 공백을 사용할 수 없습니다.");
					$("#idError").css("display", "inline");
					$("#user_id").focus();
					return;
				}
					
			}
			
			$.ajax(
			{
				type: "POST"
				, url:"idduplicheck.action" 
	            , data: {
	            	"user_id": $.trim($("#user_id").val())
	            	}
				, dataType: "json"
				, success:function(data)
				{
					if (data.count == "0")
					{
						alert(data.count);
						$("#idAcceptText").css("display", "inline");
						$("#idAccept").val("true");
					}
					else
					{
						$("#idError").html("이미 존재하는 아이디 입니다.");
						$("#idError").css("display", "inline");
						$("#idAccept").val("false");
						$("#user_id").focus();
					}
				}
				, err:function(e)
				{
					alert(e.responseText);
				}
			});
		});
		
		$("#user_id").keydown(function()
		{
			$("#idAccept").val("false");
		});
		
		$("#nickNameAccept").click(function()
		{
			$("#nickNameError").css("display", "none");
			$("#nNAcceptText").css("display", "none");
			
			var originNick = $.trim($("#user_nickname").val());
			
			if (originNick == "" || originNick == null)
			{
				$("#nickNameError").html("닉네임을 입력해주세요.");
				$("#nickNameError").css("display", "inline");
				$("#user_nickname").focus();
				return;
			}
			else 
			{
				var nickName = originNick.replace(/\s/g, '');
				
				if (originNick.length !== nickName.length)
				{					
					$("#nickNameError").html("닉네임에는 공백을 사용할 수 없습니다.");
					$("#nickNameError").css("display", "inline");
					$("#user_nickname").focus();
					return;
				}
					
			}
			
			alert(originNick);
			
			$.ajax(
			{
				url:"nickduplicheck.action"
				, type: "POST"
	            , data: {
	            	"user_nick" : $.trim($("#user_nickname").val())
	            }
				, dataType: "json"
				, success:function(data)
				{
					if (data.count == "0")
					{
						alert(data.cont);
						
						$("#nNAcceptText").css("display", "inline");
						$("#nickNameAccept").val("true");
					}
					else
					{
						$("#nickNameError").html("이미 존재하는 닉네임 입니다.");
						$("#nickNameError").css("display", "inline");
						$("#nickNameAccept").val("false");
						$("#user_nickname").focus();
						return;
					}
				}
				, err:function(e)
				{
					alert(e.responseText);
				}
			});
		});
		
		$("#user_nickname").keydown(function()
		{
			$("#nickNameAccept").val("false");
			
		});
		
		$("#userPwCheck").keyup(function()
		{
			$("#pwAcceptText").css("display", "none");
			$("#pw2Error").css("display", "none");
			
			if ($("#user_pw").val() == "")
			{
				$("#pw1Error").css("display", "inline");
				$("#userPwCheck").val("");
				$("#user_pw").focus();
				return;
			}
			
			if ($("#userPwCheck").val() == $("#user_pw").val())
			{
					$("#pwAcceptText").html("비밀번호가 일치합니다.");
					$("#pwAcceptText").css("display", "inline");
					$("#pwCheckVal").val("true");
			}		
			else
			{
				$("#pwAcceptText").html("비밀번호가 일치하지 않습니다.");
				$("#pwAcceptText").css("display", "inline");
				$("#pwCheckVal").val("false");
			}
		});
		
		$("#searchBtn").click(function()
		{
			return "WEB-INF/view/user_info_search.jsp";
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
				<input type="text" id="user_ssn1" name="user_ssn1" maxlength="6">&nbsp;&nbsp;-&nbsp;
				<input type="password" id="user_ssn2" name="user_ssn2" maxlength="7">
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
					<i id="pwAcceptText" class="accept" >확인되었습니다.</i>
					<input type="hidden" id="pwCheckVal" value="false">
				</div>
			</div>
			
			<div class="userNickName">
				<input type="text" id="user_nickname" name="user_nickname">
				<button type="button" id="nickNameAccept" class="joinBtn" value="false">중복검사</button>
				<span id="nickNameError" class="accept">닉네임을 입력해주세요.</span> 
				<i id="nNAcceptText" class="accept">사용할 수 있는 닉네임입니다.</i>
			</div>
			
			<div class="userEmail">
				<input type="text" id="userEmail" name="userEmail"> @ 
				<select name="email" id="userEmail2" class="emailSelect">
					<option value="self" selected="selected">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="kakao.com">kakao.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
				</select>
				<input type="hidden" id="userEmailFinal" name="userEmailFinal">
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
			<c:forEach var="tasteK" items="${tasteKLabel }" varStatus="status">
				<label class="ibmatlabel" for="${tasteK.taste_num }">
				<input type="checkbox" class="ibmatCB" name="ibmatCB" id="${tasteK.taste_num }" value="${tasteK.taste_num }">
				${tasteK.taste_keyword }
				</label>
			</c:forEach>
			<input type="hidden" name="ibmatChk" id="ibmatChk">
		</div>
	</div>
	
	<!-- 가입하기 버튼 -->
	<div class="joinBtnDiv">
		<button type="button" id="joinBtn" class="joinBtn">가입하기</button>
		<button type="button" id="backBtn" class="joinBtn">돌아가기</button>
	</div>
</div>

</form>
</body>
</html>