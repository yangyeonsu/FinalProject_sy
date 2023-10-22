
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main Page</title>

<!-- jquery -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->

<style type="text/css">
body {
	margin: 0px;
	font-family: 'IBM Plex Sans KR', sans-serif;
}

#store_header {
	position: relative;
	display: flex;
	width: 88vw;
	align-items: flex-start;
	padding-top: 1vh;
	margin-left: 6vw;
	height: 10vh;
	max-height: 10vh;
}

#headerAlarm {
	width: 70vw;
	padding-left: 10vw;
}

#headerLogo {
	display: flex;
	justify-content: flex-end;
	max-width: 8vw;
}

.headerBtn {
	display: flex;
	width: 10vw;
	margin-top: 3vh;
	padding-left: 55vw;
	justify-content: space-between;
	position: static;
}

.menuBtn {
	display: flex;
	flex-direction: row-reverse;
}

a {
	text-decoration-line: none;
}

#mypage a {
	font-size: 0.9vw;
	font-weight: bold;
	color: black;
}

.sub_list {
	position: relative;
    display: flex;
    flex-direction: row-reverse;
    padding-left: 55vw;
    width: 15vw;
    justify-content: space-between;
}

.mypage_menu {
	position: relative;
	transition-duration: 0.5s;
	font-size: 0.8vw;
	background-color: #fff;
	margin-right: 9vw;
	border-radius: 4px;
	border: 2px solid #f5f3e7;
	padding: 0.5vw;
	width: 6.5vw;
}

.person_listA li, .person_listB li {
	padding-bottom: 0.5vh;
}

.alarm_menu {
	transition-duration: 0.5s;
	font-size: 0.8vw;
	background-color: #fff;
	border: 2px solid #f5f3e7;
	width: 10vw;
	border-radius: 4px;
	padding: 0.5vw;
}

.person_listA, .person_listB {
	list-style-type: none;
	padding: 0;
	margin: 0;
	border-bottom: 1px;
	width: 100%;
}

.alarm_cl {
	font-size: 0.9vw;
	font-weight: bold;
	color: black;
}

.alarm, .userMenu {
	text-decoration: none;
	color: #3a001e;
}

.alarm:active, .userMenu:active {
	text-decoration: none;
	color: #ef6351;
}

.alarm:hover, .userMenu:hover {
	text-decoration: none;
	color: #ef6351;
	cursor: pointer;
}

.alarm
{
	background-color: #fff;
    border-radius: 4px;
    border: 1px solid #f5f3e7;
    font-size: 0.8vw;
    text-align: left;
}

.person_listB
{
	height: expression( this.scrollHeight > 49vh ? "50vh" : "auto" );
    overflow-y: auto;
    max-height: 50vh;
}

.subListBtn {
	border: 0;
}

.NonCheck {
}

.checked {
}
</style>

<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		// 헤더 메뉴 안보이게 초기화
		$(".mypage_menu").hide();
		$(".alarm_menu").hide();

		// 사용자 메뉴 클릭 시 표출
		$(".mypage_cl").click(function()
		{
			$(".mypage_menu").fadeToggle(300);

			if ($('.alarm_menu').is(':visible'))
			{
				$(".alarm_menu").hide();
			}
		});

		// 알림 메뉴 클릭 시 표출
		$(".alarm_cl").click(function()
		{
			$(".alarm_menu").fadeToggle(300);

			if ($('.mypage_menu').is(':visible'))
			{
				$(".mypage_menu").hide();
			}
		});

		// 사용자 메뉴 -> 마이 페이지
		$("#myPage").click(function()
		{
			$("#userForm").attr("action", "usermypage.action");
			$("#userForm").submit();
		});

		// 사용자 메뉴 -> 사업자 메인 페이지
		$("#storeMyPage").click(function()
		{
			$("#userForm").attr("action", "storemain.action");
			$("#userForm").submit();
		});

		// 사용자 메뉴 -> 로그아웃
		$("#logout").click(function()
		{
			$("#userForm").attr("action", "logout.action");
			$("#userForm").submit();
		});
		
		$(".alarm").click(function()
		{
			var num = $(this).attr("id");
			var com = $(this).attr("name");
			
			$("#comment").val(com);
			$("#check_num").val(num);
			
			$("#userForm").attr("action", "alarm.action");
			$("#userForm").submit();
		})
		
	});
</script>

</head>

<body>

	<header id="store_header">
		<div class="headerImg">
			<a href="main.action"><img id="headerLogo"
				src="<%=cp%>/images/logo_text.png"></a>
		</div>
		<div id="headerAlarm">
			<div class="headerBtn">
				<div class="menuBtn">
					<div id="mypage">
						<a href="#" class="mypage_cl" id="mypagetxt">${user.user_nickname }(${user.user_grade })</a>
					</div>
				</div>

				<div id="alarm">
					<a href="#" class="alarm_cl">알림</a>
				</div>
			</div>
			<div class="sub_list">
				<div class="mypage_menu">
					<ul class="person_listA">
						<li><a class="userMenu" href="usermypage.action">마이 페이지</a> <c:if
								test="${not empty sessionScope.st_num }">
								<li><a class="userMenu" href="storemain.action">사업자 메인 페이지</a>
							</c:if>
						<li><a class="userMenu" href="logout.action">로그아웃</a>
					</ul>
				</div>
				<div class="alarm_menu">
					<ul class="person_listB">
						<c:forEach var="al" items="${alarm }">
							<c:choose>
								<c:when
									test="${fn:length(alarm) == 0 or fn:length(alarm) == null}">
									<li>현재 알람이 존재하지 않습니다.
								</c:when>
								<c:when test="${al.commentary eq 'REQ_ST' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }" >
											회원님의 가게에 정보 수정 요청이 들어왔습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님의 가게에 정보 수정 요청이 들어왔습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'OBJ_PRO' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 이의 제기 신청이 처리 완료 되었습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 이의 제기 신청이 처리 완료 되었습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'REQ_REJ' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											가게 신고 요청 결과가 변경되었습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											가게 신고 요청 결과가 변경되었습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'ACCU_APPLY' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 작성하신 리뷰가 신고 되었습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 작성하신 리뷰가 신고 되었습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'ACCU_PRO' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 작성하신 리뷰에 대한 신고가 처리 완료 되었습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 작성하신 리뷰에 대한 신고가 처리 완료 되었습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'REQ' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 가게 정보 오류 요청이 처리 완료 되었습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 가게 정보 오류 요청이 처리 완료 되었습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'REP' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 리뷰신고가 처리 완료 되었습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 리뷰신고가 처리 완료 되었습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'PENALTY' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 패널티 회수 요청이 처리 완료 되었습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 패널티 회수 요청이 처리 완료 되었습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'IN' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 가게 등록 신청이 처리 완료 되었습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 가게 등록 신청이 처리 완료 되었습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'OUT' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 가게 폐업 신청이 처리 완료 되었습니다.</button>
										</c:when>
										<c:otherwise>
											<li><button class="alarm" name="${al.commentary }" id="${al.check_num }">
											회원님이 요청하신 가게 폐업 신청이 처리 완료 되었습니다.</button>
										</c:otherwise>
									</c:choose>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
					<input type="hidden" name="comment" id="comment">
					<input type="hidden" name="check_num" id="check_num">
				</div>
			</div>
		</div>
	</header>
</body>