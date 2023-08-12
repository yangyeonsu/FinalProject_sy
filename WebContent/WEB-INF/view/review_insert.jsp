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
<title>review_insert</title>
<link rel="stylesheet" type="text/css" href="css/review_insert.css">
<script type="text/javascript" 	src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function()
	{
		$("#submitReviewBtn").click(function()
		{
			var star = $("#starSelect").val();
			$("#starHidden").attr("value", star);
			alert($("#starHidden").val());
			
			var skArr = [];
			
			if ($("#sk1").val() != null)
				skArr.push($("#sk1").val().trim());
			if ($("#sk2").val() != null)
				skArr.push($("#sk2").val().trim());
			if ($("#sk3").val() != null)
				skArr.push($("#sk3").val().trim());
			if ($("#sk4").val() != null)
				skArr.push($("#sk4").val().trim());
			if ($("#sk5").val() != null)
				skArr.push($("#sk5").val().trim());
			
			alert(skArr[0]);
				
			$("input[name=skArrHidden]").attr("value", skArr);
			
			$("#userForm").attr("action", "insertreview.action");
			$("#userForm").submit();
		});		
	});
	
</script>

</head>
<body>
	<form action="" id="userForm" method="post">
		<c:import url="header_userMain.jsp"></c:import>
		<div id="container">

			<!-- 리뷰작성 타이틀 -->
			<div class="bigTitle reviewTitleDiv">&nbsp;&nbsp;리뷰
				작성&nbsp;&nbsp;[${st_name }]</div>

			<!-- 리뷰 키워드 선택 -->
			<div class="box1 reviewKeywordDiv">
				<!-- 리뷰 키워드 선택 타이틀 -->
				<div class="middleTitle reviewKeywordTitleDiv">&nbsp;&nbsp;리뷰
					키워드 선택</div>

				<!-- 리뷰 키워드 선택 CB -->
				<div class="reviewKeywordCB">
					<div class="stCb">
						<c:forEach var="rvKey" items="${reviewKeywords }" begin="0"
							end="${fn:length(reviewKeywords) }" step="1" varStatus="status">
							<c:choose>
								<c:when test="${status.index == 0 }">
									<div class="stCbList">
										<label for="${rvKey.rv_key_num }"> <input
											type="checkbox" value="${rvKey.rv_key_num }"
											id="${rvKey.rv_key_num }">${rvKey.rv_key_name }
										</label>
								</c:when>
								<c:when test="${status.index mod 5 == 0}">
					</div>
					<div class="stCbList">
						<label for="${rvKey.rv_key_num }"> <input type="checkbox"
							value="${rvKey.rv_key_num }" id="${rvKey.rv_key_num }">${rvKey.rv_key_name }
						</label>
						</c:when>
						<c:otherwise>
							<label for="${rvKey.rv_key_num }"> <input type="checkbox"
								value="${rvKey.rv_key_num }" id="${rvKey.rv_key_num }">${rvKey.rv_key_name }
							</label>
						</c:otherwise>
						</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- 검색 키워드 작성 -->
			<div class="box2 searchKeywordDiv">
				<!-- 검색 키워드 타이틀 -->
				<div class="middleTitle searchKeywordTitleDiv">
					&nbsp;&nbsp;검색 키워드&nbsp;&nbsp; <i style="font-size: 10pt;">(각
						칸에 하나의 공백 없는 단어로 작성해주세요! 추후 이 가게가 검색되는 경로로 사용됩니다.)</i>
				</div>

				<!-- 검색 키워드 작성란 -->
				<div class="searchKeyword">
					1. <input type="text" id="sk1"class="searchKeywordtxt"> 2. <input
						type="text" id="sk2" class="searchKeywordtxt"> 3. <input
						type="text" id="sk3" class="searchKeywordtxt"> 4. <input
						type="text" id="sk4" class="searchKeywordtxt"> 5. <input
						type="text" id="sk5" class="searchKeywordtxt">
				</div>
				<input type="hidden" id="skArrHidden" name="skArrHidden">
			</div>

			<!-- 별점 -->
			<div class="box3 starDiv">

				<!-- 별점 타이틀 -->
				<div class="middleTitle starTitleDiv">&nbsp;&nbsp;별점</div>
				<!-- 별점 선택 -->
				<div class="starSelectDiv">
					<select name="starSelect" id="starSelect">
						<option id="fiv" value="5" selected="selected">⭐⭐⭐⭐⭐</option>
						<option id="fou" value="4">⭐⭐⭐⭐</option>
						<option id="thi" value="3">⭐⭐⭐</option>
						<option id="sec" value="2">⭐⭐</option>
						<option id="one" value="1">⭐</option>
					</select>
				</div>
				<input type="hidden" id="starHidden" name="starHidden">
			</div>

			<!-- 리뷰작성 -->
			<div class="box1 reviewDiv">
				<!-- 리뷰작성 타이틀 -->
				<div class="middleTitle reviewInsertTitleDiv">
					&nbsp;&nbsp;리뷰작성</div>

				<!-- 리뷰작성란 -->
				<div class="reviewInsertDiv">
					<textarea rows="6" cols="135" name="reviewContent"></textarea>
				</div>

				<!-- 리뷰사진 업로드 버튼 -->
				<div class="reviewPhotoDiv">
					<button id="photoUploadBtn" class="reviewBtn">사진첨부</button>
				</div>
			</div>

			<!-- 리뷰작성완료 버튼 -->
			<div class="reviewInsertBtnDiv">
				<input type="hidden" id="st_num" name="st_num" value="${st_num }">
				<button type="button" id="submitReviewBtn" class="reviewBtn">작성완료</button>
			</div>

		</div>
	</form>
</body>
</html>