<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:forEach var="com" items="${comList }" varStatus="status">
	<div class="comStoreDiv">
		<!-- 한 가게 대표사진 영역 -->
		<div class="comStoreImgDiv">
			<button type="button" value="${com.st_num }"
				class="comDelete">X</button>
			<label for="st1" class="stLabel"> <input
				type="checkbox" class="comStImgCB" id="st1"> <!-- <span class="circle"></span> -->
				<img class="comStImg" src="<%=cp%>/${com.photo_link }">
			</label>
		</div>
		<!-- 한 가게 가게이름 영역 -->
		<div class="comStoreNameDiv">${com.st_name }</div>
	</div>
</c:forEach>
<c:forEach begin="0" end="${10 - fn:length(comList) }">
	<div class="comStoreDiv">
		<!-- 한 가게 대표사진 영역 -->
		<div class="comStoreImgDiv">
			<img class="comStNoImg" src="<%=cp%>/images/comp_img01.png">
		</div>
		<!-- 한 가게 가게이름 영역 -->
		<div class="comStoreNameDiv"></div>
	</div>
</c:forEach>