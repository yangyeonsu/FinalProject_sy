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
<title>나의 신고 내역</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

penaltyList-beta

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_main.css">

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">

<style type="text/css">
	.continer{
		position: static;
	}
	.side-menu {
		/* top: 50px;
		width: 5vw;
		z-index: 10;
		background: #ef6351;
		border-right: 1px solid rgba(0, 0, 0, 0.07);
		height: 90%;
		margin-top: 8.2vh;
		position: fixed;
		align-items: center; */
		top: 50px;
	    width: 5vw;
	    z-index: 10;
	    background: #ef6351;
	    border-right: 1px solid rgba(0, 0, 0, 0.07);
	    height: 90%;
	    margin-top: 3.9vh;
	    position: fixed;
	}
	
	.has_sub_menu {
		list-style-type: none;
	}
	
	#sidebar-menu li {
		font-size: 1.5rem;
	}
	
	#sidebar-menu .fas {
		padding-top: 3vh;
		padding-left: 1.2vw
	}
	
	.left_sub_menu {
		/* position: fixed;
		top: 50px;
		width: 18vw;
		z-index: 10;
		left: 5.07vw;
		background: white;
		height: 90%;
		margin-top: 5.7vh; */
		position: fixed;
	    top: 50px;
	    width: 18vw;
	    z-index: 10;
	    left: 5.07vw;
	    background: white;
	    height: 90%;
	    margin-top: 3.9vh;
	}
	
	.sub_menu {
		margin-top: 2.2vh;
	}
	
	.left_sub_menu>.sub_menu li:hover {
		color: ff5858;
		background-color: #e1e1e1;
	}
	
	.left_sub_menu>.sub_menu li {
		color: black;
		font-size: 17px;
		font-weight: 600;
		padding: 20px 0px 8px 14px;
		border-bottom: 1px solid #e1e1e1;
	}
	
	.sub_menu>h2 {
		padding-bottom: 4px;
		border-bottom: 3px solid #797979;
		margin-top: 30px;
		font-size: 21px;
		font-weight: 600;
		color: #333;
		margin-left: 10px;
		margin-right: 10px;
		font-family: 'NotoKrB';
	}
	
	.fas {
		color: #ff5858;
		font-size: 20px;
		line-height: 20px;
		float: right;
		margin-top: 0.6vh;
		margin-right: 2vw;
	}
	
	.sub_menu>.big_menu>.small_menu li {
		color: black;
		font-size: 14px;
		font-weight: 600;
		border-bottom: 0px solid #e1e1e1;
	}
	
	.big_menu {
		list-style-type: none;
		cursor: pointer;
		/* 수정 */
		padding-left: 1vw;
	}
	
	.samll_menu {
		position: fixed;
		list-style-type: none;
		padding-inline-start: 0px;
		list-style: none;
		transition-duration: 0.5s;
	}
	
	.small_menuA {
		color: black;
		text-decoration-line: none;
		background-color: transparent;
		margin-bottom: 1vh
	}
	
	.big_menu ul {
		margin-top: 0;
		margin-bottom: 0;
	}
	
	.has_sub {
		width: 100%;
	}
	
	/* 메인페이지 */
	.middle
	{
		display: flex;
		width: 97vw;
		padding: 0px;
		align-items: stretch;
	}
	.penaltylist
	{
		display: flex;
		flex-direction: column;
		padding: 1vw;
		border: 0.3vw solid #F7F4EA;
		border-radius: 40px;
	}
	/* 부제 틀 */
	.subtitle
	{
		display: flex;
		background-color: #F7F4EA;
		border-radius: 10px 10px 0 0;
	}
	/* 부제 */
	.pen_subtitle
	{
		text-align: center;

		width: 14vw;
		padding: 1vh;
	}
	
	/* 신고 내용 틀 */
	.report_content
	{
		display: flex;

	}
	/* 신고 내용 */
	.rpt_content
	{
		text-align: center;
		width: 8vw;
		padding: 1vh;;
	}
	
	/* 리뷰신고리스트 전체 틀 */
	.penalty_report
	{
		padding: 5vw;
		justify-content: center;
		margin-left: 10vw;
		padding-top: 0;
	}
	/* 제목 */
	.title
	{
		width: 100%;
		text-align: center;
		font-size: 2em;
	}
	.st_name
	{
		text-align: center;
		width: 12vw;
		padding: 1vh;;
	}
	.no-data-message
	{
		text-align: center;
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
/* 				$('.overlay').css("margin-top", "1.011vh"); */
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

</head>
<body>

	<div class="header">
		<c:import url="/WEB-INF/view/header_user.jsp"></c:import>
	</div>

	
	
	
	<div class="middle">
		<!-- 왼쪽 사이드 바 -->
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
		</div><!-- .left side-menu end -->
		
		<!-- 메뉴 -->
		<div class="col-md-2" id="mleft">
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
						<li>새로운 가게 등록 신청</li>
					</ul>
				</div><!-- .sub_menu end -->
			</div><!-- .left_sub_menu end -->
			<div class="overlay">
				<input type="hidden" id="checkOverlay" value="false">
			</div><!-- .overlay end -->
		</div> <!-- .col-md-2 end -->
		
		
		
		
		<div class="right_content">
			<div class="penalty_report">
				<div class="title">
					경고 내역
				</div>
				<hr>
				<div class="penaltylist">
					<div class="subtitle">
						<div class="pen_subtitle">신고일자</div>
						<div class="st_name">가게명</div>
						<div class="pen_subtitle">처리일자</div>
					</div>
					<c:choose>
					    <c:when test="${empty penList}">
					        <div class="no-data-message">경고 내역이 없습니다.</div>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="pl" items="${penList}">
					            <div class="report_content">
					                <div class="rpt_content">${pl.reg_date }</div>
					                <div class="st_name">${pl.st_name }</div>
					                <div class="rpt_content">${pl.final_date }</div>
					            </div>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
					
					<!-- 페이징 처리 -->
					<div class="pagination">
			            <c:choose>
			                <c:when test="${empty penList}">
			                    <p></p>
			                </c:when>
			                <c:otherwise>
			                    <ul class="pagination-list">
			                        <li><a href="${cp}/user_stupdate_relist.action?page=${currentPage - 1}">&laquo; Previous</a></li>
			                        <c:forEach var="pageNum" begin="1" end="${totalPages}">
			                            <li><a href="${cp}/user_stupdate_relist.action?page=${pageNum}">${pageNum}</a></li>
			                        </c:forEach>
			                        <li><a href="${cp}/user_stupdate_relist.action?page=${currentPage + 1}">Next &raquo;</a></li>
			                    </ul>
			                </c:otherwise>
			            </c:choose>
			        </div>
					
					
				</div>
			</div>
		</div><!-- right_content -->
		
	</div><!-- .middle end -->
	


	<div class="footer">
		<c:import url="/WEB-INF/view/footer.jsp"></c:import>
	</div>

</body>
</html>