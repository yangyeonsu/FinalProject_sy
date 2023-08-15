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
<meta charset="UTF-8">
<title>compareView-beta.jsp</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/compareBox.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">


<style type="text/css">
body {
	font-family: 'IBM Plex Sans KR', sans-serif;
	margin: 0px;
	padding: 0px;
}

.mainBody {
	display: flex;
}

.likeAddBtn
{
	width: 20px;
    height: 20px;
    margin-right: 5px;
    padding-left: 2px;
    text-align: center;
    font-size: 11pt;
    background-color: transparent;
    border: none;
    color: white;
    cursor: pointer;
}

.compTitle {
	width: 15vw;
	height: 15vh;
	margin-left: 30vw;
}

.compTitle span {
	font-size: 3rem;
	font-weight: bold;
	text-align: center;
}

.compareMain {
	width: 100vw;
	margin-left: 3vw;
}

.compareBody {
	width: 63vw;
	/* margin-left: 18vw; */
	display: flex;
	text-align: center;
}

.compareSpace {
	width: 16.5vw;
}

.cCategory {
	margin-top: 28.65vh;
	width: 11vw;
}

.cList, .week, .lWeek, .cOptions, .lOptions {
	border-top: 1px solid #EB8F83;
	padding-top: 1vh;
	padding-bottom: 1vh;
}

.cName {
	font-size: 1.5rem;
	font-weight: bold;
}

.cBox {
	border-left: 1px solid #EB8F83;
}

.cList, .cLo {
	height: 3vh;
	font-size: 1rem;
	font-weight: bold;
	display: flex;
	text-align: center;
	justify-content: center;
	align-items: center;
}

.bt {
	font-size: 0.8rem !important;
}

.bottomL {
	border-bottom: 1px solid #ED8F83;
}

.ocTitle {
    font-size: 1rem !important;
}

.lDay {
    height: 2.48vh;
    font-size: 0.8rem;
    padding-top: 0.5vh;
    /* padding-bottom: 1.5vh; */
    font-weight: bold;
}

.lWeek {
	height: 35vh;
}

.lOptions, .cOptions {
	height: 30vh;
}

.cMenu {
	height: 10vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.cat {
	margin-top: 1vh;
}

.photo {
	margin-bottom: 1vh;
}

.phStore {
	width: 15vw;
	height: 20vh;
	padding-bottom: vh;
	padding: 1px;
}

.week {
	height: 35vh;
	padding-top: 1vh;
}

.cOpt {
	padding-top: 1.5vh;
	height: 2vh;
	font-size: 1rem;
	font-weight: bold;
	padding-bottom: 1.5vh;
	text-align: left;
	padding-left: 4vw;
}

.phMenu {
	max-width: 3.5vw;
	max-height: 3.5vw;
	object-fit: cover;
}

.menu {
	display: flex;
	align-items: center;
	justify-content: flex-start;
}
</style>


<!-- 배너 스크립트 -->
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
				$('.overlay').css("margin-top", "1.011vh");
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
				context: this,
				success : function(result)
				{
					$(this).html(result);
					
					if(result==='❤')
					{
						$(".clikeNum").html(${clikeNum+1});
					}
					
					if(result==='🤍')
					{
						$(".clikeNum").html(${clikeNum-1});
					}
					
				},
				error : function(e)
				{
					alert(e.responseText);
				}
			});
		});
	});
</script>

<!-- 해당 페이지 조정 스크립트 -->
<script type="text/javascript">
	/* 2개 비교할 경우  */
	$(document).ready(function()
	{
		var numOfStores = $(".compareBody .compareSpace").length;
		if (numOfStores == 2)
		{
			$(".compareBody").css(
			{
				"margin-left" : "10vw",
				"width" : "55vw"
			});
			$(".compTitle").css("margin-left", "31vw");
		}
		
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
						context: this,
						success : function(result)
						{
							$(this).html(result);
							
							if(result==='❤')
							{
								$(".clikeNum").html(${clikeNum+1});
							}
							
							if(result==='🤍')
							{
								$(".clikeNum").html(${clikeNum-1});
							}
							
						},
						error : function(e)
						{
							alert(e.responseText);
						}
					});
				});

				// 비교함에서 삭제
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

	});

	/* 영업 요일이 7주일 미만일 경우 
	$(document).ready(function()
	{

		var maxNumOfDays = 0;
		$(".week").each(function()
		{
			var numOfDays = $(this).find(".cDay").length;
			if (numOfDays > maxNumOfDays)
			{
				maxNumOfDays = numOfDays;
			}
		});

		$(".week").each(function()
		{
			//var numOfDays = $(this).find(".cDay").length; 
			if (maxNumOfDays == 6)
			{
				$(this).css("height", "29.5vh");
				$(this).css("padding-top", "0vh");
				$(".lWeek").css("height", "28.5vh");
			} else if (maxNumOfDays == 5)
			{
				$(this).css("height", "24.5vh");
				$(this).css("padding-top", "0vh");
				$(".lWeek").css("height", "23.5vh");
			} else if (maxNumOfDays == 4)
			{
				$(this).css("height", "19.5vh");
				$(this).css("padding-top", "0vh");
				$(".cList.cMenu").css("height", "18.73vh");
				$(".lWeek").css("height", "18.5vh");
			} else if (maxNumOfDays == 3)
			{
				$(this).css("height", "14.5vh");
				$(this).css("padding-top", "0vh");
				$(".cList.cMenu").css("height", "18.77vh");
				$(".lWeek").css("height", "13.5vh");
				$(".cList.cMenu").css("height", "18.75vh");
			} else if (maxNumOfDays == 2)
			{
				$(this).css("height", "10vh");
				$(this).css("padding-top", "0vh");
				$(".lWeek").css("height", "9vh");
				$(".cList.cMenu").css("height", "18.8vh");
				$(".cList.avgP").css("height", "2.95vh");
			} else if (maxNumOfDays == 1)
			{
				$(this).css("height", "5vh");
				$(this).css("padding-top", "0vh");
				$(".lWeek").css("height", "4.9vh");
				$(".lWeek").css("padding-top", "0vh");
				$(".lDay").css("padding-top", "1.5vh");
				$(".lWeek").css("padding-bottom", "1.1vh");
				$(".cList.cMenu").css("height", "18.75vh");
			} else if (maxNumOfDays == 0)
			{
				$(this).css("display", "none");
				$(".lWeek").css("display", "none");
				$(".cList.cMenu").css("height", "18.7vh");
			}
		});

	});
	 */

	/* 체크박스 여부 표시에 따른 높이 변화 */
	$(document).ready(function()
	{
		var maxOptNum = 0;

		// 값 = O/X 개수 - 'none' 개수 
		$(".cOptions").each(function()
		{
			var optNum = $(this).find(".cOpt").length;

			var yesNos = $(this).find(".chBox").filter(function()
			{
				return $(this).val() == "-";
			}).length;

			optNum = optNum - yesNos;

			if (optNum > maxOptNum)
			{
				maxOptNum = optNum;
			}
		});

		// 값에 따른 길이 변화
		$(".cOptions").each(function()
		{
			if (maxOptNum == 5)
			{
				$(this).css("height", "25vh");
				$("lOptions").css("height", "25vh");
			} else if (maxOptNum == 4)
			{
				$(this).css("height", "20vh");
				$("lOptions").css("height", "20vh");
			} else if (maxOptNum == 3)
			{
				$(this).css("height", "15vh");
				$("lOptions").css("height", "15vh");
			} else if (maxOptNum == 2)
			{
				$(this).css("height", "10vh");
				$("lOptions").css("height", "10vh");
			} else if (maxOptNum == 1)
			{
				$(this).css("height", "5vh");
				$("lOptions").css("height", "5vh");
			} else if (maxOptNum <= 0)
			{
				$(this).css("display", "none");
				$(".cList.lOptions").css("display", "none");
			}
		});
	});

	/* 받은 값에 따른 체크박스 변화 
	$(document).ready(function()
	{
		// value가 'none' 일 경우 표시 안 함
		$(".chBox").each(function()
		{
			var yesNo = $(this).val();

			if (yesNo == "○")
			{
				$(this).prop("checked", true);
				$(this).attr("disabled", true);
			} else if (yesNo == "Ⅹ")
			{
				$(this).prop("checked", false);
				$(this).attr("disabled", true);
			} else if (yesNo == "-")
			{
				$(this).parent(".cOpt").css("display", "none");
			}

		});
	});
	 */
</script>

</head>
<body>
<form method="post" id="userForm">
	<div class="header">
		<c:import url="/WEB-INF/view/header_user.jsp"></c:import>
	</div>

	<div class="mainBody">

		<c:import url="sideBar_user.jsp"></c:import>


		<div class="compareMain">

			<div class="compTitle">
				<span>비교해보기</span>
			</div>

			<div id="compareBody" class="compareBody">

				<div class="cCategory">
					<div class="cCat">
						<div id="stCatList" class="cList cat">가게 음식 카테고리</div>
						<div id="stStarAvgList" class="cList">가게 평균 별점</div>
						<div id="stLikeNumList" class="cList">가게 찜 수</div>
						<div id="stRvNumList" class="cList bottomL">가게 리뷰 수</div>
						<div id="sunList" class="lDay">&nbsp;&nbsp;</div>
						<div id="monList" class="lDay">&nbsp;&nbsp;</div>
						<div id="tueList" class="lDay">&nbsp;&nbsp;</div>
						<div id="wedList" class="ocTitle lDay">영업시간</div>
						<div id="thuList" class="lDay">&nbsp;&nbsp;</div>
						<div id="friList" class="lDay">&nbsp;&nbsp;</div>
						<div id="satList" class="lDay">&nbsp;&nbsp;</div>
						<div id="stBreakTimeList" class="cList">브레이크타임</div>

						<div id="stMenuAvgList" class="cList avgP">가게 평균 가격</div>
						<div id="stMenuNameList" class="cList cMenu">가게 대표 메뉴 이름</div>
						<div id="stMaxCList" class="cList">가게 최대 수용 인원</div>
						<div id="stCbList" class="cList lOptions">가게 옵션 유무</div>
					</div>
					<!-- cCat -->
				</div>

				<c:forEach var="tempstN" items="${stnumList }" varStatus="stnnumStatus">
					<c:set var="st_num" value="${tempstN }" />
					<div id="compareSpace" class="compareSpace">
						<c:forEach var="st" items="${store}" varStatus="st_status">
							<c:if test="${st.st_num == st_num }">
								<div id="stName${st_num }" class="cName">[ ${st.st_name} ]</div>
								<div id="stPhoto${st_num }" class="photo">
									<c:choose>
										<c:when test="${empty st.photo_link }">
											<img class="phStore" src="<%=cp%>/images/logo_text.png">
										</c:when>
										<c:otherwise>
											<img class="phStore" src="<%=cp %>/${st.photo_link}">
										</c:otherwise>
									</c:choose>
								</div>
								<div id="stAddr${st_num }" class="cLo">${st.st_location}</div>

								<div class="cBox">
									<div id="stCat${st_num }" class="cList cat">${st.food_name}</div>
									<div id="stStarAvg${st_num }" class="cList">⭐${st.star_avg}</div>
									<div id="stLikeNum${st_num }" class="cList likeBtnDiv">
										<c:set var="list" value="${userJjimList}" />
										<c:set var="num" value="${st_num}" />

										<c:choose>
											<c:when test="${list.contains(num)}">
												<button type="button" class="likeAddBtn"
													value="${st_num}">❤️</button>
												<span class="clikeNum">
													${clikeNumList.get(st_num) }
												</span>
											</c:when>
											<c:otherwise>
												<button type="button" class="likeAddBtn"
													value="${st_num}">🤍</button>
												<span class="clikeNum">
													${clikeNumList.get(st_num) }
												</span>
											</c:otherwise>
										</c:choose>

									</div>
									
									<div id="stRevieN${st_num }" class="cList bottomL">${st.rv_count}</div>
								</div>
							</c:if>
						</c:forEach>
						<!-- cBox -->
						<div class="cBox">
							<div class="opCl">
								<c:set var="dbstocItem" value="${dbstoc[stnnumStatus.index]}" />
								<c:choose>
									<c:when test="${fn:length(dbstocItem) < 1}">
										<c:forEach begin="0" end="7">
											<div>
												&nbsp;
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach var="opitem" items="${dbstocItem }">
											<c:if test="${opitem.st_num == st_num }">
												<div id="opWeek${st_num }" class="lDay">
													${opitem.day_name }&nbsp;&nbsp; ${opitem.operate_time}&nbsp;&nbsp;
													<c:choose>
														<c:when test="${opitem.holiday eq '휴무'}">
															휴무
														</c:when>
														<c:otherwise>
		
														</c:otherwise>
													</c:choose>
												</div>
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="cList bt">
								<c:forEach var="bt" items="${breakTimeList }">
									<c:if test="${bt.st_num == st_num }">
										
											[${bt.week_weekend }] &nbsp; : &nbsp;
											${bt.start_breaktime }&nbsp;~&nbsp;${bt.end_breaktime } &nbsp;&nbsp;
										
										<br>
									</c:if>
								</c:forEach>
							</div>

							<div class="cList">
								<c:forEach var="menuP" items="${menuAvgLists }">
									<c:if test="${menuP.st_num==st_num }">
										<fmt:formatNumber value="${menuP.price_avg}" pattern="#,###" /> 원
									</c:if>
								</c:forEach>
							</div>

							<div id="stMenu${st_num}" class="cList cMenu">
								<c:forEach var="menu" items="${menuLists }">
									<c:if test="${menu.st_num==st_num }">
										<div class="menu">
											<img class="phMenu" src="<%=cp %>/images/${menu.image_link}">
											&nbsp;&nbsp; ${menu.menu_name} &nbsp;&nbsp; ${menu.price} <br>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<c:forEach var="max" items="${store}">
								<c:if test="${max.st_num == st_num }">
									<div id="stMaxC${st_num }" class="cList bottomL">${max.max_customers}</div>
								</c:if>
							</c:forEach>

							<c:forEach var="sc" items="${stChekList}">
								<c:if test="${sc.st_num == st_num }">
									<div id="${st_num }_${sc.chbox_num}" class="cOpt">
										${sc.chbox_name} : ${sc.yesorno }</div>
								</c:if>
							</c:forEach>
						</div>
						<!-- cBox -->

					</div>
				</c:forEach>
			</div>
			<!-- compareBody -->

		</div>
		<!-- class = "compareMain" -->


		<c:import url="compare_box.jsp"></c:import>
	</div>
	<!-- mainBody -->

	<div class="footer">
		<c:import url="/WEB-INF/view/footer.jsp"></c:import>
	</div>
</form>
</body>
</html>