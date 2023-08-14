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
<title>admin_penaltyView.jsp</title>
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
		
		$(".revoTd").click(function()
		{
			var reportNum = $(this).siblings("[id]").attr("id");
			//alert(reportNum);
			var state = $(this).parent().attr('id');
			$(location).attr("href","penaltyrevokeform.action?revo_apply_num="+reportNum+"&state="+state);
			
		});
	});
</script>


<body>
<form id="adminForm" method="post">
	<!-- header -->
	<header><c:import url="header_admin.jsp"></c:import></header>
		
		
	<div id="mainDiv">
		
		<!-- 접수내역관리 -->
		<div id="receive">
			<h1>패널티회수 접수내역 관리</h1>
			
			<!-- 패널티회수 box -->
			<div id="penaltyBox" style="height: auto;">

				<div class="more" id="more">
					<h3><a href="#">패널티회수</a></h3>
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
						<c:forEach var="revo" items="${revoList }">
						<tr id="${revo.state }">
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