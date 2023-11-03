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
<title>신고 받은 경고 내역</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/reqRepList.css">

<!-- <style type="text/css">
	.continer{
		position: static;
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
		width: 14vw;
		padding: 1vh;;
	}
	.no-data-message
	{
		text-align: center;
	}
	
</style> -->

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
			<div class="penalty_report">
				<div class="title">경고 내역</div>
				<hr>
				<div class="penaltylist">
					<div class="subtitle">
						<div class="pen_subtitle">신고일자</div>
						<div class="st_name">가게명</div>
						<div class="pen_subtitle">처리일자</div>
					</div>
					<c:choose>
						<c:when test="${empty user_penaltyList}">
							<div class="no-data-message">경고 내역이 없습니다.</div>
							<c:forEach begin="1" end="10">
								<div class="report_content">
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="pl" items="${penList}">
								<div class="report_content">
									<div class="pen_subtitle">${pl.reg_date }</div>
									<div class="st_name">${pl.st_name }</div>
									<div class="pen_subtitle">${pl.write_date }</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<!-- 페이징 처리 -->
					<div class="pagination">
						<!-- <c:choose>
							<c:when test="${empty penList}">
								<p></p>
							</c:when>
							<c:otherwise>
								<ul class="pagination-list">
									<li><a
										href="${cp}/user_stupdate_relist.action?page=${currentPage - 1}">&laquo;
											Previous</a></li>
									<c:forEach var="pageNum" begin="1" end="${totalPages}">
										<li><a
											href="${cp}/user_stupdate_relist.action?page=${pageNum}">${pageNum}</a></li>
									</c:forEach>
									<li><a
										href="${cp}/user_stupdate_relist.action?page=${currentPage + 1}">Next
											&raquo;</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
						 -->
						<c:choose>
			                <c:when test="${empty penList}">
			                    <p></p>
			                </c:when>
			                <c:otherwise>
			                    <div class="pageIndex">
									${pageIndex }
								</div>
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