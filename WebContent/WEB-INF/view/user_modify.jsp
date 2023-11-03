<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 수정</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_modify.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".accept").css("display", "none");
		
		// 기존에 체크했던 입맛키워드 표시하기
		$("input:checkbox[name='ibmatCB']").each(function()
		{
			if($("#userIbmatChk").val().indexOf($(this).val()) != -1)
			{
				$(this).prop("checked", true);
				$(".ibmatlabel[for="+$(this).val()+"]").css("border-bottom","3px solid #ef6351");
			}
		})
		
		// 입맛키워드 선택 시 border-bottom 추가
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
	
	$(document).ready(function() 
	{
		// 닉네임 중복 확인
	    $("#nickNameAccept").click(function() 
	    {
	        var nickName = $.trim($("#userNickName").val());
	        alert(nickName);
	        
	        $.ajax(
   			{
   				url:"nickduplicheck.action"
   				, type: "POST"
   	            , data: {
   	            	"user_nick" : $.trim($("#userNickName").val())
   	            }
   				, dataType: "json"
   				, success:function(data)
   				{
   					if (data.count == "0")
   					{
   						alert(data.count);
   						$("#nickNameError").css("display", "none");
   						$("#nNAcceptText").css("display", "inline");
   						$("#nickNameAccept").val("true");
   					}
   					else
   					{
   						$("#nNAcceptText").css("display", "none");
   						$("#nickNameError").html("이미 존재하는 닉네임 입니다.");
   						$("#nickNameError").css("display", "inline");
   						$("#nickNameAccept").val("false");
   						$("#userNickName").val("");
   						$("#userNickName").focus();
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
	    
	    // 비밀번호 확인
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
	    
	    
	    $("#joinBtn").click(function()
		{
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
			//alert("입맛키워드 : " + $("#ibmatChk").val());
	    	//alert("비번 : " + $("#userPwCheck").val());
	    	//alert("닉네임 : " + $("#userNickName").val());
	    	//alert("이메일 : " + $("#userEmailFinal").val());
	    	
	    	$("#updateForm").submit();
	    	
	    	alert("회원정보수정이 완료되었습니다.");
	    	
		});
	});
	

	
	
</script>


</head>
<body>

<c:import url="header_user.jsp"></c:import>

<form action="" id="updateForm" method="post">
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
			
			<div class="userNum">
				<input type="text" id="userNum" name="userNum" style="display: none;" value="${modify.getUser_num() }">
			</div>
			
			<div class="userName">
				<input type="text" id="userName" readonly="readonly" value="${modify.getUser_name() }">
			</div>
			<div class="userSsn">
				<input type="text" id="userSsn1" readonly="readonly" value="${modify.getUser_ssn1() }">&nbsp;&nbsp;-&nbsp;
				<input type="password" id="userSsn2" readonly="readonly"value="${modify.getUser_ssn2() }">
			</div>
			
			<div class="userTel">
				<div>
					<input type="text" id="userTel" readonly="readonly" value="${modify.getUser_tel() }">
				</div>
			</div>
			
			<div class="userId">
				<input type="text" id="userId" value="${modify.getUser_id() }">
			</div>
			
			<div class="userPw">
				<div>
					<input type="password" id="user_pw">
					<span id="pw1Error" class="accept">비밀번호를 입력해주세요.</span> 
				</div>
				<div>
					<input type="password" id="userPwCheck" name="userPwCheck">
					<span id="pw2Error" class="accept">비밀번호를 한번 더 입력해주세요.</span> 
					<i id="pwAcceptText" class="accept">확인되었습니다.</i>
					<input type="hidden" id="pwCheckVal" value="false">
				</div>
			</div>
			
			<div class="userNickName">
				<input type="text" id="userNickName" value="${modify.user_nickname }" name="userNickName">&nbsp;&nbsp;
				<button type="button" id="nickNameAccept" class="joinBtn">중복검사</button>
				<span id="nickNameError" class="accept">닉네임을 입력해주세요.</span>
				<i id="nNAcceptText" class="accept">사용할 수 있는 닉네임입니다.</i>
				<br>
			</div>
			
			<div class="userEmail">
				<input type="text" id="userEmail" value="${modify.user_email }" name="userEmail"> @ 
				<select name="email" id="userEmail2" class="emailSelect">
					<option value="self" selected="selected">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="kakao.com">kakao.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
				</select>
				<i class="ibamtText" style="font-size: 0.5vw;">공백 입력 시 이메일 정보가 삭제됩니다.</i>
				<input type="hidden" id="userEmailFinal" name="userEmailFinal">
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
			<input type="hidden" name="userIbmatChk" class="userIbmatChk" id="userIbmatChk" value="${userTasteKLabel}">
			<c:forEach var="tasteK" items="${tasteKLabel }" varStatus="status">
				<label class="ibmatlabel" for="${tasteK.taste_num }">
				<input type="checkbox" class="ibmatCB" name="ibmatCB" id="${tasteK.taste_num }" value="${tasteK.taste_num }">
				${tasteK.taste_keyword }
				</label>
			</c:forEach>
			<input type="hidden" name="ibmatChk" id="ibmatChk">
		</div>
	</div>
	
	<!-- 수정하기 버튼 -->
	<div class="joinBtnDiv">
		<button type="button" id="joinBtn" class="joinBtn">수정하기</button>
	</div>
	<!-- 탈퇴하기 버튼 -->
	<div class="leaveBtnDiv">
		<button type="button" id="leaveBtn" class="leaveBtn">계정탈퇴하기</button>
	</div>
</div>
</form>
<c:import url="footer.jsp"></c:import>

</body>
</html>