<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main Page</title>

<!-- jquery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_main.css">

<script type="text/javascript">
	$(document).ready(function()
	{
		// 페이지 로드 시 뒤로가기 방지 함수 호출
		preventBack();
		
		$(".comAddBtn").click(function()
		{
			var st_num = $(this).val()
			
			var user_num = "<%=(String) session.getAttribute("user_num")%>"
			
			$.ajax(
			{
				url : "comparingInsert.action",
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
		
		/* 
		$(document).on("click", "button[name='add']", function () {
		    $("body").append("<button name='add'>+</button>");
		  }); */
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
						alert(data);
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
			alert($st_num);
			$user_num = "<%=(String) session.getAttribute("user_num")%>"
			
			$.ajax(
			{
				url : "jjimInsertDelete.action",
				type : 'post',
				data :
				{
					"st_num" : $st_num,
					"user_num" : $user_num
				},
				context: this,
				success : function(result)
				{
					alert(result);
					$(this).html(result);
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});

		});

		/* $(".storeBtn").click(function()
		{
			var value = $(this).val();
			
			$("#myForm").attr("method", "GET");
			$("#myForm").attr("action", "stDetail-userView.action?st_num="+value).submit();
			
		});
		 */
		 
		$("#searchBtn").click(function()
		{
			$("#mainForm").submit();
		});
	});
	
	/* function preventBack()
	{
	      history.pushState(null, null, location.href);
		      window.onpopstate = function(event)
		      {
		        history.go(1);
		      };
	} */

</script>


</head>

<body>
	<div id="buttonContainer"></div>
	<form action="search.action" id="mainForm" method="post">

		<c:import url="header_user.jsp"></c:import>

		<div class=container>
	
			<!-- 비교함 외의 영역 -->
			<div id="mainDiv">
			
				<!-- 메인로고 + 검색창 + 검색버튼 구역 -->
				<div id="searchArea">

					<!-- 메인로고 -->
					<div id="logoImgDiv">
					<button type="button" id="logoImgBtn" onclick="location.href='main.action'">
						<img id="logoImg" name="logoImg" class="Img"
							src="<%=cp%>/images/logo_text.png">
					</button>
					</div>
	
					<!-- 검색창 + 검색버튼 -->
					<div id="inputDiv">
						<!-- 검색창 -->
						<input type="text" id="typingArea" name="typingArea"
							class="insert" placeholder="검색어를 입력해주세요.">
						<!-- 검색버튼 -->
						<button type="button" id="searchBtn" name="searchBtn">
							<img id="searchIcon" src="<%=cp%>/images/search_icon.png">
						</button>
					</div>

				</div>
			


				<!-- 추천가게 구역 -->
				<div id="recommendStDiv">

					<!-- 요즘 뜨는 가게들 -->
					<div id="famousSt">
						<div class="recommendName">
							▼ <span>요즘 뜨는</span> 가게 추천
						</div>

						<!-- 가게 구역 -->
						<div class="storeList">
							<c:forEach var="hot" items="${hot_list}">
								<div class="store">
									<!-- 가게 사진 + 찜, 비교함추가 -->
									<div class="stImgBtnDiv">
										<div class="stImgDiv">
											<button type="button" value="${hot.st_num}" class="storeBtn"
												onclick="location.href='stDetail-userView.action?st_num=${hot.st_num}'">
												<c:set var = "photo" value="${hot.photo_link }"/>
									
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
											<button type="button" class="comAddBtn" value="${hot.st_num}">+</button>

											<div class="likeBtnDiv">
												<c:set var="list" value="${userJjimList}" />
												<c:set var="num" value="${hot.st_num}" />
	
												<c:choose>
													<c:when test="${list.contains(num)}">
														<button type="button" class="likeAddBtn"
															value="${hot.st_num}">❤️</button>
													</c:when>
													<c:otherwise>
														<button type="button" class="likeAddBtn"
															value="${hot.st_num}">🤍</button>
													</c:otherwise>
												</c:choose>
											</div>
										</div>

									</div>

									<div class="name_reviewDiv">
										<!-- 가게 명 -->
										<div class="stName">${hot.st_name }</div>

										<!-- 별점 평점(리뷰 수) -->
										<div class="startReviewDivs">
											<span>⭐${hot.star_avg }</span>(${hot.rv_count })
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- storeList end -->
					</div>

					<!-- 찜기반 추천 -->
					<div id="personalLike">

						<div class="recommendName">
							▼ <span>찜</span>에 기반을 둔 추천
						</div>

						<!-- 가게 구역 -->
						<div class="storeList">
							<c:choose>
								<c:when
									test="${fn:length(jjim_list) == 0 or fn:length(jjim_list) == null}">
									<p>
										찜한 가게가 존재하지 않습니다.<br> 마음에 드는 가게들을 찜해보세요.
									</p>
								</c:when>
								<c:otherwise>
									<c:forEach var="jjim" items="${jjim_list }">

										<div class="store">
											<!-- 가게 사진 + 찜, 비교함추가 -->
											<div class="stImgBtnDiv">
												<div class="stImgDiv">
													<button type="button" value="${jjim.st_num }"
														class="storeBtn"
														onclick="location.href='stDetail-userView.action?st_num=${jjim.st_num}'">
														<c:set var = "photo" value="${jjim.photo_link }"/>
														
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
														value="${jjim.st_num }">+</button>

													<div class="likeBtnDiv">
														<c:set var="list" value="${userJjimList}" />
														<c:set var="num" value="${hot.st_num}" />
			
														<c:choose>
															<c:when test="${list.contains(num)}">
																<button type="button" class="likeAddBtn"
																	value="${hot.st_num}">❤️</button>
															</c:when>
															<c:otherwise>
																<button type="button" class="likeAddBtn"
																	value="${hot.st_num}">🤍</button>
															</c:otherwise>
														</c:choose>
													</div>
												</div>

											</div>

											<div class="name_reviewDiv">
												<!-- 가게 명 -->
												<div class="stName">${jjim.st_name }</div>

												<!-- 별점 평점(리뷰 수) -->
												<div class="startReviewDivs">
													<span>⭐${jjim.star_avg }</span>(${jjim.rv_count })
												</div>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- storeList end -->
					</div>


					<!-- 입맛키워드기반 추천 -->
					<div id="personalIbmatDiv">
						<div class="recommendName fa-solid">
							▼ <span>입맛</span>에 기반을 둔 추천
						</div>

						<!-- 가게 구역 -->
						<div class="storeList">
							<c:choose>
								<c:when
									test="${fn:length(ibamt_list) == 0 or fn:length(ibamt_list) == null}">
									<p>
										선택된 추천 받고 싶은 입맛이 존재하지 않습니다.<br> 정보 수정 페이지에서 추천 받고 싶은 입맛을
										선택해 주세요.
									</p>
								</c:when>
								<c:otherwise>
									<c:forEach var="ibmat" items="${ibmat_list }">

										<div class="store">
											<!-- 가게 사진 + 찜, 비교함추가 -->

											<div class="stImgBtnDiv">
												<div class="stImgDiv">
													<button type="button" value="${ibmat.st_num }"
														class="storeBtn"
														onclick="location.href='stDetail-userView.action?st_num=${ibmat.st_num}'">
														<c:set var = "photo" value="${ibmat.photo_link }"/>
														
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
														value="${ibmat.st_num }">+</button>

													<div class="likeBtnDiv">
														<c:set var="list" value="${userJjimList}" />
														<c:set var="num" value="${hot.st_num}" />
			
														<c:choose>
															<c:when test="${list.contains(num)}">
																<button type="button" class="likeAddBtn"
																	value="${hot.st_num}">❤️</button>
															</c:when>
															<c:otherwise>
																<button type="button" class="likeAddBtn"
																	value="${hot.st_num}">🤍</button>
															</c:otherwise>
														</c:choose>
													</div>
												</div>

											</div>

											<div class="name_reviewDiv">
												<!-- 가게 명 -->
												<div class="stName">${ibmat.st_name }</div>

												<!-- 별점 평점(리뷰 수) -->
												<div class="startReviewDivs">
													<span>⭐${ibmat.star_avg }</span>(${ibmat.rv_count })
												</div>
											</div>
										</div>

									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
						<!-- storeList end -->
					</div>
					<!-- personalIbmatDiv end -->

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
												type="checkbox" class="comStImgCB" id="${com.st_num}">
												<c:set var = "photo" value="${com.photo_link }"/>
												
												<c:choose>
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
										<div class="comStoreNameDiv">${com.st_name}</div>
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
				</div>

				<div class="comStoreBtnDiv">
					<button type="button" class="btn" id="comBtn" name="comBtn">비교하기</button>
				</div>

			</div>

		</div>

		<c:import url="footer.jsp"></c:import>

	</form>
</body>
</html>