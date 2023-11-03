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
<title>가게 정보오류수정요청 내역</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/reqRepList.css">

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


</head>
<body>

	<div class="header">
		<c:import url="header_user.jsp"></c:import>
	</div>

	<div class="middle">
		<c:import url="sideBar_user.jsp"></c:import>

		<div class="right_content">
			<div class="rv_report">
				<div class="title">가게정보수정요청 내역</div>
				<hr>
				<div class="rv_reportlist">
					<div class="subtitle">
						<div class="rpt_subtitle">수정요청일자</div>
						<div class="rpt_subtitle">이의제기 신청여부</div>
						<div class="rpt_subtitle">패널티</div>
					</div>
					<c:choose>
						<c:when test="${empty stinfoupdatelist}">
							<div class="no-data-message">가게정보수정요청 내역이 없습니다.</div>
							<c:forEach var="stud" begin='1' end='10'>
								<div class="report_content">
									<div class="rpt_content"></div>
									<div class="rpt_content"></div>
									<div class="rpt_content"></div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="stud" items="${stinfoupdatelist}">
								<div class="report_content">
									<div class="rpt_content">${stud.final_date }</div>
									<div class="rpt_content">${stud.objyn }</div>
									<div class="rpt_content">${stud.ptyn }</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<!-- 페이징 처리 -->
					<div class="pagination">
						<c:choose>
							<c:when test="${empty stinfoupdatelist}">
								<p></p>
							</c:when>
							<c:otherwise>
								<div class="pageIndex">${pageIndex }</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<!-- right_content -->

	</div>
	<!-- .middle end -->

	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>

</body>
</html>