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
<title>userMyPage</title>


<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>


<link rel="stylesheet" type="text/css" href="<%=cp%>/css/user_main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">

<style type="text/css">
.continer {
	position: static;
}

.side-menu {
	/* top: 50px;
		width: 5vw;
		z-index: 10;
		background: #ef6351;
		border-right: 1px solid rgba(0, 0, 0, 0.07);
		height: 90%;
		margin-top: 8.2vh;
		position: fixed;
		align-items: center; */
	top: 50px;
	width: 5vw;
	z-index: 10;
	background: #ef6351;
	border-right: 1px solid rgba(0, 0, 0, 0.07);
	height: 90%;
	margin-top: 3.9vh;
	position: fixed;
}

.has_sub_menu {
	list-style-type: none;
}

#sidebar-menu li {
	font-size: 1.5rem;
}

#sidebar-menu .fas {
	padding-top: 3vh;
	padding-left: 1.2vw
}

.left_sub_menu {
	/* position: fixed;
		top: 50px;
		width: 18vw;
		z-index: 10;
		left: 5.07vw;
		background: white;
		height: 90%;
		margin-top: 5.7vh; */
	position: fixed;
	top: 50px;
	width: 18vw;
	z-index: 10;
	left: 5.07vw;
	background: white;
	height: 90%;
	margin-top: 3.9vh;
}

.sub_menu {
	margin-top: 2.2vh;
}

.left_sub_menu>.sub_menu li:hover {
	color: ff5858;
	background-color: #e1e1e1;
}

.left_sub_menu>.sub_menu li {
	color: black;
	font-size: 17px;
	font-weight: 600;
	padding: 20px 0px 8px 14px;
	border-bottom: 1px solid #e1e1e1;
}

.sub_menu>h2 {
	padding-bottom: 4px;
	border-bottom: 3px solid #797979;
	margin-top: 30px;
	font-size: 21px;
	font-weight: 600;
	color: #333;
	margin-left: 10px;
	margin-right: 10px;
	font-family: 'NotoKrB';
}

.fas {
	color: #ff5858;
	font-size: 20px;
	line-height: 20px;
	float: right;
	margin-top: 0.6vh;
	margin-right: 2vw;
}

.sub_menu>.big_menu>.small_menu li {
	color: black;
	font-size: 14px;
	font-weight: 600;
	border-bottom: 0px solid #e1e1e1;
}

.big_menu {
	list-style-type: none;
	cursor: pointer;
	/* 수정 */
	padding-left: 1vw;
}

.samll_menu {
	position: fixed;
	list-style-type: none;
	padding-inline-start: 0px;
	list-style: none;
	transition-duration: 0.5s;
}

.small_menuA {
	color: black;
	text-decoration-line: none;
	background-color: transparent;
	margin-bottom: 1vh
}

.big_menu ul {
	margin-top: 0;
	margin-bottom: 0;
}

.has_sub {
	width: 100%;
}
</style>

<script type="text/javascript">
	$(function()
	{
		$(".left_sub_menu").hide();
		$(".has_sub").click(function()
		{
			$(".left_sub_menu").fadeToggle(300);
			if ($('#checkOverlay').val() == "true")
			{
				$('.overlay').css("position", "fixed");
				$('.overlay').css("width", "0%");
				$('.overlay').css("height", "0%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "0");
				$('#checkOverlay').attr("value", "false");
			} else
			{
				$('.overlay').css("position", "fixed");
				$('.overlay').css("width", "100%");
				$('.overlay').css("height", "100%");
				$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
				$('.overlay').css("z-index", "3");
				/* 				$('.overlay').css("margin-top", "1.011vh"); */
				$('#checkOverlay').attr("value", "true");
			}

		});
		// 왼쪽메뉴 드롭다운
		$(".sub_menu ul.small_menu").hide();
		$(".sub_menu ul.big_menu").click(function()
		{
			$("ul", this).slideToggle(300);
		});
		// 외부 클릭 시 좌측 사이드 메뉴 숨기기
		$('.overlay').on('click', function()
		{
			$('.left_sub_menu').fadeOut();
			$('.overlay').css("position", "fixed");
			$('.overlay').css("width", "0%");
			$('.overlay').css("height", "0%");
			$('.overlay').css("background", "rgba(0, 0, 0, 0.7)");
			$('.overlay').css("z-index", "0");
			$('#checkOverlay').attr("value", "false");
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
					/* alert(data); */
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
				/* alert(result); */
				$(this).html(result);
			},
			error : function(e)
			{
				alert(e.responseText);
			}
		});

	});
</script>


</head>
<body>
	<form action="search.action" id="userForm" method="post">
		<div class="header">
			<c:import url="header_user.jsp"></c:import>
		</div>

		<div class="container">

			<div class="middle">

				<!-- 왼쪽 사이드 바 -->
				<div class="left side-menu">
					<div class="sidebar-inner">
						<div id="sidebar-menu">
							<ul class="has_sub_menu">
								<li class="has_sub"><a href="javascript:void(0);"
									class="waves-effect"> <i class="fas fa-bars"
										style="color: #fff"></i>
								</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-md-2" id="mleft">
					<div class="left_sub_menu">
						<div class="sub_menu">
							<h2>MENU</h2>
							<ul class="big_menu">
								<li>가게 리스트<i class="arrow fas fa-angle-right"></i></li>

								<ul class="small_menu">
									<li><a href="#" class="small_menuA">가게1</a></li>
									<li><a href="#" class="small_menuA">가게2</a></li>
									<li><a href="#" class="small_menuA">가게3</a></li>
									<li><a href="#" class="small_menuA">가게4</a></li>
								</ul>
							</ul>
							<ul class="big_menu">
								<li>접수 내역<i class="arrow fas fa-angle-right"></i></li>
								<ul class="small_menu">
									<li><a href="#" class="small_menuA">소메뉴2-1</a></li>
									<li><a href="#" class="small_menuA">소메뉴2-2</a></li>
								</ul>
							</ul>
							<ul class="big_menu">
								<li>경고 내역</li>
							</ul>
							<ul class="big_menu">
								<li>새로운 가게 등록 신청</li>
							</ul>
						</div>
					</div>
					<div class="overlay">
						<input type="hidden" id="checkOverlay" value="false">
					</div>
				</div>


				<!-- 가운데 마이 페이지 영역 -->
				<div class="col-md-8">
					<div class="mypage">마이 페이지</div>

					<!-- 개인 정보 영역 -->
					<div class="id">

						<div class="id1">
							<div class="title9">닉네임(아이디)</div>
							<div class="sub9">${user.user_nickname }(${user.user_id })</div>
						</div>
						<div class="id1">
							<div class="title9">등급</div>
							<div class="sub9">${user.user_grade }</div>
						</div>
						<div class="id1">
							<div class="title9">포인트</div>
							<div class="sub9">${user.point_sum}pt</div>
						</div>
						<div class="id1">
							<div class="title9">키워드</div>
							<div class="sub9">
								<c:forEach var="keyword" items="${usermp_ukeyword }">${keyword.ukeyword } </c:forEach>
							</div>
						</div>
					</div>

					<!-- 개인이 찜한 목록 -->
					<div class="jjimlist">
						<div class="ta">
							<div class="title">찜한가게 목록</div>
							<div class="ado" id="ado">
								<a href="" class="adoi">더보기+</a>
							</div>
						</div>

						<div class="jimlist">
							<c:choose>
								<c:when
									test="${fn:length(likelist) == 0 or fn:length(likelist) == null}">
									<p>
										찜한 가게가 존재하지 않습니다.<br> 마음에 드는 가게들을 찜해보세요.
									</p>
								</c:when>
								<c:otherwise>
									<c:forEach var="jjim" items="${likelist }">

										<div class="store">
											<!-- 가게 사진 + 찜, 비교함추가 -->
											<div class="stImgBtnDiv">
												<div class="stImgDiv">
													<button type="button" value="${jjim.st_num }"
														class="storeBtn"
														onclick="location.href='stDetail-userView.action?st_num=${jjim.st_num}'">
														<c:set var="photo" value="${jjim.photo_link }" />

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
														<c:set var="num" value="${jjim.st_num}" />

														<c:choose>
															<c:when test="${list.contains(num)}">
																<button type="button" class="likeAddBtn"
																	value="${jjim.st_num}">❤️</button>
															</c:when>
															<c:otherwise>
																<button type="button" class="likeAddBtn"
																	value="${jjim.st_num}">🤍</button>
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
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- .jimlist end -->
			</div>
			<!-- .jjimlist end -->


			<!-- 개인이 비교했던 가게목록 -->
			<div class="jjimlist">
				<div class="ta">
					<div class="title">찜한가게 목록</div>
					<div class="ado" id="ado">
						<a href="" class="adoi">더보기+</a>
					</div>
				</div>

				<div class="jimlist">
					<c:forEach var="store" items="${comparedlist }">
						<div class="jimstore">
							<div class="jimstoreImg">
								<img src="<%=cp %>/${store.photo_link }" class="jimstImg"
									alt="...">
							</div>
							<div class="jimstoreName">${store.st_name }</div>

						</div>
					</c:forEach>

				</div>
				<!-- .jimlist end -->
			</div>
			<!-- .jjimlist end -->



			<!-- 개인이 작성한 리뷰목록 -->
			<div class="stalist">
				<div class="ta">
					<div class="title">작성한 리뷰목록</div>
					<div class="ado">
						<a href="" class="adoi">더보기+</a>
					</div>
				</div>

				<div class="list0" id="list0">
					<div class="list1">Num</div>
					<div class="list1">가게명</div>
					<div class="list1">내용</div>
					<div class="list1">리뷰 작성 날짜</div>
				</div>
				<c:forEach var="review" items="${rvlist }">
					<div class="list0">
						<div class="list1">${review.rv_num }</div>
						<div class="list1">${review.st_num }</div>
						<div class="list1">${review.rv_content }</div>
						<div class="list1">${review.reg_date }</div>
					</div>
				</c:forEach>
			</div>
			<!-- .stalist end -->
		</div>
		<!-- .col-md-8 end -->


		<!-- 오른쪽 비교함 영역 -->
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
							test="${fn:length(comparingbox) == 0 or fn:length(comparingbox) == null}">
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
							<c:forEach var="store" items="${comparingbox }"
								varStatus="status">
								<div class="comStoreDiv">
									<!-- 한 가게 대표사진 영역 -->
									<div class="comStoreImgDiv">
										<button type="button" value="${store.st_num}"
											class="comDelete">X</button>
										<label for="${store.st_num }" class="stLabel"> <input
											type="checkbox" class="comStImgCB" id="${store.st_num }">
											<c:set var="photo" value="${store.photo_link }" /> <c:choose>
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
									<div class="comStoreNameDiv">${store.st_name }</div>
								</div>
							</c:forEach>
							<c:forEach begin="0" end="${10 - fn:length(comparingbox)}">
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
				<!-- .comStoreListDiv end -->
			</div>

			<!-- 비교하기 버튼 영역 -->
			<div class="comStoreBtnDiv">
				<button type="button" class="btn" id="comBtn" name="comBtn">비교하기</button>
			</div>

		</div>
		<!-- .compareDiv end -->



		</div>
		<!-- .middle end -->
		</div>
		<!-- container end -->

		<div class="footer">
			<c:import url="footer.jsp"></c:import>
		</div>


	</form>
</body>
</html>