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
<title>Main Admin Page</title>

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
	});
</script>


<body>
<form id="myForm" method="post">
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
			<h1>접수내역 관리</h1>
			
			<!-- 리뷰신고 box -->
			<div id="reviewBox" style="height: auto;">

				<div class="more" id="more">
					<h3><a href="#">리뷰신고</a></h3>
					<a href="reviewListView.action" class="moreBtn">더보기+</a>
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
						<c:forEach var="review" items="${rvList }" begin="0" end="4">
						<tr>
							<td><a href="reviewReportForm.jsp">${review.reg_date }</a></td>
							<td><a href="reviewReportForm.jsp">${review.user_id }</a></td>
							<td><a href="reviewReportForm.jsp">${review.st_name }</a></td>
							<td><a href="reviewReportForm.jsp">${review.accu_num }</a></td>
							<td><a href="reviewReportForm.jsp">${review.state }</a></td>
							<td><a href="reviewReportForm.jsp">${review.final_date }</a></td>
							<td><a href="reviewReportForm.jsp">${review.admin_id }</a></td>
						</tr>                               
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<br>
			<!-- 가게정보수정요청 box -->
			<div id="storeErrBox" style="height: auto;">
				<div class="more" id="more">
					<h3><a href="#">가게정보수정요청</a></h3>
					<a href="storeErrView.action" class="moreBtn">더보기+</a>
				</div>
			
				<table id="storeErr_list" style="margin-bottom: 20px;">
					<thead>
						<tr>	
							<th>요청일자</th>
							<th>요청자 ID</th>
							<th>가게 이름</th>
							<th>처리상태</th>
							<th>처리일자</th>
							<th>처리한 관리자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="req" items="${reqList }" begin="0" end="4">
						<tr>
							<td>${req.reg_date }</td>
							<td>${req.user_id }</td>
							<td>${req.st_name }</td>
							<td>${req.state }</td>
							<td>${req.final_date }</td>
							<td>${req.admin_id }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<br>
			<!-- 이의제기 box -->
			<div id="objectionBox" style="height: auto;">
				<div class="more" id="more">
					<h3><a href="#">이의제기</a></h3>
					<a href="objectionView.action" class="moreBtn">더보기+</a>
				</div>
			
				<table id="objection_list" style="margin-bottom: 20px;">
					<thead>
						<tr>	
							<th>신청일자</th>
							<th>가게 이름</th>
							<th>처리상태</th>
							<th>처리일자</th>
							<th>처리한 관리자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="obj" items="${objList }" begin="0" end="4">
						<tr>
							<td>${obj.reg_date }</td>
							<td>${obj.st_name }</td>
							<td>${obj.state }</td>
							<td>${obj.final_date }</td>
							<td>${obj.admin_id }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
			<br>
			<!-- 패널티회수 box -->
			<div id="penaltyBox" style="height: auto;">
				<div class="more" id="more">
					<h3><a href="#">패널티회수</a></h3>
					<a href="penaltyView.action" class="moreBtn">더보기+</a>
				</div>
			
				<table id="penalty_list" style="margin-bottom: 20px;">
					<thead>
						<tr>	
							<th>신청일자</th>
							<th>가게 이름</th>
							<th>처리상태</th>
							<th>처리일자</th>
							<th>처리한 관리자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2023.04.30</td>
							<td>맛시따</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<c:forEach var="revo" items="${revoList }" begin="0" end="4">
						<tr>
							<td>${revo.reg_date }</td>
							<td>${revo.st_name }</td>
							<td>${revo.state }</td>
							<td>${revo.final_date }</td>
							<td>${revo.admin_id }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<br>
			<!-- 가게 등록/폐업 요청 box -->
			<div id="inout_Box" style="height: auto;">
				<div class="more" id="more">
					<h3><a href="#">가게 등록/폐업 요청</a></h3>
					<a href="inoutView.action" class="moreBtn">더보기+</a>
				</div>
			
				<table id="inout_list" style="margin-bottom: 20px;">
					<thead>
						<tr>
							<th>구분</th>	
							<th>신청일자</th>
							<th>신청 ID</th>
							<th>처리상태</th>
							<th>처리일자</th>
							<th>처리한 관리자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="inout" items="${inoutList }" begin="0" end="4">
						<tr>
							<c:if test="${inout.cat eq '등록' }">
							<td style="background-color: green;">${inout.cat }</td>
							</c:if>
							<c:if test="${inout.cat eq '폐업' }">
							<td style="background-color: pink;">${inout.cat }</td>
							</c:if>
							<td>${inout.reg_date }</td>
							<td>${inout.user_id }</td>
							<td>${inout.state }</td>
							<td>${inout.final_date }</td>
							<td>${inout.admin_id }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
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