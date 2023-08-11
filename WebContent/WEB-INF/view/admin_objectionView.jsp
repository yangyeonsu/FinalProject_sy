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
<title>admin_objectionView.jsp</title>
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

		$(".objTd").click(function()
		{
			var reportNum = $(this).siblings("[id]").attr("id");
			//alert(reportNum);
			var state = $(this).parent().attr('id');
			$(location).attr("href","objreportform.action?obj_apply_num="+reportNum+"&state="+state);
			
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
				<h1>이의제기 접수내역 관리</h1>
				
				<!-- 이의제기 box -->
	
				<div id="objectionBox" style="height: auto;">
	        
					<div class="more" id="more">
						<h3><a href="#">이의제기</a></h3>
						<a href="admin_objectionView.jsp" class="moreBtn">더보기+</a>
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
							<c:forEach var="obj" items="${objList }">
							<tr id="${obj.state }">
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