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
<title>storeDetail-userView.jsp</title>


<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/compareBox.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_join2.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
	


<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
#body 
{	
	width: 100%;
	display: flex;
}

.mainBody
{	
	/* background-color: #F7F4EA; */
	margin-left : 5vw;
	width: 80vw;
}

.main 
{	
	padding-top: 2vh;
}

.container1 
{
	float: left;
}

.main-left
{
	width: 50%;
	height: 40vh;
	float: left;
	text-align: center;
}

.main-right 
{
	width: 50%;
	height: 40vh;
	float: right;
	text-align: center;
}


.opli, .btli
{
	border : 2vw;
	width: 10vw;
	height: 3vh;
}

#weekList li, .time li
{
	padding-bottom: 0.5vw;
	padding-right: 0.5vw;
	padding-left: 0.5vw;
	padding-top: 0.5vw;
	list-style: none;
	border-radius: 11px; 
}

.revKeyList li
{	
	padding-bottom: 0.3vw;
	padding-top: 0.3vw;
	background-color: #F8E6E0;
	border : 1px solid #F781BE;
	margin: 0.5vw;
	border-radius: 11px; 
	list-style: none;
}

.revKeyList input
{	
	background: none;
	border : 0;
	list-style: none;
}

.openclose
{
	width: 50%;
	float: left;
}

.time 
{
	width: 50%;
	float: left;
	text-align: center;
}

.btli
{
	text-align: center;
}

.container2 
{	
	margin-top : 20vh;
	margin-left: 4vw;
}

.info 
{
	width: 100%;
	height: 50%;
	display: flex;
	padding-right: 2vw;
	text-align: left;
	margin: 1vw;
}


.info input, textarea
{	
	width: 35vw;
	height: 4vh;
	background-color: #F8E6E0;
	border: 0;
}

.container3, .container4 
{
	width: 100%;
	float: left;
	margin-top: 3vh;
}

.container3
{
	padding-left: 0.2vw;
}


.thumbnail 
{
	width: 10vw;
	height: 17vh;
	float: left;
}

.img-rounded 
{
	width: 100%;
	height: 100%;
}

.main ul 
{
	list-style-type: none;
}

.menu 
{
	display: flex;
	justify-content: space-evenly;
	padding-right: 5vw;
	padding-left: 5vw;
}


.form 
{
	padding-left: 3vw;
}

.revBoard 
{
	padding-left: 2vw;
}

.menuList 
{
	display: flex;
	margin-left: 3vw;
}

.menuPhoto 
{
	padding: 1vw;
}

.revBack 
{	
	width: 90%;
	height: 14vh;
	background-color: #EED2CE;
	border-radius: 11px; 
}

.btn
{
	background-color: #F7AF97;
    border: 1px #EF6351;
    border-radius: 8px;
    color: white;
    font-size: 10pt;
    font-family: 'IBM Plex Sans KR', sans-serif;
    cursor: pointer;
}

#repCon 
{
	float: right;
}

.reViews 
{
	padding-bottom: 2vh;
}

.recBtn
{
	float: right;
}

.main
{
	margin: 10%;
}
table
{
	border-spacing: 6px;
}

#label {
  display: block;
  position: relative;
  margin: 40px 0px;
}

.input {
  width: 100%;
  padding: 10px;
  background: transparent;
  border: none;
  outline: none;
}

.line-box {
  position: relative;
  width: 100%;
  height: 2px;
  background: #BCBCBC;
}

.line {
  position: absolute;
  width: 0%;
  height: 2px;
  top: 0px;
  left: 50%;
  transform: translateX(-50%);
  background: #ef6351;
  transition: ease .6s;
}

.input:focus + .line-box .line {
  width: 100%;
}

.label-txt {
  position: absolute;
  top: -1.6em;
  padding: 10px;
  font-family: sans-serif;
  font-size: .8em;
  letter-spacing: 1px;
  color: rgb(120,120,120);
  transition: ease .3s;
}

.label-active {
  top: -3em;
}

.storeOption input
{
	zoom:1.5;
}
.food_cat input
{
	border: 0;
	font-size: 13px;
	width: 2vh;
	margin-left: 1vh;
}
.card input
{
	border: 0;
	font-size: 13px;
	width: 2vh;
	margin-left: 1vh;
}
.btnSend
{
	display: flex;
	justify-content: space-evenly;
}

</style>


<script type="text/javascript">	
	
	$(document).ready(function(){

		$('input[type="text"][class="input"]').focus(function(){
			$(this).parent().find(".label-txt").addClass('label-active');
		});
		
		
		$('input[type="text"][class="input"]').focusout(function(){
			if ($(this).val() == '') {
				$(this).parent().find(".label-txt").removeClass('label-active');
			};
		});
	});
	
	
	/* checkbox 하나만 선택 가능 */
	$(document).ready(function()
	{
		$('input[type="checkbox"][name="toilet"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="toilet"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		
		$('input[type="checkbox"][name="puppy"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="puppy"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		
		$('input[type="checkbox"][name="room"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="room"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});

		$('input[type="checkbox"][name="reservation"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="reservation"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
				
		$('input[type="checkbox"][name="parking"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="parking"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		
		$('input[type="checkbox"][name="internet"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="internet"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		
		$('input[type="checkbox"][name="food_cat"]').click(function()
		{
			if($(this).prop('checked')){
				$('input[type="checkbox"][name="food_cat"]').prop('checked',false);
				$(this).prop('checked', true);
			}
		});
		

	    $('#why1').keyup(function (e) {
	    	let content = $(this).val();
	        
	        // 글자수 세기
	        if (content.length == 0 || content == '') {
	        	$('.textCount').text('0자');
	        } else {
	        	$('.textCount').text(content.length + '자');
	        }
	        
	        // 글자수 제한
	        if (content.length > 5) {
	        	// 200자 부터는 타이핑 되지 않도록
	            $(this).val($(this).val().substring(0, 5));
	            // 200자 넘으면 알림창 뜨도록
	            /* errorMessage.style.display = 'inline'; */
				$("#errMessage1").show();
	        };
	    });
	    $('#why2').keyup(function (e) {
	    	let content = $(this).val();
	        
	        // 글자수 세기
	        if (content.length == 0 || content == '') {
	        	$('.textCount').text('0자');
	        } else {
	        	$('.textCount').text(content.length + '자');
	        }
	        
	        // 글자수 제한
	        if (content.length > 5) {
	        	// 200자 부터는 타이핑 되지 않도록
	            $(this).val($(this).val().substring(0, 5));
	            // 200자 넘으면 알림창 뜨도록
	            /* errorMessage.style.display = 'inline'; */
				$("#errMessage2").show();
	        };
	    });
	    $('#why3').keyup(function (e) {
	    	let content = $(this).val();
	        
	        // 글자수 세기
	        if (content.length == 0 || content == '') {
	        	$('.textCount').text('0자');
	        } else {
	        	$('.textCount').text(content.length + '자');
	        }
	        
	        // 글자수 제한
	        if (content.length > 5) {
	        	// 200자 부터는 타이핑 되지 않도록
	            $(this).val($(this).val().substring(0, 5));
	            // 200자 넘으면 알림창 뜨도록
	            /* errorMessage.style.display = 'inline'; */
				$("#errMessage3").show();
	        };
	    });
	});
	
    
	
</script>

</head>


<body>
<form action="search.action" id="userForm" method="post">
	<div class="header">
		<c:import url="/WEB-INF/view/header_user.jsp"></c:import>
	</div>

	<div id="body">
	
		<div id="column"></div>

		<!-- 왼쪽 메뉴 배너 -->
		<!-- 왼쪽 메뉴 -->
		<div class="left side-menu">
			<div class="sidebar-inner">
				<div id="sidebar-menu">
					<ul class="has_sub_menu">
						<li class="has_sub"><a href="javascript:void(0);"
							class="waves-effect"> <i class="fas fa-bars"
								style="color: #fff"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 왼쪽 서브 메뉴 -->
		<div class="left_sub_menu">
			<div class="sub_menu">
				<h2>MENU</h2>
				<ul class="big_menu">
					<li>가게 리스트<i class="arrow fas fa-angle-right"></i></li>

					<ul class="small_menu">
						<li><a href="#" class="small_menuA">가게1</a></li>
						<li><a href="#" class="small_menuA">가게2</a></li>
						<li><a href="#" class="small_menuA">가게3</a></li>
						<li><a href="#" class="small_menuA">가게4</a></li>
					</ul>
				</ul>
				<ul class="big_menu">
					<li>접수 내역<i class="arrow fas fa-angle-right"></i></li>
					<ul class="small_menu">
						<li><a href="#" class="small_menuA">소메뉴2-1</a></li>
						<li><a href="#" class="small_menuA">소메뉴2-2</a></li>
					</ul>
				</ul>
				<ul class="big_menu">
					<li>경고 내역</li>
				</ul>
				<ul class="big_menu">
					<li>새로운 가게 등록 신청</i></li>
				</ul>
			</div>
		</div>
		
		<div class="overlay">
			<input type="hidden" id="checkOverlay" value="false">
		</div>
		
	</div>
		
		
	
	<div class="mainBody" style="margin: 0 auto;">
		
		<div id="st_detail_header">
			<h1>매장 정보 기입(선택)</h1><br>
			<hr>
		</div>
		
		<!-- 영업시간 -->
		<div class="opentime">
			<div>
				<table border="0">
					<tr>
						<th style="border-bottom: 5px solid;">&nbsp;&nbsp;영업시간&nbsp;&nbsp;</th>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh;">월요일</th>
						<td>10:00</td>
						<td> ~ </td>
						<td>10:00</td>
						<td><input type="checkbox" id="rest1"></td>
						<td><label for="rest1">휴무</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh;">화요일</th>
						<td>10:00</td>
						<td> ~ </td>
						<td>10:00</td>
						<td><input type="checkbox" id="rest2"></td>
						<td><label for="rest2">휴무</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh;">수요일</th>
						<td>10:00</td>
						<td> ~ </td>
						<td>10:00</td>
						<td><input type="checkbox" id="rest3"></td>
						<td><label for="rest3">휴무</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh;">목요일</th>
						<td>10:00</td>
						<td> ~ </td>
						<td>10:00</td>
						<td><input type="checkbox" id="rest4"></td>
						<td><label for="rest4">휴무</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh;">금요일</th>
						<td>10:00</td>
						<td> ~ </td>
						<td>10:00</td>
						<td><input type="checkbox" id="rest5"></td>
						<td><label for="rest5">휴무</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh;">토요일</th>
						<td>10:00</td>
						<td> ~ </td>
						<td>10:00</td>
						<td><input type="checkbox" id="rest6"></td>
						<td><label for="rest6">휴무</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh;">일요일</th>
						<td>10:00</td>
						<td> ~ </td>
						<td>10:00</td>
						<td><input type="checkbox" id="rest7"></td>
						<td><label for="rest7">휴무</label></td>
					</tr>
				</table>
			</div>
			<br>
			<div>
				<table border="0">
					<tr>
						<th style="border-bottom: 5px solid;">브레이크타임</th>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh;">평일</th>
						<td>10:00</td>
						<td> ~ </td>
						<td>10:00</td>
						<td><input type="checkbox" id="breaktime1"></td>
						<td><label for="breaktime1">없음</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh;">주말</th>
						<td>10:00</td>
						<td> ~ </td>
						<td>10:00</td>
						<td><input type="checkbox" id="breaktime2"></td>
						<td><label for="breaktime2">없음</label></td>
					</tr>
				</table>
			</div>
		</div>
		
		<br>
		<!-- 결제수단 -->
		<div class="card">
			<table border="0">
				<tr>
					<th style="border-bottom: 5px solid;">&nbsp;&nbsp;&nbsp;결제수단&nbsp;&nbsp;&nbsp;</th>
					<td>
						<input type="checkbox" id="chbox1" name="card"><label for="chbox1">제로페이</label>
						<input type="checkbox" id="chbox2" name="card"><label for="chbox2">카카오페이</label>
						<input type="checkbox" id="chbox3" name="card"><label for="chbox3">네이버페이</label>
						<input type="checkbox" id="chbox4" name="card"><label for="chbox4">지역화폐</label>
					</td>
				</tr>
			</table>
		</div>
		
		<br>
		<!-- 음식 카테고리 -->
		<div class="food_cat">
			<table border="0">
				<tr>
					<th style="border-bottom: 5px solid;">음식 카테고리</th>
					<td>
						<input type="checkbox" id="chbox1" name="food_cat"><label for="chbox1">한식</label>
						<input type="checkbox" id="chbox2" name="food_cat"><label for="chbox2">일식</label>
						<input type="checkbox" id="chbox3" name="food_cat"><label for="chbox3">중식</label>
						<input type="checkbox" id="chbox4" name="food_cat"><label for="chbox4">양식</label>
						<input type="checkbox" id="chbox5" name="food_cat"><label for="chbox5">카페</label>
						<input type="checkbox" id="chbox6" name="food_cat"><label for="chbox6">베이커리</label>
					</td>
				</tr>
			</table>
		</div>
		
		<br>
		
		<!-- 메뉴등록 -->
		<div class="food_menu">
			<table border="0">
				<tr>
					<th style="border-bottom: 5px solid;">메뉴</th>
				</tr>
				<tr>
					<td></td>
					
					<td>
						<div>
							<img src="#" style="width: 200px; height: 150px;">
						</div>
						<div>
							<p style="text-align: center;">떡볶이</p>
						</div>
					</td>
					
					<td>
						<div>
								<img src="#" style="width: 200px; height: 150px;">
						</div>
						<div>
							<p style="text-align: center;">어묵</p>
						</div>
					</td>
					<td>
						<div>
							<img src="#" style="width: 200px; height: 150px;">
						</div>
						<div>
							<p style="text-align: center;">순대</p>
						</div>				
					</td>
					<td>
						<div style="width: 200px; height: 150px; display: flex; justify-content: center;">
							<input type="button" class="plusBtn" value="+" style="border: 1; margin: auto; display: block;"> 
						</div>
						<div>
							<p style="text-align: center;">&nbsp;</p>
						</div>
						
					</td>
				</tr>
			</table>
		</div>
		
		
		<!-- 수용인원 -->
		<label id="label">
			<p class="label-txt">수용인원</p>
			<input type="text" class="input">
			<div class="line-box">
			  	<div class="line"></div>
			</div>
		</label>
		
		
		<!-- 사업자 이메일 -->
		<label id="label">
			<p class="label-txt">사업자 이메일</p>
			<input type="text" class="input">
			<div class="line-box">
			    <div class="line"></div>
			</div>
		</label>
		
		
		
		<!-- 가게 설명 -->
		<label id="label">
			<p class="label-txt">가게 설명</p>
			<input type="text" class="input">
			<div class="line-box">
			    <div class="line"></div>
			</div>
		</label>
		
		
		<!-- 가게페이지 링크 -->
		<label id="label">
			<p class="label-txt label-active">가게페이지 링크</p>
			<input type="text" class="input">
			<div class="line-box">
			    <div class="line"></div>
			</div>
		</label>
		
		
		<!-- 가게 옵션 -->
		<div class="storeOption">
			<div>
				<table border="0">
					<tr>
						<th style="border-bottom: 5px solid;">&nbsp;&nbsp;가게옵션&nbsp;&nbsp;</th>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh; text-align: left;">화장실 존재 여부</th>
						<td><input type="checkbox" name="toilet" id="toilet" onclick="checkOnlyOne(this)"></td>
						<td style="padding-right: 1vh;"><label for="toilet">있음</label></td>
						<td><input type="checkbox" name="toilet" id="toilet2" onclick="checkOnlyOne(this)"></td>
						<td><label for="toilet2">없음</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh; text-align: left;">애견 동반 여부</th>
						<td><input type="checkbox" name="puppy" id="puppy"></td>
						<td style="padding-right: 1vh;"><label for="puppy">가능</label></td>
						<td><input type="checkbox" name="puppy" id="puppy2"></td>
						<td><label for="puppy2">불가능</label></td>
					</tr>
					
					<tr>
						<td></td>
						<th style="padding-right: 1vh; text-align: left;">연회석 존재 여부</th>
						<td><input type="checkbox" name="room" id="room"></td>
						<td><label for="room">있음</label></td>
						<td><input type="checkbox" name="room" id="room2"></td>
						<td><label for="room2">없음</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh; text-align: left;">예약 가능 여부</th>
						<td><input type="checkbox" name="reservation" id="reservation"></td>
						<td><label for="reservation">가능</label></td>
						<td><input type="checkbox" name="reservation" id="reservation2"></td>
						<td><label for="reservation2">불가능</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 1vh; text-align: left;">주차 가능 여부</th>
						<td><input type="checkbox" name="parking" id="parking"></td>
						<td><label for="parking">가능</label></td>           
						<td><input type="checkbox" name="parking" id="parking2"></td>
						<td><label for="parking2">불가능</label></td>
					</tr>
					<tr>
						<td></td>
						<th style="padding-right: 2vh; text-align: left;">무선 인터넷 사용 가능 여부</th>
						<td><input type="checkbox" name="internet" id="internet"></td>
						<td><label for="internet">가능</label></td>           
						<td><input type="checkbox" name="internet" id="internet2"></td>
						<td><label for="internet2">불가능</label></td>          
					</tr>
				</table>
			</div>
		</div>
		
		
		<!-- 가게 선택 키워드 -->
		<div>
			<div class="userIbmat">
			<div class="ibmatTitleDiv">
				<span id="ibmatTitle">가게키워드 선택</span> &nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		
			<div class="ibmatSelectDiv">
				
				<div class="selectLeft">
					<label class="ibmatlabel" for="ibmat1">
						<input type="checkbox" class="ibmatCB" id="ibmat1">
						인테리어가 멋져요
					</label>
					<br><br>
					
					
					<label class="ibmatlabel" for="ibmat2">
						<input type="checkbox" class="ibmatCB" id="ibmat2">
						혼자오기 좋아요
					</label>
					<br><br>
				
					<label class="ibmatlabel" for="ibmat3">
						<input type="checkbox" class="ibmatCB" id="ibmat3">
						단체모임하기 좋아요
					</label>
					<br><br>
						
					<label class="ibmatlabel" for="ibmat4">
						<input type="checkbox" class="ibmatCB" id="ibmat4">
						매장이 넓어요
					</label>
					<br><br>
				</div>
				
				<div class="selectRight">	
					<label class="ibmatlabel" for="ibmat5">
						<input type="checkbox" class="ibmatCB" id="ibmat5">
						애견메뉴가 있어요
					</label>
					<br><br>
				
					<label class="ibmatlabel" for="ibmat6">
						<input type="checkbox" class="ibmatCB" id="ibmat6">
						포장이 가능해요
					</label>
					<br><br>
				</div>
				
			</div>
		</div>
		
		<!-- 가게 검색 키워드 -->
		<div>
			<div class="userIbmat">
			<div class="ibmatTitleDiv">
				<span id="ibmatTitle">가게검색 키워드</span> &nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		
		<label id="label">
			<p class="label-txt label-active">가게 검색 키워드1 (5글자 이내)</p>
			<input type="text" class="input" id="why1">
			<div class="line-box">
			    <div class="line"></div>
			</div>
			
			<span id="errMessage1" style="color: red; display: none;">5글자 이내로 입력해주세요</span>
		</label>
		
		<label id="label">
			<p class="label-txt label-active">가게 검색 키워드2 (5글자 이내)</p>
			<input type="text" class="input" id="why2">
			<div class="line-box">
			    <div class="line"></div>
			</div>
			
			<span id="errMessage2" style="color: red; display: none;">5글자 이내로 입력해주세요</span>
		</label>
		
		<label id="label">
			<p class="label-txt label-active">가게 검색 키워드3 (5글자 이내)</p>
			<input type="text" class="input" id="why3">
			<div class="line-box">
			    <div class="line"></div>
			</div>
			
			<span id="errMessage3" style="color: red; display: none;">5글자 이내로 입력해주세요</span>
		</label>
		
		
		<br><br>
		<!-- 등록버튼 -->
		<div class="btnSend">
			<input type="submit" value="등록">
		</div>
		
			
			
	</div><!-- mainbody -->
	


	
	<div class="footer">
		<c:import url="/WEB-INF/view/footer.jsp"></c:import>
	</div>

</div>
<!-- main -->
	
</form>
</body>
</html>