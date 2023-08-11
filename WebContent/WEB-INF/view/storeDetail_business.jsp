<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YameokJa</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/compareBox.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/side_bar.css">

<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/storeDetail.css">
	
<style type="text/css">
	#storeInfoModify
	{
	   width: 100px;
	    height: 30px;
	    margin-left: 1vw;
	    border-radius: 5px;
	    border: none;
	    background-color: #ef6351;
	    color: #fff;
	    font-weight: bold;
	}
	
	.storeName
	{
		display: flex;
	    align-items: center;
	    justify-content: center;
	    width: 25vw;
	    padding-left: 4vw;
	}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

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
	<form action="" id="userForm" method="post">
		<div class="header">
			<c:import url="header_user.jsp"></c:import>
		</div>

		<div id="body">

			<div id="column">

				<c:import url="sideBar_user.jsp"></c:import>
			</div>

			<div class="mainBody">

				<div id="container1" class="">
					<c:forEach var="s" items="${store }">
						<div class="placeholders main">

							<div class="placeholder main-left">

								<div class="background" style="font-weight: bold;">
									<div class="storeName">
										<span style="font-size: 28pt; font-weight: bold;">${s.st_name }</span>
										<button type="button" id="storeInfoModify">가게정보 수정</button>
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
										<input type="hidden" name="st_num" value="${s.st_num }">
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
											</div>
											<div id="opencloseholidayList">
												<c:if test="${empty openClose }">
													<div class="ochList">
														<div class="dayname">월요일</div>
														<div class="time">-</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">화요일</div>
														<div class="time">-</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">수요일</div>
														<div class="time">-</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">목요일</div>
														<div class="time">-</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">금요일</div>
														<div class="time">-</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">토요일</div>
														<div class="time">-</div>
														<div class="holiday">-</div>
													</div>
													<div class="ochList">
														<div class="dayname">일요일</div>
														<div class="time">-</div>
														<div class="holiday">-</div>
													</div>
												</c:if>
												<c:forEach var="op" items="${openClose}">
													<div class="ochList">
														<div class="dayname">${op.day_name }</div>
														<c:choose>
															<c:when test="${op.holiday eq '휴무' }">
																<div class="time">휴무</div>
															</c:when>
															<c:otherwise>
																<div class="time">${op.operate_time }</div>
															</c:otherwise>
														</c:choose>

													</div>
												</c:forEach>
											</div>
										</div>
										<div id="breakTime">
											<div class="breakName">브레이크타임</div>

											<c:if test="${empty breakTime }">
												-
											</c:if>
											<c:forEach var="breakTime" items="${breakTime }">
												<div class="breakList">
													<div>[${breakTime.week_weekend }] &nbsp;&nbsp;</div>
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

						<div class="storeMiddle">
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
									<div id="pay" class="siList2">
										<c:forEach var="stPay" items="${stPayList}">
										&nbsp;${stPay } 
									</c:forEach>
									</div>
									<div id="explain" class="siList2">${s.st_explain }</div>
								</div>
							</div>

							<div class="storeChecks">
								<c:if test="${empty stCheckList }">
									<div class="none">해당 항목이 존재하지 않습니다.</div>
								</c:if>
								<div class="storeCheck">
									<div class="stCheckListName">
										<가게 옵션>
									</div>
									<div class="stCheckListYesorno">
										<여부>
									</div>
								</div>
								<c:forEach var="stCheck" items="${stCheckList }">
									<div class="storeCheck">
										<div class="stCheckName">${stCheck.chbox_name }</div>
										<div class="stCheckYesorno">${stCheck.yesorno }</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</c:forEach>


					<div id="menuboard" class="container2">

						<!-- 메뉴 -->
						<h2>메뉴</h2>
						<div class="menuList">
							<c:if test="${empty menuLists }">
								<div class="none">"등록된 메뉴가 존재하지 않습니다."</div>
							</c:if>
							<c:forEach var="ml" items="${menuLists }">
								<div class="menu">
									<div class="menuPhoto">
										<img class="thumbnail" src="<%=cp %>/images/${ml.image_link }" />
									</div>
									<div class="menuName">"${ml.menu_name }"</div>
									<div class="menuPrice">
										<fmt:formatNumber value="${ml.price }" pattern="#,###" />
										원
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class=" container3">
						<div id="reviewList">
							<h2>리뷰</h2>


							<div class="rvKeyList">
								<c:if test="${empty reviewKeys }">
									<div class="none">"등록된 리뷰 키워드가 존재하지 않습니다."</div>
								</c:if>
								<c:forEach var="rvKey" items="${reviewKeys }">
									<div class="rvKey">"${rvKey.rv_key_name }"</div>
									<div class="rvKeyCount">(${rvKey.rv_key_count })</div>
								</c:forEach>
							</div>
							<!-- class="revKeyList"  -->

							<div id="popup" style="position: absolute; visibility: hidden;">
								<h4>
									<a href="#" class="close" onClick="javascript:popupOpen()">X</a>
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
											type="checkbox" id="violent" name="reviewRep"
											class="reviewRep" value="4" onclick="CountChecked(this)">욕설,
											성적, 폭력적인 리뷰
										</label><br> <br>
									</div>
								</div>
								<div class="dec">
									<button id="decBtn" onclick="popupOpen()">신고하기</button>
								</div>
							</div>
						</div>

					</div>
					<!-- class="col-md-8  container4" -->
				</div>
				<!-- id="container1" class="col-md-8" -->
			</div>

			<!-- id="container1" class="col-md-8" -->

			<!-- main -->


			<c:import url="compare_box.jsp"></c:import>

		</div>
	</form>
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>

</body>
</html>