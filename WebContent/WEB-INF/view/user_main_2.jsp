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
		$(".comAddBtn").click(function()
		{
			var st_num = $(this).val()
			
			var user_num = "<%=(String) session.getAttribute("user_num")%>"
			
			$.ajax(
			{
				url : "comparinginsert.action",
				type : "POST",
				data : { "user_num" : user_num
						, "st_num" : st_num },
				dataType : "text",
				success : function(data)
				{
					if (data == "")
					{
						alert("이미 비교함에 담긴 가게입니다.");
					} else
					{
						$(".comStoreListDiv").html(data);
					}
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});

		});
		
		$(document).on("click",".comDelete", function()
		{
			$st_num = $(this).val();
			$user_num = "<%=(String) session.getAttribute("user_num")%>"

			$.ajax(
			{
				url : "comdelete.action",
				type : 'post',
				data :
				{
					"user_num" : $user_num,
					"st_num" : $st_num
				},
				success : function(data)
				{
					if (data == "")
					{
						alert("비교함에서 이미 삭제된 가게입니다.");
					} else
					{
						alert("비교함에서 삭제되었습니다.");
						$(".comStoreListDiv").html(data);
					}
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});
		});

		$(document).on("click",".likeAddBtn", function()
		{
			$st_num = $(this).val();
			$user_num = "<%=(String) session.getAttribute("user_num")%>"

			$.ajax(
			{
				url : "jjiminsertdelete.action",
				type : 'post',
				data :
				{
					"st_num" : $st_num,
					"user_num" : $user_num
				},
				context : this,
				success : function(result)
				{
					$(this).html(result);
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});

		});

		$("#searchBtn").click(function()
		{
			$("#userForm").attr("action", "search.action");
			$("#userForm").submit();
		});

		$("#secondSearchBtn").click(function()
		{
			var regionChk = [];
			var foodlabelChk = [];
			var stKeyChk = [];

			$("input:checkbox[name=region]:checked").each(function(){
				regionChk.push($(this).val()); 
			});

			$("input:checkbox[name=foodLabel]:checked").each(function(){
				foodlabelChk.push($(this).val()); 
			});
			
			$("input:checkbox[name=stKey]:checked").each(function(){
				stKeyChk.push($(this).val()); 
			});
			
			$("#regionChk").val(regionChk);
			$("#foodlabelChk").val(foodlabelChk);
			$("#stKeyChk").val(stKeyChk);
			
			if($(".checkBox").is(":checked"))
			{
				$(".checkBox").prop("checked", false); 
			}
			
			$("#userForm").attr("action", "filterSearch.action");
			$("#userForm").submit();
		});
		
		$("#comBtn").click(function()
		{
			if ($('input:checkbox[name=checkList]').length > 3)
			{
				alert("3개 이상 비교 불가");
				return;
			}
			
			/* $("#userForm").attr("method","get"); */
			
			var checkArray = new Array();
			
			$('input:checkbox[name=comStImgCB]:checked').each(function()
			{
				checkArray.push($(this).attr("id"));
			});
			
			$("#checkedCompare").val(checkArray);
			
			$("#userForm").attr("action","compareView.action");
			$("#userForm").submit();
			
			
		});

		// 필터 검색 범례 유지
		$('.hiddenRL').each(function(){
			  var region = $(this).val();
			  alert(region);
			  $("#"+region).prop("checked", true);
		});
		
		$('.hiddenCL').each(function(){
			  var category = $(this).val();
			  alert(category);
			  $("#"+category).prop("checked", true);
		});
		
		$('.hiddenSL').each(function(){
			  var skey = $(this).val();
			  alert(skey);
			  $("#"+skey).prop("checked", true);
		});

		
	});
	
	function enterkey() 
	{	
		if (window.event.keyCode == 13)
		{
			if ($("#typingArea").val() == "")
			{
				$("#typingArea").focus();
				return;
			}
			
			$("#userForm").attr("action", "search.action");
			$("#userForm").submit();
		}
	}
</script>

</head>
<body>


	<form action="" id="userForm" method="POST">

		<div class="header">
			<c:import url="header_userMain.jsp"></c:import>
		</div>

		<div class=container>

			<!-- 비교함 외의 영역 -->
			<div id="mainDiv">

				<!-- 메인로고 + 검색창 + 검색버튼 + 체크박스 구역 -->
				<div id="searchArea">

					<!-- 메인로고 -->
					<button type="button" id="logoImgBtn"
						onclick="location.href='main.action'">
						<img id="logoImg" name="logoImg" class="Img"
							src="<%=cp%>/images/logo_text.png">
					</button>

					<!-- 검색창 + 검색버튼 -->
					<div id="inputDiv">
						<!-- 검색창 -->
						<input type="text" id="typingArea" name="typingArea"
							class="insert" value="${keyword }">
						<button type="button" id="searchBtn" name="searchBtn">
							<img id="searchIcon" src="<%=cp%>/images/search_icon.png">
						</button>
					</div>

					<div id="checkRegion">
						<div id="regionBox">
							<span>지역</span>
						</div>
						<div id="regionCB">
							<c:forEach var="region" items="${regionList}" varStatus="i">
								<label for="${region.region_name}">
						            <input type="checkbox" class="checkBox" name="region" value="${region.region_name}" id="${region.region_name}">${region.region_name}
						        </label>
								<c:if test="${(i.index + 1) % 5 == 0 }"><br></c:if>
					    	</c:forEach>
						</div>
						<c:forEach var = "rch" items = "${regionChecked }">
							<input type="hidden" class="hiddenRL" value="${rch}">
						</c:forEach>
					</div>

					<div id="checkCat">
						<div id="catBox">
							<span>음식 카테고리</span>
						</div>
						<div id="catCB">
							<c:forEach var="foodLabel" items="${foodLabelList }">
								<label>
									<input type="checkbox" class="checkBox" name="foodLabel" value="${foodLabel.food_name }" id="${foodLabel.food_name }">${foodLabel.food_name }
								</label>
							</c:forEach>
						</div>
						<c:forEach var = "cch" items = "${catChecked }">
							<input type="hidden" class="hiddenCL" value="${cch}">
						</c:forEach>
					</div>

					<div id="checkStKey">
						<div id="stKeyBox">
							<span>가게 키워드</span>
						</div>
						<div id="stKeyCB">
							<c:forEach var="stKey" items="${stKeyList }">
								<label for="${stKey.st_keyword }">
									<input type="checkbox" class="checkBox" name="stKey" value="${stKey.st_keyword }" id="${stKey.st_keyword}">${stKey.st_keyword }
								</label>
							</c:forEach>
						</div>
						<c:forEach var="sch" items="${stKeyChecked }">
							<input type="hidden" class="hiddenSL" value="${sch}">
						</c:forEach>
					</div>

					<!-- 검색버튼 -->
					<div id="secondSearchBtnDiv">
						<button type="button" id="secondSearchBtn" name="secondSearchBtn">
							필터 검색하기</button>
					</div>
					<input type="hidden" name="regionChk" id="regionChk"> <input
						type="hidden" name="foodlabelChk" id="foodlabelChk"> <input
						type="hidden" name="stKeyChk" id="stKeyChk">

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
						<c:choose>
							<c:when test="${empty searchList}">
								<div class="error">검색 결과가 존재하지 않습니다.</div>
							</c:when>
							<c:otherwise>


								<c:forEach var="store" items="${searchList}">

									<div class="store">
										<!-- 가게 사진 + 찜, 비교함추가 -->
										<div class="stImgBtnDiv">
											<div class="stImgDiv">
												<button type="button" value="${store.st_num }"
													class="storeBtn"
													onclick="location.href='stdetail-userview.action?st_num=${store.st_num}'">
													<c:set var="photo" value="${store.photo_link }" />

													<c:choose>
														<c:when test="${empty photo}">
															<img class="stImg" src="<%=cp%>/images/logo_text.png">
														</c:when>
														<c:otherwise>
															<img class="stImg" src="<%=cp%>/${photo}">
														</c:otherwise>
													</c:choose>
												</button>
											</div>

											<div class="likeComAddBtn">
												<button type="button" class="comAddBtn"
													value="${store.st_num }">+</button>

												<div class="likeBtnDiv">
													<c:set var="list" value="${userJjimList}" />
													<c:set var="num" value="${store.st_num}" />

													<c:choose>
														<c:when test="${list.contains(num)}">
															<button type="button" class="likeAddBtn"
																value="${store.st_num}">❤️</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="likeAddBtn"
																value="${store.st_num}">🤍</button>
														</c:otherwise>
													</c:choose>
												</div>
											</div>

										</div>

										<div class="name_reviewDiv">
											<!-- 가게 명 -->
											<div class="stName">${store.st_name}</div>

											<!-- 별점 평점(리뷰 수) -->
											<div class="startReviewDivs">
												<span>⭐${store.star_avg}</span>(${store.rv_count})
											</div>
										</div>
									</div>

								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- storeList end -->

				</div>
				<!-- resultStDiv end -->


				<!-- 더보기 버튼 -->
				<c:if test="${fn:length(searchList) > 30}">
					<div class="searchMore">
						<button type="button" id="searchMore" style="margin: auto;">검색
							결과 더보기</button>
					</div>
				</c:if>

			</div>
			<!-- mainDiv end -->



			<c:import url="compare_box.jsp"></c:import>

		</div>

		<c:import url="footer.jsp"></c:import>
	</form>
</body>
</html>