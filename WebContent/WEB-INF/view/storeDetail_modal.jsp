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
	href="<%=cp%>/css/storeDetail_modal.css">
	
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
	
	body
	{
		 max-height: calc(100vh - 200px);
	    overflow-y: auto;
	}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

</head>


<body>
<div id="body">
	<div class="mainBody">

		<div id="container1" class="">
			<c:forEach var="s" items="${store }">
			<div class="placeholders main">

				<div class="placeholder main-left">

					<div class="background" style="font-weight: bold;">
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

	</div>
	<!-- id="container1" class="col-md-8" -->
</div>

<!-- id="container1" class="col-md-8" -->

<!-- main -->

</div>
</body>
</html>