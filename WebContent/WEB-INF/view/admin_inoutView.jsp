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
<title>admin_inoutView.jsp</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main_admin.css">

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<style type="text/css">
	.continer{
		position: static;
	}
	
</style>

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
		$(".inTd").click(function()
		{
			var inNum = $(this).attr("id");
			/* alert(inNum); */
			var state = $(this).parent().attr('id');
			$(location).attr("href","inapplyform.action?in_apply_num="+inNum+"&state="+state);
		});
	});
	
</script>


<body>
<form id="adminForm" method="post">

	<!-- header -->
	<c:import url="header_admin.jsp"></c:import>
	
	<c:import url="sideBar_user.jsp"></c:import>
		
		
	<div id="mainDiv">
		
		<!-- 접수내역관리 -->
		<div id="receive">
			<h1>패널티회수 접수내역 관리</h1>
			
			<!-- 가게 등록/폐업 요청 box -->
			<div id="inout_Box" style="height: auto;">
				<div class="more" id="more">
					<h3><a href="#">가게 등록/폐업 요청</a></h3>
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
						<c:forEach var="inout" items="${inoutList }">
						<tr id="${inout.state }">
							<c:if test="${inout.cat eq '등록' }">
							<td style="background-color: green;">${inout.cat }</td>
							</c:if>
							<c:if test="${inout.cat eq '폐업' }">
							<td style="background-color: pink;">${inout.cat }</td>
							</c:if>
							<td class="inTd" id="${inout.report_num }">${inout.reg_date }</td>
							<td class="inTd" id="${inout.report_num }">${inout.user_id }</td>
							<td class="inTd" id="${inout.report_num }">${inout.state }</td>
							<td class="inTd" id="${inout.report_num }">${inout.final_date }</td>
							<td class="inTd" id="${inout.report_num }">${inout.admin_id }</td>
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
	
	<!-- footer -->
	<c:import url="footer.jsp"></c:import>
	
</form>
</body>



</body>

</html>




