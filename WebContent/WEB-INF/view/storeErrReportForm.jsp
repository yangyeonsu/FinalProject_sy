<%@page import="com.yameokja.mc.ReqApplyViewDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	ReqApplyViewDTO dto = (ReqApplyViewDTO)request.getAttribute("err");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storeErrReportForm.jsp</title>

<style type="text/css">
.st_info_insert
{
	width: 70vw;
	margin-left: 15vw;
	padding-top: 5vh;
	padding-bottom: 5vh;
	border: 5px solid #F7F4EA;
	border-radius: 40px;
}

.top
{
	width: 70vw;
	margin-left: 15vw;
	text-align: center;
}

.igroup
{
	margin-left: 10vw;
	margin-top: 2vh;
	width: 55vw;
	display: flex;
}
.igroup2
{
	margin-top: 0vh;
	margin-left: 10vw;
	width: 55vw;
	display: flex;
}

.button
{
	margin-top: 3vh;
	margin-bottom: 3vh;
	text-align: center;
}

button, .input
{
	
	display: inline-block;
	outline: none;
	cursor: pointer;
	font-weight: 500;
	border-radius: 3px;
	padding: 0 16px;
	border-radius: 4px;
	background: #F7F4EA;
	line-height: 1.15;
	font-size: 14px;
	height: 33px;
	word-spacing: 0px;
	letter-spacing: .0892857143em;
	text-decoration: none;
	text-transform: uppercase;
	min-width: 64px;
	border: none;
	text-align: center;
	box-shadow: 0px 3px 1px -2px rgb(0 0 0 / 20%), 0px 2px 2px 0px rgb(0 0 0 / 14%), 0px 1px 5px 0px rgb(0 0 0 / 12%);
	transition: box-shadow 280ms cubic-bezier(0.4, 0, 0.2, 1);
	:hover 
	{
	    background: rgb(98, 0, 238);
	    box-shadow: 0px 2px 4px -1px rgb(0 0 0 / 20%), 0px 4px 5px 0px rgb(0 0 0 / 14%), 0px 1px 10px 0px rgb(0 0 0 / 12%);
	}
                
}

.errorMsg
{
	color: #ef6351;
	font-size: small;
	display: none;
}
.input_group {
    display: flex;
    align-items: center;
}
.title
{
	background-color: #F7F4EA;
	width: 8vw;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px 0 0 10px;
	margin-right: 1vw;
	border: 1px solid;
}
#errReport
{
	display: none;
}

input[type="radio"] 
{
  display: none;
}
.sendBtn
{
	display: flex;
    flex-direction: row;
    justify-content: center;
    margin-top: 1%;
    
}


</style>

<script type="text/javascript">
	function reqBtn()
	{
		
		if ($("#errReport").val() == "")
		{
			$("#err").css("display", "inline");
			$("#errReport").focus();
			return;
		}
		
	};
	
	$(function ()
	{
		$(".check").change(function() 
		{
		    if ($(this).is(":checked")) 
		    {
		       if ($(this).val() == "true")
		          $("#errReport").css("display", "flex");
		       else
		          $("#errReport").css("display", "none");
		    }
		});
		/* 
		$(".sendResult").click(function()
		{
			if ($(".check:checked").length == 0)
			{
				alert("승인 / 반려 중 하나를 선택해주세요.");
				return;
			}
			else if($(".check:checked").val() == "true")
			{
				if($("#myTextarea").val().trim() == "" || $("#myTextarea").val().trim() == null)
				{
					alert("반려사유를 입력해주셔야 합니다.");
					return;
				}
			}
		});
		 */
	});
</script>

</head>
<body>

<div class="bframe">
	
	<!-- header -->
	<div><c:import url="/WEB-INF/view/header_admin.jsp"></c:import></div>
	
	<div class="middle">
		<div class="top">
			<h1>가게정보오류수정요청서</h1>
			<hr>
		</div>
		
		<!-- 입력 부분 -->
		<div class="st_info_insert">
		
			<div class="igroup">
				<h2>${err.getSt_name()}</h2>
			</div>
		
		
			<div class="igroup">
				<div style="width: 40%;">
					${err.getChbox_name() }
				</div>
				<div>
					${err.getYn_name() }
				</div>
			</div>
			<br>
			
			<div class="igroup" >
				<div class="title" style="margin-bottom: 0.5vh;">
					<span>요청사유</span>
				</div>
			</div>
			<div class="igroup2" style="width: 100%;">
				<textarea id="storeErrReport" readonly="readonly" style="width: 72%; height: 5em; 3px; resize: none;">${err.getReq_rs() }</textarea>
			</div>
			
			<div style="width: 87%; text-align: right; margin-top: 1vh;">
				<label class="label"><input type="radio" class="check" name="res" id="agree"><button id="agree" style="margin-left: 1vh;">요청승인</button></label>
				<label class="label"><input type="radio" class="check" name="res" id="reject" value="true"><button value="반려" onclick="reqBtn()">요청반려</button></label>
			</div>
			
			<div class="igroup2" style="width: 100%;">
				<textarea id="errReport"  style="width: 72%; height: 10em; resize: none; border-radius: 10px;" placeholder="반려사유기재"></textarea>
			</div>
			
			<div class="igroup" >
				<span class="errorMsg" id="err">반려사유를 입력해야 합니다.</span>
			</div>
			
			<div class="sendBtn">
				<input type="button" class="sendResult" value="처리 하기">
			</div>
			
		</div>
	</div>
	
	
	<!-- footer -->
	<div><c:import url="/WEB-INF/view/footer.jsp"></c:import></div>
</div>



</body>
</html>