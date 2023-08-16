<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->

<!-- CSS -->
<%-- <link rel="stylesheet" href="<%=cp %>/css/StoreMain.css"> --%>

<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!-- JS 
<script src="assets/js/main.js"></script> -->


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<style type="text/css">
.container {
	position: static;
	display: flex;
	justify-content: flex-start;
	width: 100%;
	align-items: stretch;
	/* font-family: 'Black Han Sans', sans-serif; */
	font-family: 'Orbit', sans-serif;
	margin: 0;
}

header {
	position: sticky;
	top: 0;
	background-color: white;
}

.storemain_body {
	display: flex;
	flex-direction: column;
	width: 50%;
	height: 100%;
	margin-left: 25vw;
}

.storemain_bodyTop {
	position: static;
	display: flex;
	height: 15vh
}

.storeName {
	font-family: 'Black Han Sans', sans-serif;
	font-size: 40pt;
}

.storemain_chart {
	display: flex;
	flex-direction: column;
}

.storemain_rekey {
	display: flex;
	max-width: 65vw;
	flex-direction: column
}

.doughnutChart {
	width: 50vw;
	margin-bottom: 10vh;
}

.chart_content {
	max-width: 65vw;
}

h2 {
	font-size: 30pt;
	margin-top: 0em;
}

.review_keyword {
	display: flex;
	flex-direction: column;
	align-items: center;
	flex-wrap: wrap;
	height: 38vh;
}

.review_keyword li {
	width: 15vw;
	margin-bottom: 2vh;
	font-size: 0.8vw;
	margin-left: 2.8vw;
}

.storemain_review {
	width: 56vw;
}

h3 {
	font-size: 20pt;
}

.review {
	height: 6em;
	margin-bottom: 1vh;
	background-color: #f5f3e7;
}

.review_top {
	display: flex;
	justify-content: space-between;
	padding-top: 0.5vh;
	margin-bottom: 0.6vh;
	margin-right: 0.8vw;
	margin-left: 0.8vw;
}

.review_body {
	margin-left: 0.8vw;
}

.error {
	display: flex;
	width: 56vw;
	height: 6em;
	justify-content: center;
	align-items: center;
	background-color: #FF4500;
}

.errorMsg {
	width: 33vw;
	color: white;
	text-align: center;
}

.button {
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding-top: 2vh;
}

.btn {
	display: flex;
	justify-content: center;
	width: 14.5vh;
	height: 3vh;
	margin-bottom: 1.5vh;
	cursor: pointer;
	text-align: center;
	border: none;
	border-radius: 4px;
	font-size: 13px;
	font-weight: 500;
	align-items: center;
	background-color: transparent;
}

.btn-outline-primary:hover {
	transition: all 150ms linear;
	opacity: .85;
}

.btn-outline-primary:active {
	transition: all 150ms linear;
	opacity: .75;
}

.btn-outline-primary {
	background: none;
	border: 1px solid white;
	color: white;
}

.modifyBtn {
	/* font-size: small; */
	width: 6vw;
	height: 5vh;
	margin-top: 3.2vw;
	margin-left: 2vh;
	border-radius: 10px;
	font-size: 0.6vw;
	border: 1px solid #ef6351;
	background-color: white;
	color: #ef6351;
	cursor: pointer;
	align-content: center;
}

.modifyBtn:hover {
	width: 6vw;
	height: 5vh;
	border-radius: 10px;
	font-size: 0.6vw;
	border: 1px solid #ef6351;
	background-color: #fef1ef;
	color: #ef6351;
	cursor: pointer;
	align-content: center;
	box-shadow: 0 0 10px #ef6351;
}

.modifyBtn:action {
	width: 6vw;
	height: 5vh;
	border-radius: 10px;
	font-size: 0.6vw;
	border: 1px solid #ef6351;
	background-color: #f9ab9f;
	color: #ef6351;
	cursor: pointer;
	align-content: center;
	box-shadow: 0 0 10px #ef6351;
}

i {
	background: none;
	color: white;
	margin-left: 0.3vw;
}

.sendBtn {
	margin-top: 0.5vh;
}

.review_reply {
	float: right;
	padding-right: 0.8vw;
}

.review_reply_txtarea {
	display: none;
	vertical-align: middle;
	float: right;
	padding-right: 0.8vw;
}

.review_reply_btn {
	float: right;
	display: none;
}

/* 리뷰 영역 */
#insertReview {
	margin-bottom: 1vw;
	width: 6.2vw;
	height: 30px;
	border: 1px solid #ede9d0;
	border-radius: 5px;
	color: #4d4b4b;
	font-weight: bold;
	box-shadow: 3px 3px 3px #ede9d0;
	background-color: #fff;
	margin-right: 0.8vw;
	font-size: 0.6vw;
	cursor: pointer;
}

.reviewInsertBtnDiv {
	width: 8vw;
	padding-left: 53.8vw;
	margin-top: 20px;
	margin-bottom: 20px;
}

.none, .noneMenu {
	text-align: center;
	color: #4d4b4b;
}

.reviews {
	padding-top: 10px;
	padding-bottom: 10px;
	display: flex;
	flex-direction: column;
	margin-bottom: 20px;
}

.rvTop {
	display: flex;
	justify-content: space-between;
	padding: 0 5px 0 5px;
}

.userNickname {
	font-size: 13pt;
	font-weight: bold;
	background-color: #f7f4ea;
}

.rvBtn {
	border-radius: 8px;
	border: none;
	background-color: #fff;
	margin-left: 5px;
	height: 30px;
	cursor: pointer;
	box-shadow: 2.5px 2.5px 2.5px #f7f4ea;
}

.repBtn {
	font-size: 0.2vw;
	box-shadow: 2.5px 3px 2.5px #f7f4ea;
}
.replyBtn{
	font-size: 0.2vw;
	box-shadow: 2.5px 3px 2.5px #f7f4ea;
}

.rvBtn:hover {
	border-radius: 8px;
	border: none;
	background-color: #f7f4ea;
	margin-left: 5px;
	height: 30px;
	pointer: cursor;
}

.starScore {
	height: 20px;
	width: 10vw;
	margin-bottom: 10px;
	margin-top: 10px;
	margin-right: 0px;
	font-size: 11pt;
}

.contentPhotoDiv {
	border: 2px solid #f7f4ea;
	border-radius: 5px;
	padding: 5px;
	display: flex;
	flex-direction: column;
}

.rvContentDiv {
	height: 100px;
}

.rvPhotoDiv {
	padding-left: 5px;
}

.rvphoto {
	max-width: 80px;
	max-height: 80px;
	width: 80px;
	height: 80px;
	object-fit: cover;
	border-radius: 5px;
}

.regDate
{
	float: right;
	font-size: 8pt;
	color: #4d4b4b;
}

.recBtn {
	float: right;
}

/* 리뷰신고 모달 */
#popup {
	overflow: hidden;
	height: auto;
	display: block;
	border-radius: 20px;
	box-shadow: 1.5px 2px 2px #333;
	width: 400px;
	height: 380px;
	z-index: 200;
	position: fixed;
	top: 50%;
	left: 50%;
	/* transform: translate(-50%, -50%); */
	/* top: 20%;
	left: 10%; */
	background-color: #fff;
}

#popup h4 {
	font-size: 15px;
	height: 24px;
	padding: 8px 0 2px 15px;
	color: #3a001e;
	font-weight: normal;
}

#popup h4 a.close {
	float: right;
	padding-right: 8px;
	color: #3a001e;
	font-family: verdana;
	margin-right: 2%;
}

#popup h3 {
	text-align: center;
}

.popCont {
	display: block;
	background: #FFF;
	border: 3px solid #EF6351;
	padding: 15px 20px;
	border-radius: 5px;
	height: 150px;
	width: 80%;
	margin-left: 4%;
}

.popCont .list {
	height: 24px;
	width: 80%;
	display: inline-block;
	margin: 0;
	font-size: 14px;
}

.list label {
	margin-top: 5px;
}

#commercial, #intended, #wrong, #violent {
	transform: scale(1.3);
	accent-color: #ef6351;
	position: relative;
	top: 0.1vw;
	margin-right: 0.5vw;
}

#popup .dec {
	margin-left: 40%;
	margin-top: 20px;
	height: 40px;
}

#popup #decBtn {
	width: 80px;
	height: 25px;
	float: left;
	align-content: center;
	font-size: 8pt;
	border: 1px solid #ef6351;
	border-radius: 5px;
	background-color: #ef6351;
	color: white;
	cursor: pointer;
}

.bgLayer {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #f7f4ea;
	opacity: .5;
	filter: alpha(opacity = 50);
	z-index: 15;
}

/* 가게정보오류수정요청 모달 */
#reqPopup {
	overflow: hidden;
	height: auto;
	display: block;
	border-radius: 20px;
	box-shadow: 1.5px 2px 2px #333;
	width: 500px;
	height: 600px;
	z-index: 200;
	position: fixed;
	top: 50%;
	left: 50%;
	/* transform: translate(-50%, -50%); */
	/* top: 20%;
	left: 10%; */
	background-color: #fff;
}

#reqPopup h4 {
	font-size: 15px;
	height: 24px;
	padding: 8px 0 2px 15px;
	color: #3a001e;
	font-weight: normal;
}

#reqPopup h4 a.close {
	float: right;
	padding-right: 8px;
	color: #3a001e;
	font-family: verdana;
	margin-right: 2%;
	font-weight: bold;
}

#reqPopup h3 {
	text-align: center;
}

.reqPopCont {
	display: block;
	background: #FFF;
	border: 3px solid #EF6351;
	padding: 15px 20px;
	border-radius: 5px;
	height: 350px;
	width: 80%;
	margin-left: 4%;
}

.reqPopCont .list {
	height: 100%;
	width: 100%;
	/* display: inline-block; */
	margin: 0;
	font-size: 12pt;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.oplist {
	display: flex;
	justify-content: space-between;
	width: 400px;
	margin-left: 10px;
}

.oplistName label .oplistOption label {
	height: 20px;
}

.oplistName {
	width: 250px;
	text-align: center;
	font-weight: bold;
	height: 20px;
}

.oplistOption {
	width: 100px;
	text-align: center;
	font-weight: bold;
	height: 10px;
}

.list input[type=checkbox] {
	transform: scale(1.3);
	accent-color: #ef6351;
	position: relative;
	top: 0.1vw;
	margin-left: 50px;
}

.reqRs {
	display: flex;
	align-items: center;
}

#reqPopup .req {
	margin-left: 40%;
	margin-top: 20px;
	height: 40px;
}

#reqPopup #reqBtn {
	width: 120px;
	height: 25px;
	float: left;
	align-content: center;
	font-size: 8pt;
	font-weight: bold;
	border: 1px solid #ef6351;
	border-radius: 5px;
	background-color: #ef6351;
	color: white;
	cursor: pointer;
}

/* 리뷰신고요청 모달 */
#rvPopup {
	overflow: hidden;
	height: auto;
	display: block;
	border-radius: 20px;
	box-shadow: 1.5px 2px 2px #333;
	width: 500px;
	height: 600px;
	z-index: 200;
	position: fixed;
	top: 50%;
	left: 50%;
	/* transform: translate(-50%, -50%); */
	/* top: 20%;
	left: 10%; */
	background-color: #fff;
}

#rvPopup h4 {
	font-size: 15px;
	height: 24px;
	padding: 8px 0 2px 15px;
	color: #3a001e;
	font-weight: normal;
}

#rvPopup h4 a.close {
	float: right;
	padding-right: 8px;
	color: #3a001e;
	font-family: verdana;
	margin-right: 2%;
	font-weight: bold;
}

#rvPopup h3 {
	text-align: center;
}

.rvPopCont {
	display: block;
	background: #FFF;
	border: 3px solid #EF6351;
	padding: 15px 20px;
	border-radius: 5px;
	height: 150px;
	width: 80%;
	margin-left: 5%;
}

.reqPopCont .list {
	height: 100%;
	width: 100%;
	/* display: inline-block; */
	margin: 0;
	font-size: 12pt;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.rvRs {
	display: flex;
	align-items: center;
}

#rvPopup .rv {
	margin-left: 35%;
	margin-top: 30px;
	height: 40px;
}

#rvPopup #rvBtn {
	width: 120px;
	height: 30px;
	float: left;
	align-content: center;
	font-size: 8pt;
	font-weight: bold;
	border: 1px solid #ef6351;
	border-radius: 5px;
	background-color: #ef6351;
	color: white;
	cursor: pointer;
}
</style>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<!-- 배너 스크립트 -->
<script type="text/javascript">
	$(function()
	{
		$(".left_sub_menu").hide();
		$(".has_sub").click(function()
		{
			$(".left_sub_menu").fadeToggle(300);
			if ($('#checkOverlay').val() == "true")
			{
				$('.overlay').css("position", "fixed");
				$('.overlay').css("width", "0%");
				$('.overlay').css("height", "0%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "0");
				$('#checkOverlay').attr("value", "false");
			} else
			{
				$('.overlay').css("position", "fixed");
				$('.overlay').css("width", "100%");
				$('.overlay').css("height", "100%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "3");
				$('.overlay').css("margin-top", "1.011vh");
				$('#checkOverlay').attr("value", "true");
			}

		});
		// 왼쪽메뉴 드롭다운
		$(".sub_menu ul.small_menu").hide();
		$(".sub_menu ul.big_menu").click(function()
		{
			$("ul", this).slideToggle(300);
		});
		// 외부 클릭 시 좌측 사이드 메뉴 숨기기
		$('.overlay').on('click', function()
		{
			$('.left_sub_menu').fadeOut();
			$('.overlay').css("position", "fixed");
			$('.overlay').css("width", "0%");
			$('.overlay').css("height", "0%");
			$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
			$('.overlay').css("z-index", "0");
			$('#checkOverlay').attr("value", "false");
		});
	});
</script>


<script type="text/javascript">
$(function()
{
	$(".modifyBtn").click(function()
	{
		$("#userForm").attr("action", "stdetailmodify.action");
		$("#userForm").submit();
	});
	
});

// 답글달기
$(document).ready(function()
{
	/* 
	$(".replyBtn").click(function()
	{
		//alert("확인");
		$("#userForm").attr("action", "stdetailmodify.action");
		$("#userForm").submit();
	});
	 */
	
	$(".replyBtn").click(function() 
	{
	    var replyId = $(this).val();
	    
	    if($("#div"+replyId).css("display", "none"))
	    	$("#div"+replyId).css("display", "flex");
	   
	});
	
	 /*
	$(".replyBtn").click(function() 
	{
	    var replyId = $(this).val();
	    var replyBox = $("#div" + replyId);
	    
	    if(replyBox.css("display") == "none")
	    	replyBox.css("display", "block");
	 	else
	 		replyBox.css("display", "none");
	});
	
	$(".completeBtn").click(function()
	{
		var replyBox = $(this).closet(".replyBox");
		replyBox.css("display", "none");
	});
	 */
	
	/* 
	// 답글쓰기 버튼 토글
    $('.replyBtn').click(function()
    {
        var replyTextarea = $(this).closest('.review').find('textarea.review_reply_txtarea');
        var sendReplyButtons = $(this).closest('.review').find('button.review_reply_btn');
        
        replyTextarea.toggle(); 
        sendReplyButtons.toggle();
    });
	 */
	 
    $(".review_reply_btn").click(function(event) 
    {
        var thisForm = $(this).closest('.rvReplyForm'); // 해당 버튼의 폼을 선택
        var replyTextarea = thisForm.find('textarea.review_reply_txtarea');
        if (!replyTextarea.val().trim()) 
        {
            alert("답글을 입력해주세요!");
            event.preventDefault();
        } 
        else
        {
            thisForm.submit(); // 해당 폼 제출
        }

        console.log("RV_NUM:", thisForm.find('input[name="rv_num"]').val());
        console.log("Reply content:", replyTextarea.val());
    });

    
    
  	/// 신고하기 버튼 눌렀을 때
	$(".repBtn").click(function()
	{
		alert($(this).val());
		$("input[name=rvNumHidden]").attr("value", $(this).val());
	});

	$("#decBtn").click(function()
	{
		$rv_num = $("input[name=rvNumHidden]").val();
		/* alert($rv_num); */

		$st_num = $("input[name=st_num]").val();
		/* alert($st_num); */

		var reviewRep = [];

		$("input:checkbox[name=reviewRep]:checked").each(function()
		{
			reviewRep.push($(this).val());
		});

		$rep_rs_num = reviewRep[0];
		/* alert($rep_rs_num); */

		if (reviewRep.length == null || reviewRep.length == 0)
		{
			alert("신고사유를 선택해주세요.");
			return;
		}
		
		popupOpen();

		$("input:checkbox[name=reviewRep]:checked").each(function()
		{
			$(this).prop("checked", false);
			totalChecked = 0;
		});

		$.ajax(
		{
			url : "reviewrep.action",
			type : 'post',
			data :
			{
				"rv_num" : $rv_num,
				"rep_rs_num" : $rep_rs_num,
				"st_num" : $st_num
			},
			context : this,
			success : function(html)
			{

				alert("신고가 완료되었습니다.");
				$(".info").html(html);
			},
			error : function(e)
			{
				alert(e.responseText);
			}
		});
    
	});
	
	var optionTotalChecked = 0;

	function optionCountChecked()
	{
		if ($("input:checkbox[name=optionCheck]").checked)
			optionTotalChecked += 1;
		else
			optionTotalChecked -= 1;

		if (optionTotalChecked > 1)
		{
			alert("한 개만 선택 가능합니다.");
			option.checked = false;
			optionTotalChecked -= 1;
		}
	}
	
	var selectedRvNum = null;

    function toggleReplyBox(button) {
        var rvNum = button.value;
        var replyBox = document.querySelector(".replyBox");
        if (selectedRvNum === rvNum) {
            selectedRvNum = null;
            replyBox.style.display = "none";
        } else {
            selectedRvNum = rvNum;
            replyBox.style.display = "block";
        }
    }
});





function popupOpen()
{
	var popupElement = document.getElementById('popup');


	/* if (popupElement.style.visibility === "hidden") */
	/* if (window.getComputedStyle(popupElement).getPropertyValue('visibility') === "hidden") */
	if ($('#popup').css('visibility') == "hidden")
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
		$('#popup').css('visibility', "hidden");
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
	var w = $(document).width();
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


$(function name()
{
	$(".completeBtn").click(function()
	{
		alert("확인");
		/* var rv_num = $(this).parent().attr("id");						//-- 리뷰번호 */
		
		 var replyBoxId = $(this).parent().attr("id");
		
		 alert(replyBoxId);
		 var rv_num = replyBoxId.substring(3);
		 
		 alert(rv_num);
		 
		var reply_content = $(".rvApplyContent").val();	//-- 답글내용
		alert(reply_content);
		
		$.ajax({
			type: "POST"
			, url: "rvcompletebtn.action"
			, data: {
				"rv_num": rv_num,
				"reply_content": reply_content
			},
			success: function(response)
			{
				/* $("#"+replyId).append("<p>" +response+ "</p>"); */
				//$(".replyBox").html(response)
				alert("갔다옴");
				$("#div"+rv_num).html(response)
			},
			error: function(xhr, status, error)
			{
				console.error(error);
			}
		});
	});
});





</script>



<title>SideBar sub menus</title>
</head>
<body>
	<form action="" id="userForm" method="post">

		<header>
			<c:import url="header_user.jsp"></c:import>
		</header>

		<div class="container">

			<c:import url="sideBar_store.jsp"></c:import>

			<div class="storemain_body">
				<c:if test="">
					<div class="error">
						<div class="errorMsg">
							토리네 도토리묵(으)로 가게정보수정요청이 들어왔습니다.<br> 신고 접수된 정보에 대해 수정이 없을 시
							3일뒤 패널티가 부여됩니다.
						</div>
						<div class="button">
							<button class="btn btn-outline-primary btn-layer-2_1"
								value="요청처리번호">
								이의 제기 요청 <i class="fa fa-check"></i>
							</button>
							<button class="btn btn-outline-primary btn-layer-2_1"
								value="요청번호">
								패널티 회수 요청 <i class="fa fa-check"></i>
							</button>
						</div>
					</div>
				</c:if>

				<div class="storemain_bodyTop">
					<c:forEach var="st" items="${st_list }">
						<c:if test="${st.st_num eq st_num }">
							<p class="storeName">${st.st_name }</p>
						</c:if>
					</c:forEach>
					<input type="hidden" id="st_num" name="st_num"
						value="${st_num }">
					<button type="button" class="modifyBtn">가게 정보 수정</button>

				</div>
				<div class="storemain_content">
					<div class="storemain_chart">
						<!--차트가 그려질 부분-->
						<div class="chart_name">
							<h3>별점 추이</h3>
						</div>
						<div class="chart_content">
							<canvas id="myChart" width="1100px" height="300px"></canvas>
						</div>
					</div>
					<div class="storemain_rekey">
						<h3>선택된 리뷰 키워드</h3>
						<div class="doughnutChart">
							<canvas id="doughnutChartCanvas"></canvas>
						</div>
						<ul class="review_keyword">
							<c:forEach var="maps" items="${rv_key_list }">
								<li><c:out value="${maps['RV_KEY_NAME']}" /><span>(<c:out
											value="${maps['COUNT_RV_KEY']}" />)
								</span></li>
							</c:forEach>
						</ul>
					</div>
					<div id="revList">
						<c:if test="${empty reviews }">
							<div class="none">"작성된 리뷰가 존재하지 않습니다."</div>
						</c:if>
						<c:forEach var="list" items="${rv_list }">
						<c:forEach var="rv" items="${reviews }">
							
							<c:set var="rn" value="${rv.rv_num }" />
							<div class="reviews">
								<div class="rvTop">
									<div class="userNickname">"${rv.user_nickname }"</div>
									<div>
										<button type="button" class="repBtn rvBtn"
											onclick="popupOpen()" value="${rv.rv_num }">신고하기
										</button>
										<button type="button" class="replyBtn rvBtn" value="${rv.rv_num }">
											답글달기
										</button>
										
									</div>
								</div>


								<div class="rvMiddle">
									<div class="starScore">
										<c:choose>
											<c:when test="${rv.star_score eq 5}">
													⭐⭐⭐⭐⭐
												</c:when>
											<c:when test="${rv.star_score eq 4}">
													⭐⭐⭐⭐
												</c:when>
											<c:when test="${rv.star_score eq 3}">
													⭐⭐⭐
												</c:when>
											<c:when test="${rv.star_score eq 2}">
													⭐⭐
												</c:when>
											<c:when test="${rv.star_score eq 1}">
													⭐
												</c:when>
											<c:otherwise>
													-
												</c:otherwise>
										</c:choose>
									</div>
									
									<div class="rvBottom">
										<div class="recNonrecBtnDiv">
											<button type="button" id="nonrec${rn }" name="nonrec"
												class="recBtn rvBtn" value="${rn }" disabled="disabled">비추천
												👎 (${rv.nonrec })
											</button>
											<button type="button" id="rec${rn}" name="rec"
												class="recBtn rvBtn" value="${rn }" disabled="disabled">추천
												👍 (${rv.rec } )
											</button>
										</div>
									</div>
										
								</div>
									
									
								<div class="contentPhotoDiv">
									<div class="rvContentDiv" id="${rn }">${rv.rv_content }</div>
									<div class="rvPhotoDiv">
										<c:forEach var="photos" items="${rvPhotos }">
											<c:if test="${photos.rv_num eq rn }">
												<img alt="" class="rvphoto"
													src="<%=cp %>/images/${photos.photo_link }" />
											</c:if>
										</c:forEach>
									</div>
								</div>
								<div class="regDate" align="right">${rv.reg_date }</div>
								
								<c:if test="${rv.rv_num == list.rv_num}">
								<div class="replyBox" align="right" id="div${rv.rv_num }">
									사장님 : ${list.reply_content}
								</div>
								</c:if>
								<div class="replyBox" align="right" id="div${rv.rv_num }" style="display: none;">
									사장님 : <input type="text" class="rvApplyContent" > <input type="button" class="completeBtn" value="완료">
								</div>
							</div>
							<input type="hidden" value="${rn }" name="rvNumHidden"> 
							<input type="hidden" value="" name="rep_rs_num">
						</c:forEach>
						</c:forEach>
					</div>
					<!-- id="revList" -->

					<div id="popup" style="position: absolute; visibility: hidden;">
						<h4>
							<a href="#" class="close" onClick="javascript:popupOpen()">Ⅹ</a>
						</h4>
						<h3>리뷰신고</h3>
						<div class="popCont">
							<div class="list">
								<label for="commercial"> <input type="checkbox"
									class="reviewRep" id="commercial" name="reviewRep" value="1"
									onclick="CountChecked(this)">원치 않는 상업적인 리뷰
								</label><br> <br> <label for="intended"> <input
									type="checkbox" id="intended" name="reviewRep"
									class="reviewRep" value="2" onclick="CountChecked(this)">악의적인
									리뷰
								</label><br> <br> <label for="wrong"> <input
									type="checkbox" id="wrong" name="reviewRep" class="reviewRep"
									value="3" onclick="CountChecked(this)">잘못된 정보
								</label><br> <br> <label for="violent"> <input
									type="checkbox" id="violent" name="reviewRep" class="reviewRep"
									value="4" onclick="CountChecked(this)">욕설, 성적, 폭력적인 리뷰
								</label><br> <br>
							</div>
						</div>

						<div class="dec">
							<button id="decBtn">신고하기</button>
						</div>

						
						<form action="rvReply.action" class="rvReplyForm" method="post">
				            <div class="review_body">
				                ${review.rv_content }
				                <c:choose>
				       			<c:when test="${not empty review.reply_content}">
					                <div class="review_reply">
					                    <span class="review_reply">답글 : ${review.reply_content}</span>
					                </div>
				                </c:when>
						        <c:otherwise>
									    
									        <div class="review_reply">
									            <textarea cols="30" rows="2" class="review_reply_txtarea" id="reply_content" name="reply_content"></textarea>
									            <input type="hidden" name="rv_num" value="${review.rv_num }" />
									            <div class="sendBtn">
									                <button type="button" class="review_reply_btn">리뷰답글</button>
									                <button type="reset" class="review_reply_btn">취소하기</button>
									            </div>
									        </div>
									    
								</c:otherwise>
						    	</c:choose>
				            </div>
			            </form>
						
					</div>
				</div>
			</div>
		</div>

		<c:import url="footer.jsp"></c:import>

		<script type="text/javascript">
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {type: 'line' // 차트의 형태
										 // 차트에 들어갈 데이터
                						 ,data: {labels: <%=request.getAttribute("star_labels")%> //x 축  
		                    					,datasets: [{label: '별점평균'	//라벨 제목
									                        ,fill: false	// line 형태일 때, 선 안쪽을 채우는지 안채우는지
									                        ,data: ${star_data}	//x축 label에 대응되는 데이터 값
									                        ,backgroundColor: '#e09a8d'	//포인트 안을 채우는 색상
									                        ,borderColor: '#ef6351'		//선 색상
									                        ,borderWidth: 1}]}			//경계선 굵기
		 								 ,options: {scales: {yAxes: [{ticks: {beginAtZero: true}}]}
		 								 		   ,responsive: false							//
		 								 		   ,scales: {yAxes: [{ticks: {min: 0
																			 ,max: 5
																			 ,stepSize: 1}}]}	// 축 설정
		 								 		   ,legend: {display: false}}});		// 라벨 제목 안보이게 설정
		const canvas = document.getElementById("doughnutChartCanvas");
		const data = {labels: <%=request.getAttribute("rv_labels")%>
  			 		 ,datasets: [{label: "My First Dataset"
     					 		 ,data: <%=request.getAttribute("rv_data")%>
     					 		 ,backgroundColor: ["rgb(255, 99, 132)","rgb(54, 162, 235)","rgb(255, 205, 86)",]
      					 		 ,hoverOffset: 4,},]
      		 		 ,options: {responsive: false, }};
		new Chart(canvas, {type: "doughnut", data,});	
	</script>

	</form>
</body>
</html>