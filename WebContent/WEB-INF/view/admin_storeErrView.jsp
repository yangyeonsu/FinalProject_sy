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
<title>admin_storeErrView.jsp</title>
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

		$(".errTd").click(function()
		{
			var reportNum = $(this).siblings("[id]").attr("id");
			var state = $(this).parent().attr('id');
			//alert(state);
			$(location).attr("href","errreportform.action?req_apply_num="+reportNum+"&state="+state);
			
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
				<h1>가게정보수정요청 접수내역 관리</h1>
				
				<!-- 가게정보수정요청 box -->
	
				<div id="storeErrBox" style="height: auto;">
	
					<div class="more" id="more">
						<h3><a href="#">가게정보수정요청</a></h3>
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
							<c:forEach var="err" items="${reqList }">
							<tr id="${err.state }">
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