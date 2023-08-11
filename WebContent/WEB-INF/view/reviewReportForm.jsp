<%@page import="com.yameokja.mc.RvApplyViewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	RvApplyViewDTO dto = (RvApplyViewDTO)request.getAttribute("review");
   //System.out.print(dto.getUser_id());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewReportForm.jsp</title>
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

button, .input, .sendResult, #span
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
   height: 36px;
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
}
.tcontent1
{
   padding: 1vh;
}
.more
{
   display: flex;
   flex-direction: column;
}
.lbox
{
   display: flex;
   border: 1px solid  #F7F4EA;
}
.repot_date_list
{
   width: 72.5%;
   display: flex;
   justify-content: space-between;
   margin-left: 10vw;
}
#reviewReport{
cursor: not-allowed;
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

.checkLabel input[type="radio"] + span 
{
	display: inline-block;
	padding: 5px 10px;
	border: 1px solid #dfdfdf;
	border-radius: 40px;
	background-color: #ffffff;
	width: 3vw;
	text-align: center;
	cursor: pointer;
}


.checkLabel input[type="radio"]:checked + span 
{
        background-color: light-gray;
}

span
{
	height: 27px;
}
#span
{
	padding-top: 10px;
	height: 25px;
}
#reviewReject
{
	display: none;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
   /* 
   function rejectBtn()
   {
	  
      if ($("#reviewReject").val() == "")
      {
         $("#err").css("display", "inline");
         $("#reviewReject").focus();
         return;
      }
      
   };
    */
	$(function ()
	{
		$(".check").change(function() 
		{
		    if ($(this).is(":checked")) 
		    {
		       if ($(this).val() == "true")
		          $("#reviewReject").css("display", "flex");
		       else
		          $("#reviewReject").css("display", "none");
		    }
		});
		
		$(".sendResult").click(function()
		{
			if ($(".check:checked").length == 0)
			{
				alert("승인 / 중재 / 반려 중 하나를 선택해주세요.");
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
	});
   
</script>

</head>
<body>

<div class="bframe">
   
   <!-- header -->
	<div><c:import url="/WEB-INF/view/header_admin.jsp"></c:import></div>
   
	<div class="middle">
		<div class="top">
		   <h1>리뷰신고서</h1>
		   <hr>
		</div>
      
	      <!-- 입력 부분 -->
		<div class="st_info_insert">
	      
	          
		<div class="repot_date_list">
			<div class="more">
				<div class="lbox">
					<div class="title1">신고자</div>
					<div class="tcontent1"><input type="text" id="reporter" value=<%=dto.getUser_id() %> style="border: 0px; width: 70px;"></div>
				</div>
				<div class="lbox">
					<div class="title1">피신고자</div>
					<div class="tcontent1"><input type="text" id="reported" value=<%=dto.getAccu_num() %> style="border: 0px; width: 70px;"></div>
				</div>
			   
			</div>
	         
			<div class="more">
				<div class="lbox">
					<div class="title1">신고일</div>
					<div class="tcontent1"><input type="text" id="reportDate" value=<%=dto.getReg_date() %> style="border: 0px; text-align: right; width: 70px;"></div>
				</div>
				<div class="lbox">
					<div class="title1">작성일</div>
					<div class="tcontent1"><input type="text" id="createDate" value=<%=dto.getWrite_date() %> style="border: 0px; text-align: right; width: 70px;"></div>
				</div>
			</div>
		</div>
		
		<div class="igroup" >
			<div class="title" style="margin-bottom: 0.5vh;">
				<span>리뷰내용</span>
			</div>
		</div>
		<div class="igroup2" style="width: 100%;">
		<textarea id="reviewReport" readonly="readonly" style="width: 72%; height: 10em; resize: none;">${review.getRv_content() }</textarea>
		</div>
		
		
         
		<div class="igroup2">
			<div style="width: 50%; font-size: 11pt;">
				리뷰신고카테고리명 : ${review.getRep_rs_name()}
			</div>
			<div style="width: 42%; text-align: right; margin-top: 1vh; font-size: 11pt;">
				<button class="stInfoBtn" id="${review.getSt_num() }">${review.getSt_name() } 페이지로 가기</button>
			</div>
		</div>
         
		<div style="width: 87%; text-align: right; margin-top: 2vh; margin-bottom: 2vh;">
			<label class="label"><input type="radio" class="check" name="res" id="approve"><span id="span">승인</span></label>
			<label class="label"><input type="radio" class="check" name="res" id="middle"><span id="span">중재</span></label>
			<label class="label"><input type="radio" class="check" name="res" id="reject" value="true"><span id="span">반려</span></label>
		</div>
         
         <!-- 
		<div class="igroup2" style="width: 100%;">
			<textarea id="reviewReject"  style="width: 72%; height: 10em; resize: none; border-radius: 10px;" placeholder="반려사유기재"></textarea>
		</div>
        
        <div class="igroup" >
			<span class="errorMsg" id="err">반려사유를 입력해야 합니다.</span>
		</div>
		 -->
		<!-- 
		<div style="width: 87%; text-align: right; margin-top: 1vh;">
			<button value="중재" onclick="mediateBtn()">중재</button>
			<button value="반려" onclick="rejectBtn()">반려</button>
		</div>
		 -->
		 
		<div class="igroup rejText">
           <div class="title">
              반려 사유
           </div>
           <div class="rejReason">
           <textarea id="myTextarea" style="width: 72%; height: 10em; resize: none;" placeholder="반려사유를 입력해주세요."></textarea>
           </div>
        </div>
   		
   		<div class="sendBtn">
			<input type="button" class="sendResult" value="처리 하기">
		</div>
   		
		</div> <!-- st_info_insert -->
	</div>
   
   
	<!-- footer -->
	<div><c:import url="/WEB-INF/view/footer.jsp"></c:import></div>

</div>

</body>
</html>