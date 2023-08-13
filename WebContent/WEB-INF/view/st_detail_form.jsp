<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	flex-direction: column;
}

.mainBody
{	
	/* background-color: #F7F4EA; */
	/* margin-left : 19vw; */
	width: 65vw;
	padding-left: 7vw;
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
.button {
    display: flex;
    justify-content: center;
}
label {
    cursor: pointer;
    font-size: 1em;
}


input[name="chooseFile"]
{
    visibility: hidden;
}


.scrollable-row
{
        max-width: 50vw; /* 스크롤 가능한 최대 높이 설정 */
        overflow-x: auto; /* 세로 스크롤 적용 */
       /*  border: 1px solid #ccc; */
}
.scrollable-row table
{
        width: 100%;
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
	
	function loadFile(input) {
		
		var name = document.getElementById('fileName');
		var container = input.parentNode.querySelector('.image-show');
	    
	    // 이미 업로드된 사진이 있을 경우 삭제
	    var existingImage = container.querySelector('img');
	    if (existingImage) {
	        container.removeChild(existingImage);
	    }

	    var file = input.files[0]; // 선택된 파일 가져오기
	    name.textContent = file.name;

	    var newImage = document.createElement('img');
	    newImage.setAttribute('class', 'img');
	    
	    // 이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);

	    newImage.style.width = '30vw';
	    newImage.style.height = '50%';
	    newImage.style.objectFit = 'contain';

	    // 이미지를 image-show div에 추가
	    container.appendChild(newImage);

	    // 이미지는 화면에 나타나도록 설정
	    newImage.style.visibility = 'visible';

	};
	
	function plusTd()
	{
	    var table = document.getElementById('food_table');
	    var lastRow = table.rows[table.rows.length - 1]; // 맨 뒤에 <tr> 추가
	    
	    var cellCount = lastRow.cells.length;

	    var newCell = lastRow.insertCell(cellCount-1); // <td> 추가
	    
	    var content = "<div class='button'>";
	    content += "	<label for='file1'>";
	    content += "	👉 음식 사진 업로드 👈";
	    content += "	</label>";
	    content += "</div>";
	    content += "<input type='file' id='file1"+ cellCount +"' name='chooseFile' accept='image/*' onchange='loadFile(this)'>";
	    content += "<div class='image-show'></div>";
	    content += "<p id='fileName' style='font-size: small'></p>";
	    content += "<label id='label'>";
	    content += "	<input type='text' class='input'>";
	    content += "	<div class='line-box' style='width:60%; margin-left: 3vw;'>";
	    content += "		<div class='line'></div>";
	    content += "	</div>";
	    content += "</label>";
	    
	    newCell.innerHTML = content; // <td> 내용 설정
	    

	};
    
	
</script>

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
		$("#openTime, #closeTime").on("change", function() {
	        var rowClass = $(this).closest("tr").attr("class");
	        
	        alert(rowClass);
		});
	});

</script>

</head>


<body>
<form action="search.action" id="userForm" method="post" enctype="multipart/form-data">
	<div class="header">
		<c:import url="/WEB-INF/view/header_user.jsp"></c:import>
	</div>

	<div id="body">
	
		<div id="column">

		<c:import url="sideBar_user.jsp"></c:import>

		</div>
		
	
		<div class="mainBody" style="margin: 0 auto;">
			
			<div id="st_detail_header">
				<h1>${store.st_name } 정보 수정</h1><br>
				<input type="hidden" id="st_num" name="st_num" value="${store.st_num }">
				<hr>
			</div>
			
			<!-- 영업시간 -->
			<div class="opentime">
				<div>
					<table border="0">
					    <tr>
					        <th style="border-bottom: 5px solid;">&nbsp;&nbsp;영업시간&nbsp;&nbsp;</th>
					    </tr>
					    <c:forEach var="weekday" items="${weekdayLabel }" varStatus="i">
					    	<tr class="week">
								<td></td>
								<th style="padding-right: 1vh;">${weekday }</th>
							    <c:if test="${empty openClose }">
							    	<td>
										<select id="openTime">
											<option value="nocheck">시간 선택</option>
											<c:forEach var="i" begin="0" end="23" >
												<c:forEach var="k" begin="1" end="2">
												<c:if test="${k eq 1 }">
													<option value="${i }:00">${i }:00</option>
												</c:if>
												<c:if test="${k eq 2 }">
													<option value="${i }:30">${i }:30</option>
												</c:if>								
												</c:forEach>
											</c:forEach>
										</select>
									</td>
									<td> ~ </td>
									<td>
										<select id="closeTime">
											<option value="nocheck">시간 선택</option>
											<c:forEach var="i" begin="0" end="23" >
												<c:forEach var="k" begin="1" end="2">
												<c:if test="${k eq 1 }">
													<option value="${i }:00">${i }:00</option>
												</c:if>
												<c:if test="${k eq 2 }">
													<option value="${i }:30">${i }:30</option>
												</c:if>								
												</c:forEach>
											</c:forEach>
										</select>
									</td>
									<td><input type="checkbox" id="rest2" value="3"></td>
									<td><label for="rest2">휴무</label></td>
							    </c:if>
							    <c:if test="${!empty openClose }">
							    	<c:forEach var="oc" items="${openClose }">
							    		<c:if test="${oc.holiday eq '휴무'}">
							    			<td>
												<select class="openTime">
													<option value="nocheck">시간 선택</option>
													<c:forEach var="i" begin="0" end="23" >
														<c:forEach var="k" begin="1" end="2">
														<c:if test="${k eq 1 }">
															<option value="${i }:00">${i }:00</option>
														</c:if>
														<c:if test="${k eq 2 }">
															<option value="${i }:30">${i }:30</option>
														</c:if>								
														</c:forEach>
													</c:forEach>
												</select>
											</td>
											<td> ~ </td>
											<td>
												<select class="closeTime">
													<option value="nocheck">시간 선택</option>
													<c:forEach var="i" begin="0" end="23" >
														<c:forEach var="k" begin="1" end="2">
														<c:if test="${k eq 1 }">
															<option value="${i }:00">${i }:00</option>
														</c:if>
														<c:if test="${k eq 2 }">
															<option value="${i }:30">${i }:30</option>
														</c:if>								
														</c:forEach>
													</c:forEach>
												</select>
											</td>
											<td><input type="checkbox" id="rest6" value="7" checked="checked"></td>
											<td><label for="rest6">휴무</label></td>
							    		</c:if>
							    		<c:if test="${oc.holiday eq '-'}">
							    			<c:if test="${fn:length(trim(oc.operate_time)) > 1}">
							    				<td>
													<select class="openTime">
														<option value="nocheck">시간 선택</option>
														<c:set var="starth" value="${fn:substring(oc.operate_time, 0, 2)}" />
														<c:set var="startm" value="${fn:substring(oc.operate_time, 3, 5)}" />
														<c:forEach var="i" begin="0" end="23" >
															<c:forEach var="k" begin="1" end="2">
															<c:if test="${k eq 1 }">
															<c:choose>
																<c:when test="${i eq stath and k eq startm  }">
																	<option value="${i }:00" selected="selected">${i }:00</option>
																</c:when>
																<c:otherwise>
																	<option value="${i }:00">${i }:00</option>
																</c:otherwise>
															</c:choose>
															</c:if>
															<c:if test="${k eq 2 }">
															<c:choose>
																<c:when test="${i eq stath and k eq startm  }">
																	<option value="${i }:00" selected="selected">${i }:00</option>
																</c:when>
																<c:otherwise>
																	<option value="${i }:00">${i }:00</option>
																</c:otherwise>
															</c:choose>
															</c:if>								
															</c:forEach>
														</c:forEach>
													</select>
												</td>
												<td>
													<select class="closeTime">
														<option value="nocheck">시간 선택</option>
														<c:set var="endh" value="${fn:substring(oc.operate_time, 6, 8)}" />
														<c:set var="endm" value="${fn:substring(oc.operate_time, 9, fn:length(oc.operate_time))}" />
														<c:forEach var="i" begin="0" end="23" >
															<c:forEach var="k" begin="1" end="2">
															<c:if test="${k eq 1 }">
															<c:choose>
																<c:when test="${i eq endh and k eq endm  }">
																	<option value="${i }:00" selected="selected">${i }:00</option>
																</c:when>
																<c:otherwise>
																	<option value="${i }:00">${i }:00</option>
																</c:otherwise>
															</c:choose>
															</c:if>
															<c:if test="${k eq 2 }">
															<c:choose>
																<c:when test="${i eq endh and k eq endm  }">
																	<option value="${i }:00" selected="selected">${i }:00</option>
																</c:when>
																<c:otherwise>
																	<option value="${i }:00">${i }:00</option>
																</c:otherwise>
															</c:choose>
															</c:if>								
															</c:forEach>
														</c:forEach>
													</select>
												</td>
												<td><input type="checkbox" id="rest6" value="7" checked="checked"></td>
												<td><label for="rest6">휴무</label></td>
							    			</c:if>
							    			<c:if test="${fn:length(trim(oc.operate_time)) < 2}">
							    				<td>
													<select class="openTime">
														<option value="nocheck">시간 선택</option>
														<c:forEach var="i" begin="0" end="23" >
															<c:forEach var="k" begin="1" end="2">
															<c:if test="${k eq 1 }">
																<option value="${i }:00">${i }:00</option>
															</c:if>
															<c:if test="${k eq 2 }">
																<option value="${i }:30">${i }:30</option>
															</c:if>								
															</c:forEach>
														</c:forEach>
													</select>
												</td>
												<td> ~ </td>
												<td>
													<select class="closeTime">
														<option value="nocheck">시간 선택</option>
														<c:forEach var="i" begin="0" end="23" >
															<c:forEach var="k" begin="1" end="2">
															<c:if test="${k eq 1 }">
																<option value="${i }:00">${i }:00</option>
															</c:if>
															<c:if test="${k eq 2 }">
																<option value="${i }:30">${i }:30</option>
															</c:if>								
															</c:forEach>
														</c:forEach>
													</select>
												</td>
												<td><input type="checkbox" id="rest6" value="7"></td>
												<td><label for="rest6">휴무</label></td>
							    			</c:if>
							    		</c:if>
							    	</c:forEach>
							    </c:if>
					    </c:forEach>
					</table>
				</div>
				<br>
				<div>
					<table border="0">
					    <tr>
					        <th style="border-bottom: 5px solid;">브레이크타임</th>
					    </tr>
					    <c:forEach var="ww" items="${weekWeekendDayLabel}">
					        <tr>
					            <td></td>
					            <th style="padding-right: 1vh;">${ww}</th>
					            <c:if test="${empty openClose }">
					            	<td>
										<select id="openTime">
											<option value="nocheck">시간 선택</option>
											<c:forEach var="i" begin="0" end="23" >
												<c:forEach var="k" begin="1" end="2">
												<c:if test="${k eq 1 }">
													<option value="${i }:00">${i }:00</option>
												</c:if>
												<c:if test="${k eq 2 }">
													<option value="${i }:30">${i }:30</option>
												</c:if>								
												</c:forEach>
											</c:forEach>
										</select>
									</td>
									<td> ~ </td>
									<td>
										<select id="openTime">
											<option value="nocheck">시간 선택</option>
											<c:forEach var="i" begin="0" end="23" >
												<c:forEach var="k" begin="1" end="2">
												<c:if test="${k eq 1 }">
													<option value="${i }:00">${i }:00</option>
												</c:if>
												<c:if test="${k eq 2 }">
													<option value="${i }:30">${i }:30</option>
												</c:if>								
												</c:forEach>
											</c:forEach>
										</select>
									</td>
									<td><input type="checkbox" id="breaktime2"></td>
									<td><label for="breaktime2">없음</label></td>
					            </c:if>
					            <c:if test="${!empty openClose }">
					            	<c:forEach var="bt" items="${breakTime}">
					            		<c:if test="${fn:contains(bt.week_weekend, ww) and bt.week_weekend eq ww }">
					            			<td>
												<select class="openTime">
													<option value="nocheck">시간 선택</option>
													<c:set var="btstarth" value="${fn:substring(bt.start_breaktime, 0, 2)}" />
													<c:set var="btstartm" value="${fn:substring(bt.start_breaktime, 3, 5)}" />
													<c:forEach var="i" begin="0" end="23" >
														<c:forEach var="k" begin="1" end="2">
														<c:if test="${k eq 1 }">
															<c:choose>
															<c:when test="${i eq btstarth and k eq btstartm }">
																<option value="${i }:00" selected="selected">${i }:00</option>
															</c:when>
															<c:otherwise>
																<option value="${i }:00">${i }:00</option>
															</c:otherwise>
															</c:choose>
														</c:if>
														<c:if test="${k eq 2 }">
															<c:choose>
															<c:when test="${i eq btstarth and k eq btstartm }">
																<option value="${i }:30" selected="selected">${i }:30</option>
															</c:when>
															<c:otherwise>
																<option value="${i }:30">${i }:30</option>
															</c:otherwise>
															</c:choose>
														</c:if>								
														</c:forEach>
													</c:forEach>
												</select>
											</td>
											<td> ~ </td>
											<td>
												<select class="closeTime">
													<option value="nocheck">시간 선택</option>
													<c:set var="btendh" value="${fn:substring(bt.end_breaktime, 0, 2)}" />
													<c:set var="btendm" value="${fn:substring(bt.end_breaktime, 3, 5)}" />
													<c:forEach var="i" begin="0" end="23" >
														<c:forEach var="k" begin="1" end="2">
														<c:if test="${k eq 1 }">
															<c:choose>
															<c:when test="${i eq btendh and k eq btendm }">
																<option value="${i }:00" selected="selected">${i }:00</option>
															</c:when>
															<c:otherwise>
																<option value="${i }:00">${i }:00</option>
															</c:otherwise>
															</c:choose>
														</c:if>
														<c:if test="${k eq 2 }">
															<c:choose>
															<c:when test="${i eq btendh and k eq btendm }">
																<option value="${i }:30" selected="selected">${i }:30</option>
															</c:when>
															<c:otherwise>
																<option value="${i }:30">${i }:30</option>
															</c:otherwise>
															</c:choose>
														</c:if>								
														</c:forEach>
													</c:forEach>
												</select>
											</td>
											<td><input type="checkbox" id="breaktime1"></td>
											<td><label for="breaktime1">없음</label></td>
					            		</c:if>
					            		<c:if test="${!fn:contains(bt.week_weekend, ww)}">
					            			<td>
												<select id="openTime">
													<option value="nocheck">시간 선택</option>
													<c:forEach var="i" begin="0" end="23" >
														<c:forEach var="k" begin="1" end="2">
														<c:if test="${k eq 1 }">
															<option value="${i }:00">${i }:00</option>
														</c:if>
														<c:if test="${k eq 2 }">
															<option value="${i }:30">${i }:30</option>
														</c:if>								
														</c:forEach>
													</c:forEach>
												</select>
											</td>
											<td> ~ </td>
											<td>
												<select id="openTime">
													<option value="nocheck">시간 선택</option>
													<c:forEach var="i" begin="0" end="23" >
														<c:forEach var="k" begin="1" end="2">
														<c:if test="${k eq 1 }">
															<option value="${i }:00">${i }:00</option>
														</c:if>
														<c:if test="${k eq 2 }">
															<option value="${i }:30">${i }:30</option>
														</c:if>								
														</c:forEach>
													</c:forEach>
												</select>
											</td>
											<td><input type="checkbox" id="breaktime2"></td>
											<td><label for="breaktime2">없음</label></td>
					            		</c:if>
					            	</c:forEach>
					            </c:if>
					        </tr>
					    </c:forEach>
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
							<c:if test="${fn:length(stPayList) > 0}">
								<c:forEach var="paylabel" items="${payLabel }">
									<c:choose>
									<c:when test="${fn:contains(stPayList, paylabel.pay_name)}">
										<input type="checkbox" id="paych${paylabel.pay_num }" name="pay" checked="checked">
										<label for="paych${paylabel.pay_num }">${paylabel.pay_name }</label>
									</c:when>
									<c:otherwise>
										<input type="checkbox" id="paych${paylabel.pay_num }" name="pay" checked="checked">
										<label for="paych${paylabel.pay_num }">${paylabel.pay_name }</label>
									</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(stPayList) == 0}">
								<c:forEach var="paylabel" items="${payLabel }">
									
									<input type="checkbox" id="paych${paylabel.pay_num }" name="pay">
									<label for="paych${paylabel.pay_num }">${paylabel.pay_name }</label>
									
								</c:forEach>
							</c:if>
							
							<!-- <input type="checkbox" id="paych3" name="card"><label for="paych3">네이버페이</label>
							<input type="checkbox" id="paych4" name="card"><label for="paych4">페이코</label>
							<input type="checkbox" id="paych5" name="card"><label for="paych5">지역화폐</label> -->
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
						<c:set var="food" value="${store.food_name }"/>
						<c:forEach var="foodlabel" items="${foodLabel }">
							<c:choose>
							<c:when test="${foodlabel.food_name eq food }">
								<input type="checkbox" id="foodch${foodlabel.food_num }" name="food_cat" checked="checked">
								<label for="foodch${foodlabel.food_num }">${foodlabel.food_name }</label>
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="foodch${foodlabel.food_num }" name="food_cat">
								<label for="foodch${foodlabel.food_num }">${foodlabel.food_name }</label>
							</c:otherwise>
							</c:choose>
						</c:forEach>
							<!-- <input type="checkbox" id="foodch8" name="food_cat"><label for="foodch8">카페</label>
							<input type="checkbox" id="foodch9" name="food_cat"><label for="foodch9">베이커리</label> -->
						</td>
					</tr>
				</table>
			</div>
			
			<br>
			
			<!-- 메뉴등록 -->
			<div class="food_menu scrollable-row">
				<table id="food_table" border="0">
					<tr>
						<th style="border-bottom: 5px solid;">메뉴</th>
					</tr>
					<tr class="menuTr">
						<td></td>
						<td>
					    	<div class="button">
								<label for="file1">
									👉 음식 사진 업로드 👈
								</label>
						    </div>
						    	<input type="file" id="file1" name="chooseFile" accept="image/*" onchange="loadFile(this)">
						    <div class="image-show"></div>
						    <p id="fileName" style="font-size: small"></p>
							<label id="label">
								<input type="text" class="input">
								<div class="line-box" style="width:60%; margin-left: 3vw;">
								    <div class="line"></div>
								</div>
							</label>
						</td>
						<td>
							<div class="button">
								<label for="file2">
									👉 음식 사진 업로드 👈
								</label>
						    </div>
						    	<input type="file" id="file2" name="chooseFile" accept="image/*" onchange="loadFile(this)">
						    <div class="image-show"></div>
						    <p id="fileName" style="font-size: small"></p>
							<label id="label">
								<input type="text" class="input">
								<div class="line-box" style="width:60%; margin-left: 3vw;">
								    <div class="line"></div>
								</div>
							</label>
						</td>
						<td>
							<div style="width: 200px; height: 150px; display: flex; justify-content: center;">
								<input type="button" class="plusBtn" value="+" style="border: 1; margin: auto; display: block;" onclick="plusTd()"> 
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
				<input type="text" class="input" value="${store.max_customers }">
				<div class="line-box">
				  	<div class="line"></div>
				</div>
			</label>
			
			
			<!-- 사업자 이메일 -->
			<label id="label">
				<p class="label-txt">사업자 이메일</p>
				<input type="text" class="input" value="${store.st_email }">
				<div class="line-box">
				    <div class="line"></div>
				</div>
			</label>
			
			
			
			<!-- 가게 설명 -->
			<label id="label">
				<p class="label-txt">가게 설명</p>
				<input type="text" class="input" value="${store.st_explain }">
				<div class="line-box">
				    <div class="line"></div>
				</div>
			</label>
			
			
			<!-- 가게페이지 링크 -->
			<label id="label">
				<p class="label-txt">가게페이지 링크</p>
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