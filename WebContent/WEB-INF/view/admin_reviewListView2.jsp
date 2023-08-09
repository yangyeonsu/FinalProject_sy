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
<title>admin_reviewListView.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main_admin.css">

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

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
		
		
		/*
		$(".reviewTr").click(function()
		{
			$(location).attr("href","reviewCheckform.action?rep_apply_num="+$(this).attr("id"))
			$(location).attr("action", "reviewCheckForm.action?rep_apply_num="+$(this).attr("id"));
		});
		*/
		
		
		
		
	});
	
	
</script>


<body>
<form id="adminForm" method="post">

	<!-- header -->
	<c:import url="header_admin.jsp"></c:import>
	
	<!-- container -->
	<div id="container">
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
		</div>
	
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
				</div>
			</div>
			<div class="overlay">
				<input type="hidden" id="checkOverlay" value="false">
			</div>
		</div>
		
		
		<div id="mainDiv">
			
			<!-- 접수내역관리 -->
			<div id="receive">
				<h1>리뷰신고 접수내역 관리</h1>
				
				<!-- 리뷰신고 box -->
				<div id="reviewBox" style="height: auto;">
	
					<div class="more" id="more">
						<h3><a href="#">리뷰신고</a></h3>
					</div>
					
					<table id="review_list" style="margin-bottom: 20px;">
						<thead>
							<tr>	
								<th>신고일자</th>
								<th>신고자 ID</th>
								<th>가게 이름</th>
								<th>피신고자 ID</th>
								<th>처리상태</th>
								<th>처리일자</th>
								<th>처리한 관리자</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach var="review" items="${rvList }">
							<tr class="reviewTr" id="${review.rep_aply_num} ">
								<td>${review.reg_date }</td>
								<td>${review.user_id }</td>
								<td>${review.st_name }</td>
								<td>${review.accu_num }</td>
								<td>${review.state }</td>
								<td>${review.final_date }</td>
								<td>${review.admin_id }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<div class="back" id="more">
					<h3></h3>
					<a href="mainAdminView.action" class="backBtn" style="font-size: 10pt;">뒤로가기</a>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<c:import url="footer.jsp"></c:import>
	
</form>
</body>



</body>

</html>