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
<title>Insert title here</title>


<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
	
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/compareBox.css">

<script type="text/javascript">
	/* 
	 $(function()
	 {
	 $("#comBtn").click(function()
	 {
	 if ($('input:checkbox[name=comStImgCB]').length > 3)
	 {
	 alert("3개 이상 비교 불가");
	 return;
	 }
	
	
	 var checkArray = new Array();
	
	 $('input:checkbox[name=comStImgCB]:checked').each(function()
	 {
	 checkArray.push($(this).attr("id"));
	 });
	
	 $("#checkedCompare").val(checkArray);
	
	 $("#userForm").attr("action","compareView.action");
	 $("#userForm").submit();
	
	
	 });
	 });
	 */

	$(function()
	{
		$("#comBtn").click(function()
		{
			if ($('input:checkbox[name=comStImgCB]:checked').length == 1)
			{
				alert("2개부터 비교 가능합니다.");
				return;
			}
			
			if ($('input:checkbox[name=comStImgCB]:checked').length == 0)
			{
				alert("최소 2개 이상 선택해주세요.");
				return;
			}
			
			if($('#user').val()=='먹린이')
			{
				if($('input:checkbox[name=comStImgCB]:checked').length > 2)
				{
					alert("'먹린이'등급은 2개까지만 비교가 가능합니다!");
					return;
				}
			}

			var checkArray = "";

			$('input:checkbox[name=comStImgCB]:checked').each(function()
			{
				checkArray += $(this).attr("id") + ",";
			});

			// 확인
			//alert(checkArray);

			$("#checkedCompare").attr("value", checkArray);

			$("input:checkbox[name=comStImgCB]:checked").each(function()
			{
				$(this).prop("checked", false);
				comTotalChecked = 0;
			});

			$("#userForm").attr("action", "compareview.action");
			$("#userForm").submit();
		});
	});


	var comTotalChecked = 0;


	function comCountChecked(field)
	{
		if (field.checked)
			comTotalChecked += 1;
		else
			comTotalChecked -= 1;

		if (comTotalChecked > 3)
		{
			alert("3개까지만 선택 가능합니다.");
			field.checked = false;
			comTotalChecked -= 1;
		}

	}

</script>
</head>
<body>

	<!-- 비교함 영역 -->
	<div id="compareDiv">
		<div class="rectDiv">
			<!-- 비교함 이름 영역 -->
			<div class="comNameDiv">
				<span style="font-color: #ef6351">비교함</span>
			</div>

			<!-- 비교함 담은 가게 리스트 영역 -->
			<div class="comStoreListDiv">
				<c:choose>
					<c:when
						test="${fn:length(comList) == 0 or fn:length(comList) == null}">
						<c:forEach var="i" begin="0" end="9">
							<div class="comStoreDiv">
								<!-- 한 가게 대표사진 영역 -->
								<div class="comStoreImgDiv">
									<img class="comStNoImg" src="<%=cp%>/images/comp_img01.png">
								</div>
								<!-- 한 가게 가게이름 영역 -->
								<div class="comStoreNameDiv"></div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<!-- 한 가게 영역 -->
						<c:forEach var="com" items="${comList}" varStatus="status">
							<div class="comStoreDiv">
								<!-- 한 가게 대표사진 영역 -->
								<div class="comStoreImgDiv">
									<button type="button" value="${com.st_num}" class="comDelete">X</button>
									<label for="${com.st_num}" class="stLabel"> <input
										type="checkbox" class="comStImgCB" name="comStImgCB"
										id="${com.st_num}" onclick="comCountChecked(this)"> <c:set var="photo"
											value="${com.photo_link }" /> <c:choose>
											<c:when test="${empty photo}">
												<img class="stImg" src="<%=cp%>/images/logo_text.png">
											</c:when>
											<c:otherwise>
												<img class="stImg" src="<%=cp%>/${photo}">
											</c:otherwise>
										</c:choose>
									</label>
								</div>
								<!-- 한 가게 가게이름 영역 -->
								<div class="comStoreNameDiv">
									<button type="button" value="${com.st_num}" class="comStoreBtn"
												onclick="location.href='stdetail-userview.action?st_num=${com.st_num}'">
									${com.st_name }
									</button>
								</div>
							</div>
						</c:forEach>
						<c:forEach begin="0" end="${10 - fn:length(comList)}">
							<div class="comStoreDiv">
								<!-- 한 가게 대표사진 영역 -->
								<div class="comStoreImgDiv">
									<img class="comStNoImg" src="<%=cp%>/images/comp_img01.png">
								</div>
								<!-- 한 가게 가게이름 영역 -->
								<div class="comStoreNameDiv"></div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<input type="hidden" id="checkedCompare" name="checkedCompare">
			<input type="hidden" id="user" name="user" value="${user.user_grade }">
		</div>

		<div class="comStoreBtnDiv">
			<button type="button" id="comBtn" name="comBtn">비교하기</button>
		</div>
	</div>

</body>
</html>