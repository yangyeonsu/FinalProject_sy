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
<title>review_insert</title>
<link rel="stylesheet" type="text/css" href="css/review_insert.css">

</head>
<body>

<c:import url="header_user_sh.jsp"></c:import>

<div id="container">

	<!-- 리뷰작성 타이틀 -->
	<div class="bigTitle reviewTitleDiv">
		&nbsp;&nbsp;리뷰 작성
	</div>
	
	<!-- 리뷰 키워드 선택 -->
	<div class="box1 reviewKeywordDiv">
		<!-- 리뷰 키워드 선택 타이틀 -->
		<div class="middleTitle reviewKeywordTitleDiv">
			&nbsp;&nbsp;리뷰 키워드 선택
		</div>
		
		<!-- 리뷰 키워드 선택 CB -->
		<div class="reviewKeywordCB">
			<div class="cb">
				<label for="1">
					<input type="checkbox" value="interior" id="1">인테리어가 멋져요
				</label>
				<label for="2">
					<input type="checkbox" value="interior" id="2">인테리어가 멋져요
				</label>
				<label for="3">
					<input type="checkbox" value="interior" id="3">인테리어가 멋져요
				</label>
				<label for="4">
					<input type="checkbox" value="interior" id="4">인테리어가 멋져요
				</label>
				<label for="5">
					<input type="checkbox" value="interior" id="5">인테리어가 멋져요
				</label>
			</div>
			<div class="cb">
				<label for="6">
					<input type="checkbox" value="interior" id="6">인테리어가 멋져요
				</label>
				<label for="7">
					<input type="checkbox" value="interior" id="7">인테리어가 멋져요
				</label>
				<label for="8">
					<input type="checkbox" value="interior" id="8">인테리어가 멋져요
				</label>
				<label for="9">
					<input type="checkbox" value="interior" id="9">인테리어가 멋져요
				</label>
				<label for="10">
					<input type="checkbox" value="interior" id="10">인테리어가 멋져요
				</label>
			</div>
			<div class="cb">
				<label for="11">
					<input type="checkbox" value="interior" id="11">인테리어가 멋져요
				</label>
				<label for="12">
					<input type="checkbox" value="interior" id="12">인테리어가 멋져요
				</label>
				<label for="13">
					<input type="checkbox" value="interior" id="13">인테리어가 멋져요
				</label>
				<label for="14">
					<input type="checkbox" value="interior" id="14">인테리어가 멋져요
				</label>
				<label for="15">
					<input type="checkbox" value="interior" id="15">인테리어가 멋져요
				</label>
			</div>
			<div class="cb">
				<label for="16">
					<input type="checkbox" value="interior" id="16">인테리어가 멋져요
				</label>
				<label for="17">
					<input type="checkbox" value="interior" id="17">인테리어가 멋져요
				</label>
				<label for="18">
					<input type="checkbox" value="interior" id="18">인테리어가 멋져요
				</label>
				<label for="19">
					<input type="checkbox" value="interior" id="19">인테리어가 멋져요
				</label>
				<label for="20">
					<input type="checkbox" value="interior" id="20">인테리어가 멋져요
				</label>
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
				<option id="0" selected="selected">----별점 선택----</option>
				<option id="1">★</option>
				<option id="2">★★</option>
				<option id="3">★★★</option>
				<option id="4">★★★★</option>
				<option id="5">★★★★★</option>
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