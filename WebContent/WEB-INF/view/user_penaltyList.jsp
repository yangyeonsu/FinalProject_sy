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
<meta charset="UTF-8">
<title>나의 신고 받은 내역</title>

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
				//$('.overlay').css("margin-top", "1.011vh");
				$('#checkOverlay').attr("value", "true");
			}

		});
		// 왼쪽메뉴 드롭다운
		$(".sub_menu ul.small_menu").hide();
		$(".sub_menu ul.big_menu").click(function()
		{
			$(".sub_menu ul.small_menu").not(this).fadeOut(250);
			$("ul", this).stop().slideToggle(300);
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
						<div class="pen_subtitle">리뷰내용</div>
						<div class="pen_subtitle">신고내용</div>
						<div class="pen_subtitle">처리상태</div>
						<div class="pen_subtitle">처리일자</div>
					</div>
					<c:choose>
						<c:when test="${empty penaltyList}">
							<br>
							<div class="no-data-message">경고 내역이 없습니다.</div>
							<div class="report_content">
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="pl" items="${penaltyList}">
								<div class="report_content">
									<div class="rpt_content">${pl.reg_date }</div>
									<div class="rpt_content">${pl.st_name }</div>
									<c:choose>
										<c:when test="${fn:length(pl.rv_content) > 9 }">
											<div class="rpt_content rep_rs" id="repNum${pl.rep_apply_num}">${fn:substring(pl.rv_content, 0, 9)}···</div>
										</c:when>
										<c:otherwise>
											<div class="rpt_content rep_rs" id="repNum${pl.rep_apply_num}">${pl.rv_content }</div>
										</c:otherwise>
									</c:choose>
									<div class="rep_rs_hidden" id="repNum${pl.rep_apply_num}">${pl.rv_content }</div>
									<div class="rpt_content" >${pl.rep_rs_name }</div>
									<c:choose>
										<c:when test="${pl.state eq '처리완료' and pl.ismidrej ne '미처리'}">
											<div class="rpt_content">${pl.state }(${pl.ismidrej })</div>
										</c:when>
										<c:otherwise>
											<div class="rpt_content">${pl.state }</div>
										</c:otherwise>
									</c:choose>
									<div class="rpt_content">${pl.final_date }</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<!-- 페이징 처리 -->
					<div class="pagination">
						<c:choose>
			                <c:when test="${empty penaltyList}">
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