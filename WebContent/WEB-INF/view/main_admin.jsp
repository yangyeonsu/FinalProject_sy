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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/side_bar.css">

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<style type="text/css">
	.continer{
		position: static;
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
		
		
		
		$(".reviewTd").click(function()
		{
			var reportNum = $(this).attr("id");
			//alert(reportNum);
			$(location).attr("href","reviewreportform.action?rep_apply_num="+reportNum);
			
		});
		
		$(".errTd").click(function()
		{
			var reportNum = $(this).siblings("[id]").attr("id");
			//alert(reportNum);
			$(location).attr("href","errreportform.action?req_apply_num="+reportNum);
			
		});

		$(".objTd").click(function()
		{
			var reportNum = $(this).siblings("[id]").attr("id");
			//alert(reportNum);
			$(location).attr("href","objreportform.action?obj_apply_num="+reportNum);
			
		});

		$(".revoTd").click(function()
		{
			var reportNum = $(this).siblings("[id]").attr("id");
			//alert(reportNum);
			$(location).attr("href","penaltyrevokeform.action?revo_apply_num="+reportNum);
			
		});
		
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
								<td class="reviewTd" id="${review.report_num }">${review.reg_date }</td>
								<td class="reviewTd" id="${review.report_num }">${review.user_id }</td>
								<td class="reviewTd" id="${review.report_num }">${review.st_name }</td>
								<td class="reviewTd" id="${review.report_num }">${review.accu_num }</td>
								<td class="reviewTd" id="${review.report_num }">${review.state }</td>
								<td class="reviewTd" id="${review.report_num }">${review.final_date }</td>
								<td class="reviewTd" id="${review.report_num }">${review.admin_id }</td>
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
							<c:forEach var="err" items="${reqList }" begin="0" end="4">
							<tr>
								<td class="errTd" id="${err.report_num }">${err.reg_date }</td>
								<td class="errTd" id="${err.report_num }">${err.user_id }</td>
								<td class="errTd" id="${err.report_num }">${err.st_name }</td>
								<td class="errTd" id="${err.report_num }">${err.state }</td>
								<td class="errTd" id="${err.report_num }">${err.final_date }</td>
								<td class="errTd" id="${err.report_num }">${err.admin_id }</td>
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
								<td class="objTd" id="${obj.report_num }">${obj.reg_date }</td>
								<td class="objTd" id="${obj.report_num }">${obj.st_name }</td>
								<td class="objTd" id="${obj.report_num }">${obj.state }</td>
								<td class="objTd" id="${obj.report_num }">${obj.final_date }</td>
								<td class="objTd" id="${obj.report_num }">${obj.admin_id }</td>
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
								<td class="revoTd" id="${revo.report_num }">${revo.reg_date }</td>
								<td class="revoTd" id="${revo.report_num }">${revo.st_name }</td>
								<td class="revoTd" id="${revo.report_num }">${revo.state }</td>
								<td class="revoTd" id="${revo.report_num }">${revo.final_date }</td>
								<td class="revoTd" id="${revo.report_num }">${revo.admin_id }</td>
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