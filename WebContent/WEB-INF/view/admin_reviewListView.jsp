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
	
</style>

<script type="text/javascript">
	$(function()
	{

		$(".reviewTd").click(function()
		{
			var reportNum = $(this).siblings("[id]").attr("id");
			//alert(reportNum);
			$(location).attr("href","reviewreportform.action?rep_apply_num="+reportNum);
			
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