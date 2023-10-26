<%@ page import="com.yameokja.mc.ReqApplyViewDTO"%>
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
<title>가게정보오류수정 요청서</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/st_modal.css">

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

.input
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

.title1
{
   width: 5vw;
   padding: 1vh;
   background-color: #F7F4EA;
	border-radius: 0 5px 5px 0;
}
.tcontent1
{
   padding: 1vh;
}

.input_group {
    display: flex;
    align-items: center;
}

.content
{
	width: 44vw;
}

.lbox
{
   display: flex;
   border: 1px solid  #F7F4EA;
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
	/* border: 1px solid; */
	height: 3vh;
	padding: 0.5vh 0.5vh 0.5vh 0.5vh
}
#myTextarea
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

.checkLabel
{
	display: flex;
    flex-direction: row;
    justify-content: center;
    padding-left: 40vw;
    margin-top: 1% 
}

 
input[type="radio"] 
{
  display: none;
}

.label input[type="radio"] + span 
{
	display: inline-block;
	padding: 5px 10px;
	border: 1px solid #dfdfdf;
	border-radius: 10px 10px;
	background-color: #ffffff;
	width: 3vw;
	text-align: center;
	cursor: pointer;
}


.label input[type="radio"]:checked + span 
{
        background-color:  #F7F4EA;
}

#span
{
	padding-top: 10px;
	height: 25px;
}
#storeErrReport
{
	cursor: not-allowed;
}

#popup
{
    
}

.middle
{
	display: flex;
	flex-direction: column;
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	
	$(function ()
	{
		$(".check").change(function() 
		{
			if ($(this).is(":checked")) 
			{
				if ($(this).val() == "true")
					$("#myTextarea").css("display", "flex");
				else
					$("#myTextarea").css("display", "none");
			}
		});
		 
		$(".sendResult").click(function()
		{
			//alert("확인");
			
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
					$("#myTextarea").focus();
					return;
				}
				else
				{
					//alert("반려");
					$("#check").val("false");
				}
			}
			else if($(".check:checked").length != 0 && $(".check:checked").val() != "true")
			{
				//alert("승인");
				$("#check").val("true");
			}
			
			// 폼 submit 액션 처리 수행
	        $("#adminForm").attr("action", "sterrreqsend.action");
			$("#adminForm").submit();
		});
	});
	
	
	
	function PopupOpen()
	{

		if (document.all.popup.style.visibility == "hidden")
		{
			document.all.popup.style.visibility = "visible";
			bgLayerOpen();

			var $layerPopupObj = $('#popup');
			var left = ($(window).scrollLeft() + ($(window).width() - $layerPopupObj
					.width()) / 2);
			var top = ($(window).scrollTop() + ($(window).height() - $layerPopupObj
					.height()) / 2);

			$layerPopupObj.css(
			{
				'left' : left,
				'top' : top,
				'position' : 'absolute'
			});
			$('body').css('position', 'relative').append($layerPopupObj);

			return false;
		} else
		{
			document.all.popup.style.visibility = "hidden";
			bgLayerClear();
			return false;
		}

	}
	
	

	function bgLayerOpen()
	{
		if (!$('.bgLayer').length)
		{
			$('<div class="bgLayer"></div>').appendTo($('body'));
		}
		var object = $(".bgLayer");
		var w = $(document).width() + 12;
		var h = $(document).height();

		object.css(
		{
			'width' : w,
			'height' : h
		});
		object.fadeIn(500); //생성되는 시간 설정
	}

	function bgLayerClear()
	{
		var object = $('.bgLayer');

		if (object.length)
		{
			object.fadeOut(500, function()
			{
				object.remove();

			});
		}
	}

	$(function()
	{
		$(window).resize(function()
		{ //화면 크기 변할 시
			$('.bgLayer').css('width', $(window).width() - 0);
			$('.bgLayer').css('height', $(window).height() - 0);
		});
	});
	
	
	
	
	
</script>

</head>
<body>
<form id="adminForm" method="post">
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
			<div style="width: 87%; text-align: right; margin-top: 1vh; font-size: 11pt;">
				<button type="button" class="stInfoBtn" value="${err.st_num }" onclick="javascript:PopupOpen()">${err.st_name } 페이지로 가기</button>
			</div>
			
			<c:if test="${state ne '처리완료' }">
				
				<div style="width: 87%; text-align: right; margin-top: 1vh;">
					<label class="label" id="approve"><input type="radio" class="check" name="res" id="approve"><span id="approve">승인</span></label>
					<label class="label" id="reject"><input type="radio" class="check" name="res" id="reject" value="true"><span id="reject">반려</span></label>
				</div>
				<br><br>
				
				<div class="igroup2" style="width: 100%;">
					<textarea id="myTextarea" name="myTextarea" style="width: 72%; height: 10em; resize: none;" placeholder="반려사유를 입력해주세요."></textarea>
				</div>
				
				<br>
				
				<div class="sendBtn">
					<input type="button" class="sendResult" value="처리 하기">
					<input type="hidden" name="check" id="check">
					<input type="hidden" name="req_apply_num" value="${err.req_apply_num }">
				</div>
				
			</c:if>
			
			<c:choose> 
				<c:when test="${err.req_state=='반려' }">
					<div class="igroup">
						<div class="lbox">
							<div class="title1">
								${err.req_state}
							</div>
							<div class="tcontent1 content">
								${err.rej_rs }
							</div>
						</div>
					</div>
					<br><br>
					<div class="igroup" style="width: 100%; color: red; font-size: 20pt; text-align: center; width: 570px; margin: 0 auto;">
						처리가 완료된 가게정보오류수정요청서 입니다.
					</div>
				</c:when>
				<c:when test="${err.req_state=='승인' }">
					<br><br>
					<div class="igroup" style="width: 100%; color: red; font-size: 20pt; text-align: center; width: 570px; margin: 0 auto;">
						처리가 완료된 가게정보오류수정요청서 입니다.
					</div>
				</c:when>
			</c:choose>

		</div>
		<div class="stDetailPopup" id="popup" style="position: absolute; visibility: hidden;">
			<h4>
				<a href="#" class="close" onClick="javascript:PopupOpen()">X</a>
			</h4>
			<c:import url="storeDetail_modal.jsp"></c:import>
		</div>
		
		
	</div>
	
	
	<!-- footer -->
	<div><c:import url="/WEB-INF/view/footer.jsp"></c:import></div>
	
</div>
</form>


</body>
</html>