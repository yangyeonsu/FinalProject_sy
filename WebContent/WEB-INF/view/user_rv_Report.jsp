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



<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_main.css">

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">

<style type="text/css">
	
	/* 메인페이지 */
	.middle
	{
		display: flex;
		width: 97vw;
		padding: 0px;
		align-items: stretch;
	}
	.rv_reportlist
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
	.rpt_subtitle
	{
		text-align: center;

		width: 8vw;
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
	.rv_report
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
	

</head>
<body>

	<div class="header">
		<c:import url="header_user.jsp"></c:import>
	</div>

	
	
	<div class="middle">
	<c:import url="sideBar_user.jsp"></c:import>
		
		
		
		
		<div class="right_content">
			<div class="rv_report">
				<div class="title">
					리뷰 신고 내역
				</div>
				<hr>
				<div class="rv_reportlist">
					<div class="subtitle">
						<div class="rpt_subtitle">신고일자</div>
						<div class="st_name">가게명</div>
						<div class="rpt_subtitle">피신고자ID</div>
						<div class="rpt_subtitle">처리상태</div>
						<div class="rpt_subtitle">처리일자</div>
					</div>
					<c:choose>
					    <c:when test="${empty user_rv_Report}">
					        <div class="no-data-message">리뷰 신고 내역이 존재하지 않습니다.</div>
					    </c:when>
					    <c:otherwise>
					        <c:forEach var="rvreport" items="${user_rv_Report}">
					            <div class="report_content">
					                <div class="rpt_content">${rvreport.reg_date }</div>
					                <div class="st_name">${rvreport.st_name }</div>
					                <div class="rpt_content">${rvreport.reporteduserid }</div>
					                <div class="rpt_content">${rvreport.status }</div>
					                <div class="rpt_content">${rvreport.final_date }</div>
					            </div>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
				</div>
			</div>
		</div><!-- right_content -->
		
	</div><!-- .middle end -->
	


	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>

</body>
</html>