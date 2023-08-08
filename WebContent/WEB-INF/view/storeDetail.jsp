<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storeDetail-userView.jsp</title>


<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/compareBox.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/storeDetail.css">

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/side_bar.css">


<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
#body {
	width: 100%;
	display: flex;
}

.mainBody {
	background-color: #F7F4EA;
	margin-left: 20vw;
	width: 60vw;
}

.main {
	padding-top: 2vh;
}

.container1 {
	float: left;
}

.main-left {
	width: 50%;
	height: 40vh;
	float: left;
	text-align: center;
}

.main-right {
	width: 50%;
	height: 40vh;
	float: right;
	text-align: center;
}

.opli, .btli {
	border: 2vw;
	width: 10vw;
	height: 3vh;
}

#weekList li, .time li {
	padding-bottom: 0.5vw;
	padding-right: 0.5vw;
	padding-left: 0.5vw;
	padding-top: 0.5vw;
	list-style: none;
	border-radius: 11px;
}

.revKeyList li {
	padding-bottom: 0.3vw;
	padding-top: 0.3vw;
	background-color: #F8E6E0;
	border: 1px solid #F781BE;
	margin: 0.5vw;
	border-radius: 11px;
	list-style: none;
}

.revKeyList input {
	background: none;
	border: 0;
	list-style: none;
}

.openclose {
	width: 50%;
	float: left;
}

.time {
	width: 50%;
	float: left;
	text-align: center;
}

.btli {
	text-align: center;
}

.container2 {
	margin-top: 20vh;
	margin-left: 4vw;
}

.info {
	width: 100%;
	height: 50%;
	display: flex;
	padding-right: 2vw;
	text-align: left;
	margin: 1vw;
}

.info input, textarea {
	width: 35vw;
	height: 4vh;
	background-color: #F8E6E0;
	border: 0;
}

.container3, .container4 {
	width: 100%;
	float: left;
	margin-top: 3vh;
}

.container3 {
	padding-left: 0.2vw;
}

.thumbnail {
	width: 10vw;
	height: 17vh;
	float: left;
}

.img-rounded {
	width: 100%;
	height: 100%;
}

.main ul {
	list-style-type: none;
}

.menu {
	display: flex;
	justify-content: space-evenly;
	padding-right: 5vw;
	padding-left: 5vw;
}

.form {
	padding-left: 3vw;
}

.revBoard {
	padding-left: 2vw;
}

.menuList {
	display: flex;
	margin-left: 3vw;
}

.menuPhoto {
	padding: 1vw;
}

.revBack {
	width: 90%;
	height: 14vh;
	background-color: #EED2CE;
	border-radius: 11px;
}

.btn {
	background-color: #F7AF97;
	border: 1px #EF6351;
	border-radius: 8px;
	color: white;
	font-size: 10pt;
	font-family: 'IBM Plex Sans KR', sans-serif;
	cursor: pointer;
}

#repCon {
	float: right;
}

.reViews {
	padding-bottom: 2vh;
}

.recBtn {
	float: right;
}


</style>


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
	
	// 모달--------------------------------------------------------------------------
	function popupOpen()
	{

		if (document.all.popup.style.visibility == "hidden")
		{
			document.all.popup.style.visibility = "visible";
			bgLayerOpen();
			
			var $layerPopupObj = $('#popup');
			var left = ( $(window).scrollLeft() + ($(window).width() - $layerPopupObj.width()) / 2 );
			var top = ( $(window).scrollTop() + ($(window).height() - $layerPopupObj.height()) / 2 );
			
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
	<form action="search.action" id="userForm" method="post">
		<div class="header">
			<c:import url="header_user.jsp"></c:import>
		</div>

		<div id="body">

			<div id="column">

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


			<div class="mainBody">

				<div id="container1" class="">
					<c:forEach var="s" items="${store }">
						<div class="placeholders main">

							<div class="placeholder main-left">

								<div class="background" style="font-weight: bold;">
									<div class="storeName">
										<span style="font-size: 30pt; font-weight: bold;">${s.st_name }</span>
									</div>
									<div class="revBoard">
										<div class="storeImgDiv">
											<img class="storeImg" src="<%=cp%>/images/store_img01.png">
										</div>

										<div class="info">
											<div class="likeRevC likeNum">
												찜 ❤ &nbsp; <span>${clikeNum }</span>
											</div>
											<div class="likeRevC score">
												별점 ⭐<span>${s.star_avg}</span>
											</div>

											<div class="likeRevC reviewNum">
												리뷰 수 &nbsp; <span>${s.rv_count}</span>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="placeholder main-right">
								<div class="background"
									style="font-weight: bold; margin-top: 1vh;">
									<div class="ocName">
										<span style="font-size: 18pt;">[영업 시간]</span>
									</div>
									<div id="weekList" class="openclose background">
										<div id="opencloseholiday">
											<div id='opencloseholidayName'>
												<div class="dayname">요일</div>
												<div class="time">운영시간</div>
												<div class="holiday">휴무</div>
											</div>
											<div id="opencloseholidayList">
												<c:forEach var="op" items="${openClose}">
													<%-- <li><input class="opli" type="text"
												style="text-align: center;"
												placeholder="${op.day_name} ${op.start_time}:00 ~ ${op.end_time}:00"
												readonly="readonly" /></li> --%>
													<div class="ochList">
														<div class="dayname">${op.day_name }</div>
														<div class="time">${op.operate_time }</div>
														<div class="holiday">${op.holiday }</div>
													</div>
												</c:forEach>
											</div>
										</div>
										<div id="breakTime">
											<c:forEach var="breakTime" items="${breakTime }">
												<div class="breakName">브레이크타임</div>
												<div class="breakList">
													<div>[${breakTime.week_weekend }]
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
													<div>${breakTime.start_breaktime }~
														${breakTime.end_breaktime }</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="storeKeywordsDiv">
							<c:forEach var="keyword" items="${stKeys }">
								"${keyword.st_keyword }" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</div>

						<div class="storeinfo">
							<div class="storeInfoList">
								<div id="catName" class="siList1">카테고리</div>
								<div id="addrName" class="siList1">주소</div>
								<div id="telName" class="siList1">전화번호</div>
								<div id="emailName" class="siList1">e-mail</div>
								<div id="maxName" class="siList1">최대수용인원수</div>
								<div id="payName" class="siList1">결제수단</div>
								<div id="explainName" class="siList1">가게 설명</div>

							</div>

							<div class="storeInfoValue">
								<div id="cat" class="siList2">${s.food_name }</div>
								<div id="addr" class="siList2">${s.st_location }</div>
								<div id="tel" class="siList2">${s.st_tel }</div>
								<div id="email" class="siList2">${s.st_email }</div>
								<div id="max" class="siList2">${s.max_customers }</div>
								<div id="pay" class="siList2"></div>
								<div id="explain" class="siList2">${s.st_explain }</div>
							</div>


							<!-- <div>
						
							체크박스 들어올 영역!!
						
							</div> -->
						</div>
					</c:forEach>

					<div id="menuboard" class="container3">

						<!-- 메뉴 -->
						<h2>메뉴</h2>
						<div class="menuList">
							<c:forEach var="ml" items="${menuLists }">
								<div class="menu">

						<div id="rv-Keyword">
							<br /> <br />
							<!-- 메뉴 -->
							<h1 style="padding-left: 4vw;">메뉴</h1>
							<div class="menuList" style="padding-bottom: 1vh;">
								<!-- 
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴1 : 15,000원
								</a>
							</div>
							-->
						</div>
						<div class="col-xs-16 col-md-16 menuList">
							<!-- 
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴2 : 14,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴3 : 13,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴4 : 13,500원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴5 : 15,500원
								</a>
							</div>
							 -->
							</div>
							<div class="col-xs-16 col-md-16 menuList">
								<!-- 
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴6 : 14,000원
								</a>
							</div>
							-->
                
							<c:forEach var="ml" items="${menuLists }">
								<div class="menuPhoto">
									<a class="thumbnail" style="font-weight: bold;"> <img src="images/${ml.image_link }"
										alt="..." class="img-rounded" style="border-radius: 15px;">${ml.menu_name } <br /> : ${ml.price }원
									</a>
								</div>
							</c:forEach>
						<--
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴7 : 12,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴8 : 11,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴9 : 9,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴10 : 8,000원
								</a>
							</div>
							 -->
								<c:forEach var="ml" items="${menuLists }">

									<div class="menuPhoto">
										<img class="thumbnail" src="<%=cp %>/images/${ml.image_link }" />
									</div>
									<div class="menuName">${ml.menu_name }</div>
									<div class="menuPrice">${ml.price }원</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class=" container4">

						<div id="reviewList">
							<h2>리뷰</h2>
							

							<div class="rvKeyList">
								<c:forEach var="rvKey" items="${reviewKeys }">
									<div class="rvKey">
										${rvKey.rv_key_name }

						<div id="reviewList" style="margin-top: 5vh; margin-left: 2vw;">
							<h1 style="padding-left: 2vw; display: inline;">리뷰</h1>
							<button type="submit" class="btn" style="margin-left: 42vw;">리뷰
								작성하기</button>
							<br />

							<ul style="display: flex; text-align: center;">	
								<c:forEach var="sK" items="${stKeys }">
									<li style="display: inline-block;"><input class="" type="text" style="text-align: center; font-weight: bold;"
									placeholder="${sK.st_keyword }" readonly="readonly" /></li>
								</c:forEach>
							</ul>
							<br />
							<div id="revList" style="margin-left: 1vw;">
							<c:forEach var="rv" items="${reViews }">
								<div class="reViews">
									<div class="reView revBack">
										<span id="userId" style="font-size: 15pt; font-weight: bold; margin-left: 1vw;">${rv.user_nickname }</span><br />
										<textarea class=" reV" style="height: 7vh; margin-left: 1vw; font-size: 12pt; font-weight: bold;"
											placeholder="${rv.rv_content}" readonly="readonly"></textarea>
										<div id="repCon">
											<span style="padding-left: 16px; display: inline;">작성
												일자 : ${rv.reg_date }</span><br />
											<button type="submit" class="reportBtn btn" style="float: right;">신고하기</button><br />
											<div class="revRec" style="padding-left: 5px;">
												<button type="button" class="recBtn btn" onclick="">비추천</button>
												<span class="glyphicon glyphicon-star-empty" style="float: right;" aria-hidden="true"> ${rv.rec_nonrec_name2 } </span>
												<button type="button" class="recBtn btn" onclick="">추천</button>
												<span class="glyphicon glyphicon-star" style="float: right;" aria-hidden="true"> ${rv.rec_nonrec_name1 } </span>

							<div class="revKeyList">
								<br />
								<ul style="display: flex; text-align: center;">
									<!-- 
								<li><input class="" type="text"
									placeholder="리뷰 키워드1" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드2" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드3" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드4" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드5" readonly="readonly" /></li>
								 -->
									<c:forEach var="sK" items="${stKeys }">
										<li style="display: inline-block;"><input class=""
											type="text" style="text-align: center; font-weight: bold;"
											placeholder="${sK.st_keyword }" readonly="readonly" /></li>
									</c:forEach>
								</ul>
								<!-- 
							<ul style="display: flex;">
								<li><input class="" type="text"
									placeholder="리뷰 키워드6" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드7" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드8" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드9" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드10" readonly="readonly" /></li>
							</ul>
							 -->
								<br />
								<div id="revList" style="margin-left: 1vw;">
									<!-- 
								<div class="reViews">
									<div class="reView revBack">
										<span id="userId" style="font-size: 15pt; font-weight: bold; margin-left: 1vw;">디토</span><br />
										<textarea class=" reV" style="height: 7vh; margin-left: 1vw;" placeholder="훌쩍 훌쩍 커버렸어"
											readonly="readonly"></textarea>
										<div id="repCon">
											<span style="padding-left: 16px; display: inline;">작성
												일자 : 2023.08.02</span><br />
											<div class="revRec" style="padding-left: 5px;">
												<button type="button" class="recBtn" onclick="">비추천</button>
												<span class="glyphicon glyphicon-star-empty"aria-hidden="true" style="float: right;"></span>
												<button type="button" class="recBtn" onclick="">추천</button>
												<span class="glyphicon glyphicon-star" style="float: right;" aria-hidden="true"></span>
											</div>
											<button type="submit" class="reportBtn" style="float: right;">신고하기</button><br /><br />
										</div>

									</div>
									<div class="rvKeyCount">
										[${rvKey.rv_key_count }]
									</div>
								</c:forEach>
							</div>
							<!-- class="revKeyList"  -->

							<div id="revList">
								<div class="reviewInsertBtnDiv">
									<button type="submit" class="btn" id="insertReview">리뷰 작성하기</button>
								</div>
								<c:forEach var="rv" items="${reviews }">
									<div class="reviews">
										<div class="rvTop">
											<div class="userNickname">"${rv.user_nickname }"</div>
											<div>
												<button type="button" id="repBtn" class="rvBtn" onclick="popupOpen()">신고하기</button>
											</div>
										</div>


										<div class="rvMiddle">
											<div class="starScore">
											<c:choose>
												<c:when test="${rv.star_score eq 5}">
													⭐⭐⭐⭐⭐⭐
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
												<c:when test="${rv.star_score eq 0}">
													-
												</c:when>
											</c:choose>

												</div>


											</div>
											<div class="rvContent">${rv.rv_content }</div>
											<div class="regDate">${rv.reg_date }</div>
										</div>

										<div class="rvBottom">
											<div>
												<button type="button" id="nonrec" class="recBtn rvBtn" value="비추천">비추천 👎 (${rv.nonrec })</button>
												<button type="button" id="rec" class="recBtn rvBtn" value="추천">추천 👍 (${rv.rec } )</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- id="revList" -->
							
							<div id="popup" style="position: absolute; visibility: hidden;">
								<h4>
									<a href="#" class="close" onClick="javascript:popupOpen()">X</a>
								</h4>
								<h3>리뷰신고</h3>
								<div class="popCont">
									<div class="list">
										<label for="commercial"> <input type="checkbox"
											id="commercial">원치 않는 상업적인 리뷰
										</label><br>
										<br> <label for="intended"> <input
											type="checkbox" id="intended">악의적인 리뷰
										</label><br>
										<br> <label for="wrong"> <input type="checkbox"
											id="wrong">잘못된 정보
										</label><br>
										<br> <label for="violent"> <input type="checkbox"
											id="violent">욕설, 성적, 폭력적인 리뷰
										</label><br>
										<br>
									</div>
								</div>
								<div class="dec">
									<button id="decBtn" onclick = "popupOpen()">신고하기</button>
								</div>
							</div>
							
						</div>
					</div>
					<!-- class="col-md-8  container4" -->
				</div>
				<!-- id="container1" class="col-md-8" -->
			</div>

			<!-- id="container1" class="col-md-8" -->
		</div>
		<!-- main -->
		
		
		<!-- 비교함 영역 -->
		<div id="compareDiv">
			<div class="rectDiv">
				<!-- 비교함 이름 영역 -->
				<div class="comNameDiv">
					<span style="font-color: #ef6351">비교함</span>
				</div>
				<!-- 비교함 담은 가게 리스트 영역 -->
				<div class="comStoreListDiv">
					<c:choose>
							<c:when
								test="${fn:length(comList) == 0 or fn:length(comList) == null}">
								<c:forEach var="i" begin="0" end="9">

			<!-- main -->


			<!-- 비교함 영역 -->
			<div id="compareDiv">
				<div class="rectDiv">
					<!-- 비교함 이름 영역 -->
					<div class="comNameDiv">
						<span style="font-color: #ef6351">비교함</span>
					</div>

					<!-- 비교함 담은 가게 리스트 영역 -->
					<div class="comStoreListDiv">
						<c:choose>
							<c:when
								test="${fn:length(comList) == null or fn:length(comList) == 0 }">
								<c:forEach begin="0" end="9">

									<div class="comStoreDiv">
										<!-- 한 가게 대표사진 영역 -->
										<div class="comStoreImgDiv">
											<img class="comStNoImg" src="<%=cp%>/images/comp_img01.png">
										</div>
										<!-- 한 가게 가게이름 영역 -->
										<div class="comStoreNameDiv"></div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<!-- 한 가게 영역 -->

								<c:forEach var="com" items="${comList}" varStatus="status">
									<div class="comStoreDiv">
										<!-- 한 가게 대표사진 영역 -->
										<div class="comStoreImgDiv">
											<button type="button" value="${com.st_num}" class="comDelete">X</button>
											<label for="${com.st_num}" class="stLabel"> <input
												type="checkbox" class="comStImgCB" name="comStImgCB" id="${com.st_num}">
												<c:set var = "photo" value="${com.photo_link }"/>
												
												<c:choose>

								<c:forEach var="com" items="${comList }" varStatus="status">
									<div class="comStoreDiv">
										<!-- 한 가게 대표사진 영역 -->
										<div class="comStoreImgDiv">
											<button type="button" value="${com.st_num }"
												class="comDelete">X</button>
											<label for="${com.st_num}" class="stLabel"> <input
												type="checkbox" class="comStImgCB" id="${com.st_num}">
												<c:set var="photo" value="${com.photo_link }" /> <c:choose>

													<c:when test="${empty photo}">
														<img class="stImg" src="<%=cp%>/images/logo_text.png">
													</c:when>
													<c:otherwise>
														<img class="stImg" src="<%=cp%>/${photo}">
													</c:otherwise>
												</c:choose>
											</label>
										</div>
										<!-- 한 가게 가게이름 영역 -->

										<div class="comStoreNameDiv">${com.st_name}</div>
									</div>
								</c:forEach>
								<c:forEach begin="0" end="${10 - fn:length(comList)}">

										<div class="comStoreNameDiv">${com.st_name }</div>
									</div>
								</c:forEach>
								<c:forEach begin="0" end="${10 - fn:length(comList) }">

									<div class="comStoreDiv">
										<!-- 한 가게 대표사진 영역 -->
										<div class="comStoreImgDiv">
											<img class="comStNoImg" src="<%=cp%>/images/comp_img01.png">
										</div>
										<!-- 한 가게 가게이름 영역 -->
										<div class="comStoreNameDiv"></div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>

					<input type="hidden" id="checkedCompare" name="checkedCompare">

				</div>
				<input type="hidden" name="regionChk" id="regionChk"> <input
					type="hidden" name="foodlabelChk" id="foodlabelChk"> <input
					type="hidden" name="stKeyChk" id="stKeyChk">

				<div class="comStoreBtnDiv">
					<button type="button" class="btn" id="comBtn" name="comBtn">비교하기</button>

				</div>

		</div>

		<div class="footer">
			<c:import url="footer.jsp"></c:import>
		</div>

	</form>
</body>
</html>