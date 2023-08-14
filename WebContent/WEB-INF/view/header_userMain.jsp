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
	body
	{
		margin: 0px;
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	
	#store_header
	{
		position: relative;
	    width: 88vw;
	    align-items: flex-start;
	    padding-top: 1vh;
	    height: 30vh;
	    max-height: 10vh;
	}

	#headerAlarm
	{
	    width: 70vw;
	    padding-left: 26vw;
	}
	
	
	#headerLogo
	{
		display: flex;
		justify-content: flex-end;	
		max-width: 8vw;
	}

	.headerBtn
	{
	    display: flex;
	    width: 10vw;
	    margin-top: 3vh;
	    padding-left: 53vw;
	    justify-content: space-between;
	    position: static;
	}
	
	.menuBtn
	{
		display: flex;
		width: 7vw;
		flex-direction: row-reverse;
	}
	
	a
	{
		text-decoration-line: none;
	}
	
	#mypage a
	{
		font-size: 0.9vw;
    	font-weight: bold;
    	color: black;
	}
	
	.sub_list
	{
		position: relative;
	    display: flex;
	    flex-direction: row-reverse;
	    width: 65vw;
	}
	
	.mypage_menu
	{
		position: relative;
	    transition-duration: 0.5s;
	    font-size: 0.8vw;
	    background-color: #f5f3e7;
	    margin-right: 4vw;
	}
	
	.person_listA
	{
		padding-bottom: 0.6vh;
		width: 16vh;
		height: 4em;
		margin-bottom: 2vh;
		margin-top: 1vh;
	}
	
	.person_listB
	{
		padding-bottom: 0.6vh;
		width: 16vh;
		height: 9em;
		margin-bottom: 2vh;
		margin-top: 1vh;
	}
	
	.person_listA li, .person_listB li
	{
		padding-left: 0.5vw;
		padding-top: 0.5vh;
		margin-bottom: 0.5;
	}
	
	.alarm_menu
	{
		transition-duration: 0.5s;
	    font-size: 0.8vw;
	    background-color: #f5f3e7;
	}
	
	.person_listA, .person_listB
	{
		list-style-type: none;
		padding: 0;
	}
	
	.alarm_cl
	{
		font-size: 0.9vw;
    	font-weight: bold;
    	color: black;
	}
	
	.subListBtn
	{
		border: 0;
	}
</style>

<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script type="text/javascript">

$(function()
{
    $(".mypage_menu").hide();
    $(".alarm_menu").hide();
    
    $(".mypage_cl").click(function() {
        $(".mypage_menu").fadeToggle(300);
        
        if ($('.alarm_menu').is(':visible'))
        {
        	$(".alarm_menu").hide();
        }
    });
    
    $(".alarm_cl").click(function() {
        $(".alarm_menu").fadeToggle(300);
        
        if ($('.mypage_menu').is(':visible'))
        {
        	$(".mypage_menu").hide();
        }
    });
    
    
    $("#myPage").click(function()
	{
		$("#userForm").attr("action","usermypage.action");
		$("#userForm").submit();
	});
	   
	   $("#storeMyPage").click(function()
	{
		$("#userForm").attr("action","storemain.action");
		$("#userForm").submit();
	});
    
   
});

</script>

</head>

<body>

	<header id="store_header">
		<%-- <div class="headerImg">
			<img id="headerLogo" src="<%=cp %>/images/logo_text.png">
		</div> --%>
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
						<li><a href="usermypage.action">마이 페이지</a>
						<c:if test="${session.st_num ne '' or !empty session.st_num}">
							<li><a href="storemain.action">사업자 메인 페이지</a>
						</c:if>
						<li><a href="logout.action">로그아웃</a>
					</ul>
				</div>
				<div class="alarm_menu">
					<ul class="person_listB">
						<c:forEach var="al" items="${alarm }">
							<c:choose>
								<c:when test="${fn:length(alarm) == 0 or fn:length(alarm) == null}">
									<li>현재 알람이 존재하지 않습니다.
								</c:when>
								<c:when test="${al.commentary eq 'REQ_REJECT' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><a href="#" class="alarm NonCheck">가게 신고 요청 결과가 변경되었습니다.</a>
										</c:when>
										<c:otherwise>
											<li><a href="#" class="alarm checked">가게 신고 요청 결과가 변경되었습니다.</a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'ACCU_APPLY' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><a href="#" class="alarm NonCheck">회원님이 작성하신 리뷰가 신고 되었습니다.</a>
										</c:when>
										<c:otherwise>
											<li><a href="#" class="alarm checked">회원님이 작성하신 리뷰가 신고 되었습니다.</a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'ACCU_PROCESS' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><a href="#" class="alarm NonCheck">회원님이 작성하신 리뷰에 대한 신고가 처리 완료 되었습니다.</a>
										</c:when>
										<c:otherwise>
											<li><a href="#" class="alarm checked">회원님이 작성하신 리뷰에 대한 신고가 처리 완료 되었습니다.</a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'REQ' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><a href="#" class="alarm NonCheck">회원님이 요청하신 가게 정보 오류 요청이 처리 완료 되었습니다.</a>
										</c:when>
										<c:otherwise>
											<li><a href="#" class="alarm checked">회원님이 요청하신 가게 정보 오류 요청이 처리 완료 되었습니다.</a>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${al.commentary eq 'REP' }">
									<c:choose>
										<c:when test="${al.check_date eq '-' }">
											<li><a href="#" class="alarm NonCheck">회원님이 요청하신 리뷰신고가 처리 완료 되었습니다.</a>
										</c:when>
										<c:otherwise>
											<li><a href="#" class="alarm checked">회원님이 요청하신 리뷰신고가 처리 완료 되었습니다.</a>
										</c:otherwise>
									</c:choose>
								</c:when>
							
							</c:choose>						
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>