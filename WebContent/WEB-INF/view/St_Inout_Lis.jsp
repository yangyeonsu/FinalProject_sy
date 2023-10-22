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
<title>가게 등폐업 요청 내역</title>

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


<body>
<form id="adminForm" method="post">
	<!-- header -->
	<div class="header">
		<c:import url="header_user.jsp"></c:import>
	</div>
		
		
		
	<div id="middle">
		<c:import url="sideBar_user.jsp"></c:import>
		
		<div class="right_content">
			<div class="rv_report">
				<div class="title">가게 등폐업 요청 내역</div>
				<hr>
				<div class="rv_reportlist">
					<div class="subtitle">
						<div class="rpt_subtitle">구분</div>
						<div class="rpt_subtitle">신청일자</div>
						<div class="rpt_subtitle">가게명</div>
						<div class="rpt_subtitle">처리상태</div>
						<div class="rpt_subtitle">처리일자</div>
					</div>
		
		
		<div id="receive">
			<h1>가게 등폐업 요청 내역</h1>
			
			
			<div id="inout_Box" style="height: auto;">
				<div class="more" id="more">
					<h3><a href="#">가게 등록/폐업 요청</a></h3>
				</div>
			
				<table id="inout_list" style="margin-bottom: 20px;">
					<thead>
						<tr>
							<th>구분</th>	
							<th>신청일자</th>
							<th>가게명</th>
							<th>처리상태</th>
							<th>처리일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="inout" items="${stinoutlist }">
						<tr id="${inout.state }">
							<c:if test="${inout.cat eq '등록' }">
							<td style="background-color: green;" id="${inout.cat }">${inout.cat }</td>
							</c:if>
							<c:if test="${inout.cat eq '폐업' }">
							<td style="background-color: pink;">${inout.cat }</td>
							</c:if>
							<td class="inTd" id="${inout.apply_num }">${inout.reg_date }</td>
							<td class="inTd" id="${inout.apply_num }">${inout.st_name }</td>
							<td class="inTd" id="${inout.apply_num }">${inout.state }</td>
							<td class="inTd" id="${inout.apply_num }">${inout.final_date }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<c:import url="footer.jsp"></c:import>
	
</form>
</body>



</body>

</html>




