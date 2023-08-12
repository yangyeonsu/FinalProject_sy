<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

</head>
<body>

<c:import url="header_userMain.jsp"></c:import>

<div id="container">

	<!-- 리뷰작성 타이틀 -->
	<div class="bigTitle reviewTitleDiv">
		&nbsp;&nbsp;리뷰 작성&nbsp;&nbsp;[${st_name }]
	</div>
	
	<!-- 리뷰 키워드 선택 -->
	<div class="box1 reviewKeywordDiv">
		<!-- 리뷰 키워드 선택 타이틀 -->
		<div class="middleTitle reviewKeywordTitleDiv">
			&nbsp;&nbsp;리뷰 키워드 선택
		</div>
		
		<!-- 리뷰 키워드 선택 CB -->
		<div class="reviewKeywordCB">
			<div class="stCb">
				<c:forEach var="rvKey" items="${reviewKeywords }" begin="0" end="${fn:length(reviewKeywords) }" step="1" varStatus="status">
					<c:choose>
						<c:when test="${status.index == 0 }">
							<div class="stCbList">
								<label for="${rvKey.rv_key_num }">
									<input type="checkbox" value="${rvKey.rv_key_num }" id="${rvKey.rv_key_num }">${rvKey.rv_key_name }
								</label>
						</c:when>
						<c:when test="${status.index mod 5 == 0}">
							</div><div class="stCbList">
								<label for="${rvKey.rv_key_num }">
									<input type="checkbox" value="${rvKey.rv_key_num }" id="${rvKey.rv_key_num }">${rvKey.rv_key_name }
								</label>
						</c:when>
						<c:otherwise>
							<label for="${rvKey.rv_key_num }">
								<input type="checkbox" value="${rvKey.rv_key_num }" id="${rvKey.rv_key_num }">${rvKey.rv_key_name }
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
			&nbsp;&nbsp;검색 키워드
		</div>
		
		<!-- 검색 키워드 작성란 -->
		<div class="searchKeyword">
			1. <input type="text" class="searchKeywordtxt">
			2. <input type="text" class="searchKeywordtxt">
			3. <input type="text" class="searchKeywordtxt">
			4. <input type="text" class="searchKeywordtxt">
			5. <input type="text" class="searchKeywordtxt">
		</div>
	</div>
	
	<!-- 별점 -->
	<div class="box3 starDiv">
	
		<!-- 별점 타이틀 -->
		<div class="middleTitle starTitleDiv">
			&nbsp;&nbsp;별점
		</div>
		<!-- 별점 선택 -->
		<div class="starSelectDiv">
			<select name="" id="starSelect">
				<option id="1">⭐</option>
				<option id="2">⭐⭐</option>
				<option id="3">⭐⭐⭐</option>
				<option id="4">⭐⭐⭐⭐</option>
				<option id="5" selected="selected">⭐⭐⭐⭐⭐</option>
			</select>
		</div>
	</div>
	
	<!-- 리뷰작성 -->
	<div class="box1 reviewDiv">
		<!-- 리뷰작성 타이틀 -->
		<div class="middleTitle reviewInsertTitleDiv">
			&nbsp;&nbsp;리뷰작성
		</div>
		
		<!-- 리뷰작성란 -->
		<div class="reviewInsertDiv">
			<textarea rows="6" cols="135"></textarea>
		</div>
		
		<!-- 리뷰사진 업로드 버튼 -->
		<div class="reviewPhotoDiv">
			<button id="photoUploadBtn" class="reviewBtn">사진첨부</button>
		</div>
	</div>
	
	<!-- 리뷰작성완료 버튼 -->
	<div class="reviewInsertBtnDiv">
		<button id="submitBtn" class="reviewBtn">작성완료</button>
	</div>

</div>

<c:import url="footer.jsp"></c:import>

</body>
</html>