<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main Search Page</title>

<!-- jquery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/user_main_2.css">

<script type="text/javascript">
	$(document).ready(function()
	{
		$("#secondSearchBtn").click(function()
		{
			$st_num = $(this).attr("value")
			$user_num =
<%=(String) session.getAttribute("user_num")%>
	$.ajax(
			{
				url : "comparingInsert.action",
				type : 'post',
				data :
				{
					st_num : $st_num,
					user_num : $user_num
				},
				success : function(html)
				{

					if (html == "")
					{
						alert("이미 비교함에 존재하는 가게입니다.");
					} else
					{
						$(".comStoreListDiv").innerHTML = html;
					}
				},
				error : function()
				{
					alert("error");
				}
			});
		});
	});
</script>

</head>
<body>

	<c:import url="header_user.jsp"></c:import>

	<div class=container>

		<!-- 비교함 외의 영역 -->
		<div id="mainDiv">

			<!-- 메인로고 + 검색창 + 검색버튼 + 체크박스 구역 -->
			<div id="searchArea">

				<!-- 메인로고 -->
				<div id="logoImgDiv">
					<img id="logoImg" name="logoImg" class="Img"
						src="<%=cp%>/images/logo_text.png">
				</div>

				<!-- 검색창 + 검색버튼 -->
				<div id="inputDiv">
					<!-- 검색창 -->
					<input type="text" id="typingArea" name="typingArea" class="insert"
						value=" ${keyword }">
					<button type="button" id="searchBtn" name="searchBtn">
						<img id="searchIcon" src="<%=cp%>/images/search_icon.png">
					</button>
				</div>

				<div id="checkRegion">
					<div id="regionBox">
						<span>지역</span>
					</div>
					<div id="regionCB">
						<c:forEach var="region" items="${regionList }">
							<label for="${region.region_num }"> <input
								type="checkbox" class="checkBox" name="region"
								value="${region.region_name }" id="${region.region_num }">${region.region_name }
							</label>
						</c:forEach>

					</div>
				</div>

				<div id="checkCat">
					<div id="catBox">
						<span>음식 카테고리</span>
					</div>
					<div id="catCB">

						<c:forEach var="foodLabel" items="${foodLabelList }">
							<label for="${foodLabel.food_num }"> <input
								type="checkbox" class="checkBox" name="foodLabel"
								value="${foodLabel.food_name }" id="${foodLabel.food_num }">${foodLabel.food_name }
							</label>
						</c:forEach>

					</div>
				</div>

				<div id="checkStKey">
					<div id="stKeyBox">
						<span>가게 키워드</span>
					</div>
					<div id="stKeyCB">
						<c:forEach var="stKey" items="${stKeyList }">
							<label for="${stKey.st_key_num }"> <input type="checkbox"
								class="checkBox" name="stKey" value="${stKey.st_keyword }"
								id="${stKey.st_key_num }">${stKey.st_keyword }
							</label>
						</c:forEach>

					</div>
				</div>

				<!-- 검색버튼 -->
				<div id="secondSearchBtnDiv">
					<button type="button" id="secondSearchBtn" name="secondSearchBtn">
						필터 검색하기</button>
				</div>

			</div>



			<!-- 검색 결과 구역 -->
			<div id="resultStDiv">


				<div class="searchNameMore">
					<div class="searchName">
						▼ <span>검색 결과</span>
					</div>
				</div>

				<!-- 가게 구역 -->
				<div class="storeList">
					<c:forEach var="store" items="${searchList}">

						<div class="store">
							<!-- 가게 사진 + 찜, 비교함추가 -->
							<div class="stImgBtnDiv">
								<div class="stImgDiv">
									<img class="stImg" src="<%=cp%>/${store.photo_link}">
								</div>

								<div class="likeComAddBtn">
									<button type="button" class="comAddBtn"
										value="${store.st_num }">+</button>
									<button type="button" class="likeAddBtn"
										value="${store.st_num }">❤️</button>
								</div>

							</div>

							<div class="name_reviewDiv">
								<!-- 가게 명 -->
								<div class="stName">${store.st_name}</div>

								<!-- 별점 평점(리뷰 수) -->
								<div class="startReviewDivs">
									<span>${store.star_avg}</span>(${store.rv_count})
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
				<!-- storeList end -->

			</div>
			<!-- resultStDiv end -->


			<!-- 더보기 버튼 -->
			<div class="searchMore">
				<button type="button" id="searchMore" style="margin: auto;">검색
					결과 더보기</button>
			</div>

		</div>
		<!-- mainDiv end -->



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
							test="${fn:length(comList) == null or fn:length(comList) == 0 }">
							<c:forEach begin="0" end="9">
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
							<c:forEach var="com" items="${comList }" varStatus="status">
								<div class="comStoreDiv">
									<!-- 한 가게 대표사진 영역 -->
									<div class="comStoreImgDiv">
										<button type="button" value="${com.st_num }" class="comDelete">X</button>
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
						</c:otherwise>
					</c:choose>
				</div>
			</div>


			<div class="comStoreBtnDiv">
				<button type="button" class="btn" id="comBtn" name="comBtn">비교하기</button>
			</div>

		</div>

	</div>

	<c:import url="footer.jsp"></c:import>

</body>
</html>