<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/compareBox.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">


<!-- 배너 CSS -->
<style type="text/css">
<!--  배너 -->
.has_sub_menu
{
	list-style-type: none;
}

.side-menu 
{
	top: 50px;
	width: 5vw;
	z-index: 10;
	background: #ef6351;
	border-right: 1px solid rgba(0, 0, 0, 0.07);
	height: 90%;
	margin-top: 5.7vh;
	position: fixed;
	align-items: center;
}

#sidebar-menu li 
{
	font-size: 1.5rem;
}

#sidebar-menu .fas 
{
	padding-top: 3vh;
	padding-left: 1.2vw
}

.left_sub_menu 
{
	position: fixed;
	top: 50px;
	width: 18vw;
	z-index: 10;
	left: 4.6vw;
	background: white;
	height: 90%;
	margin-top: 5.7vh;
}

.sub_menu 
{
	margin-top: 50px;
}

.left_sub_menu>.sub_menu li:hover 
{
	color: ff5858;
	background-color: #e1e1e1;
}

.left_sub_menu>.sub_menu li 
{
	color: black;
	font-size: 17px;
	font-weight: 600;
	padding: 20px 0px 8px 14px;
	border-bottom: 1px solid #e1e1e1;
}

.sub_menu>h2 
{
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

.fas 
{
	color: #ff5858;
	font-size: 20px;
	line-height: 20px;
	float: right;
	margin-top: 0.6vh;
	margin-right: 2vw;
}

.sub_menu>.big_menu>.small_menu li 
{
	color: black;
	font-size: 14px;
	font-weight: 600;
	border-bottom: 0px solid #e1e1e1;
}

.big_menu 
{
	list-style-type: none;
	cursor: pointer;
}

.samll_menu 
{
	position: fixed;
	list-style-type: none;
	padding-inline-start: 0px;
	list-style: none;
	transition-duration: 0.5s;
}

.small_menuA 
{
	color: black;
	text-decoration-line: none;
	background-color: transparent;
	margin-bottom: 1vh
}

.big_menu ul 
{
	margin-top: 0;
	margin-bottom: 0;
}

.has_sub 
{
	width: 100%;
}
<!--  배너  -->
</style>

<!-- 해당 페이지 CSS -->
<style type="text/css">
.mainBody
{
	display: flex;
}

.compTitle
{
	width: 15vw; height: 15vh; margin-left: 50vw;
}

.compTitle span
{
	font-size: 3rem; font-weight: bold; text-align: center;
}

.compareMain
{
	width: 100vw;
}

.compareBody
{	
	width: 70vw;
	margin-left: 11vw;
	display: flex;
	text-align: center;
}

.cCategory
{	
	margin-top: 28.84vh;
	width: 20vw;
}

.Category div
{
	width: 15vw;
}

.cName, .cList, .week, .phMenu, .phStore
{
	padding-right : 2vw;
	padding-left: 2vw;
}

.cList, .week, .lCat, .lWeek
{
	border-top: 1px solid #EB8F83;
	padding-top: 1vh;
	padding-bottom: 1vh;
}

.cName
{	
	width: 13vw;
	font-size: 1.5rem; font-weight: bold;
}

.cBox
{
	border-left: 1px solid #EB8F83;
}

.cList, .cLo
{
	height: 3vh;
	font-size: 1rem; font-weight: bold;
}

.lCat, .lDay
{
	height: 3vh;
	font-size: 1rem; font-weight: bold;
	padding-top: 3vh;
	padding-bottom: 1.5vh;
}

.lWeek
{
	height: 36vh;
	padding-bottom: 6vh;
}

.lavgP
{
	height: 18.75vh;
}

.cat
{
	margin-top: 1vh;
}

.photo1
{
	margin-bottom: 1vh;
}

.phStore
{
	width: 15vw;
	height: 20vh;
	padding-bottom: vh;
	padding: 1px;
}

.week
{	
	height: 36vh;
	padding-top : 1vh;
	padding-bottom: 6vh;
}

.cDay
{
	padding-top: 2vh;
	height: 2vh;
	font-size: 1rem; font-weight: bold;
	padding-bottom: 2vh;
}

.phMenu
{
	width: 13.5vw;
	height: 15vh;
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
	});
	
</script>

<!-- 해당 페이지 조정 스크립트 -->
<script type="text/javascript">

 /* 2개 비교할 경우  */
$(document).ready(function() 
{
    var numOfStores = $(".compareBody .compareSpace").length;
    if(numOfStores == 2) 
    {
       $(".compareBody").css({"margin-left" : "18vw", "width" : "60vw"});
       $(".compTitle").css("margin-left", "42vw");
    }
});

 
/* 영업 요일이 7주일 미만일 경우  */
$(document).ready(function() 
{
    $(".week").each(function()
    {
        var numOfDays = $(this).find(".cDay").length;
        if(numOfDays == 6)
        {
            $(this).css("height", "34vh");
            $(this).css("padding-bottom", "1.5vh");
            $(this).css("padding-top", "0vh");
            $(".lWeek").css("height", "28.5vh");
        }
        else if(numOfDays == 5)
        {
            $(this).css("height", "29vh");
            $(this).css("padding-bottom", "1.5vh");
            $(this).css("padding-top", "0vh");
            $(".lWeek").css("height", "23.5vh");
        }
        else if(numOfDays == 4)
        {
            $(this).css("height", "24vh");
            $(this).css("padding-bottom", "1.5vh");
            $(this).css("padding-top", "0vh");
            $(".cList.lavgP").css("height", "18.73vh");
            $(".lWeek").css("height", "18.5vh");
        }
        else if(numOfDays == 3)
        {
            $(this).css("height", "15vh");
            $(this).css("padding-bottom", "1.5vh");
            $(this).css("padding-top", "0vh");
            $(".cList.lavgP").css("height", "18.77vh");
            $(".lWeek").css("height", "9.5vh");
            $(".cList.lavgP").css("height", "18.75vh");
        }
        else if(numOfDays == 2)
        {
            $(this).css("height", "12vh");
            $(this).css("padding-bottom", "0vh");
            $(this).css("padding-top", "1.5vh");
            $(".lWeek").css("height", "6.5vh");
            $(".cList.lavgP").css("height", "18.7vh");
        }
        else if(numOfDays == 1)
        {
            $(this).css("height", "5vh");
            $(this).css("padding-bottom", "0vh");
            $(this).css("padding-top", "0vh");
            $(".lWeek").css("height" , "3.9vh");
            $(".lWeek").css("padding-top", "0vh");
            $(".lDay").css("padding-top", "1.5vh");
            $(".lWeek").css("padding-bottom", "1.1vh");
            $(".cList.lavgP").css("height", "18.75vh");
        }
        else if(numOfDays == 0)
        {
            $(this).css("display", "none");
            $(".lWeek").css("display", "none");
        }
    });
});

</script>

</head>
<body>
<div class="header">
		<c:import url="/WEB-INF/view/header_user.jsp"></c:import>
</div>
<%-- 
<div id="여기가 큰 비교 틀 & 포문으로 들어갈 공간">

   <c:forEach var="store" items = "${불러온 비교할 가게 리스트 }">
      <div id="비교하는 가게 공간">
         <div id="비교하는 가게 이름">
            ${store.st_name};
         </div>
         <div id="비교하는 가게 대표 사진">
            <img id="가게 대표사진" src = "<%=cp %>/${store.photo_link}">
         </div>
         <div>
            : 여러 항목들
         </div>
      </div>
   </c:forEach>

</div>
--%>

<div class="mainBody">
	
	<!-- 왼쪽 메뉴 배너 -->
	<div class="left_column">
		<!-- 왼쪽 메뉴 -->
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
	
		<!-- 왼쪽 서브 메뉴 -->
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
					<li>새로운 가게 등록 신청</i></li>
				</ul>
			</div>
		</div>
		
		<div class="overlay">
			<input type="hidden" id="checkOverlay" value="false">
		</div>
	</div>
	
	
	<div class="compareMain">
		
		<div class="compTitle">
			<span>비교하기</span>
		</div>
		
		<div id="여기가 큰 비교 틀 & 포문으로 들어갈 공간" class="compareBody">
		
			<div class="cCategory">
				<div class="cCat">
			         <div id="가게 음식 카테고리" class="cList cat">
			             가게 음식 카테고리
			         </div>
			         <div id="가게 평균 별점" class="cList">
			         	가게 평균 별점
			         </div>
			         <div id="가게 리뷰 수" class="cList">
			         	 가게 리뷰 수
			         </div>
			         <div id="가게 주" class="lWeek">
				       <div id="일요일" class="lDay">
				         영업 일/시간
				       </div>
				     </div>
			         <div id="가게 평균 가격" class="cList lavgP">
			         	 가게 평균 가격
			         </div>
			         <div id="가게 대표 메뉴 이름" class="cList">
			         	 가게 대표 메뉴 이름
			         </div>
			         <div id="가게 최대 수용 인원" class="cList">
			         	 가게 최대 수용 인원
			         </div>
		         </div> <!-- cCat -->
			</div>
			
		   <%-- <c:forEach var="store" items = "${불러온 비교할 가게 리스트 }"> --%>
		   <c:forEach begin="1"  end="2"  varStatus="store">
		      <div id="비교하는 가게 공간" class="compareSpace">
		         <div id="비교하는 가게 이름" class="cName">
		            ${store.index} 비교하는 가게 이름
		         </div>
		         <div id="비교하는 가게 대표 사진" class="photo1">
		            <img id="가게 대표사진" class="phStore" src = "<%=cp %>/images/store_img01.png">
		         </div>
		         <div id="가게 주소" class="cLo">
			         	${store.index} 가게 주소
			     </div>
		         
		         <div class="cBox">
			         <div id="가게 음식 카테고리" class="cList cat">
			            ${store.index} 가게 음식 카테고리
			         </div>
			         <div id="가게 평균 별점" class="cList">
			         	${store.index} 가게 평균 별점
			         </div>
			         <div id="가게 리뷰 수" class="cList">
			         	${store.index} 가게 리뷰 수
			         </div>
			         <div id="가게 주" class="week">
				         <div id="일요일" class="cDay">
				         	${store.index} 일요일  10:00 ~ 24:00
				         </div>
				         <div id="월요일" class="cDay">
				         	${store.index} 월요일  10:00 ~ 24:00 
				         </div>
				         <div id="화요일" class="cDay">
				         	${store.index} 화요일  10:00 ~ 24:00
				         </div>
				         <div id="수요일" class="cDay">
				         	${store.index} 수요일  10:00 ~ 24:00
				         </div> 
				         <div id="목요일" class="cDay">
				         	${store.index} 목요일  10:00 ~ 24:00
				         </div>
				         <div id="금요일" class="cDay">
				         	${store.index} 금요일  10:00 ~ 24:00
				         </div>  
				         <div id="토요일" class="cDay">
				         	${store.index} 토요일  10:00 ~ 24:00
				         </div>
				     </div>
			         <div id="가게 평균 가격" class="cList">
			         	${store.index} 가게 평균 가격
			         </div>
			         <div id="가게 대표 메뉴 이미지" class="photo2">
			         	<img id="가게 대표사진" class="phMenu" src = "<%=cp %>/images/store_img01.png">
			         </div>
			         <div id="가게 대표 메뉴 이름" class="cList">
			         	${store.index} 가게 대표 메뉴 이름
			         </div>
			         <div id="가게 최대 수용 인원" class="cList">
			         	${store.index} 가게 최대 수용 인원
			         </div>
		         </div> <!-- cBox -->
		         
		      </div>
		   </c:forEach>
	   </div> <!-- compareBody -->
	   
	</div><!-- class = "compareMain" -->
	
	
	<!-- 비교함 영역 -->
	<div id="compareDiv">
		<div class="rectDiv">
			<!-- 비교함 이름 영역 -->
			<div class="comNameDiv">
				<span style="font-color: #ef6351">비교함</span>
			</div>
			<!-- 비교함 담은 가게 리스트 영역 -->
			<div class="comStoreListDiv">
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<input type="checkbox" class="comStImgCB" id="st1"> <img
							class="comStImg" src="<%=cp%>/images/store_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">가게1</div>
				</div>
	
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<input type="checkbox" class="comStImgCB" id="st2"> <img
							class="comStImg" src="<%=cp%>/images/store_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">가게2</div>
				</div>
	
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<input type="checkbox" class="comStImgCB" id="st3"> <img
							class="comStImg" src="<%=cp%>/images/store_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">가게3</div>
				</div>
	
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<input type="checkbox" class="comStImgCB" id="st4"> <img
							class="comStImg" src="<%=cp%>/images/store_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">가게4</div>
				</div>
	
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<input type="checkbox" class="comStImgCB" id="st5"> <img
							class="comStImg" src="<%=cp%>/images/store_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">가게5</div>
				</div>
	
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<input type="checkbox" class="comStImgCB" id="st6"> <img
							class="comStImg" src="<%=cp%>/images/store_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">가게6</div>
				</div>
	
	
			</div>
		</div>
	
		<div class="comStoreBtnDiv">
			<button type="button" class="btn" id="comBtn" name="comBtn">비교하기</button>
		</div>
	</div>

</div><!-- mainBody -->

<div class="footer">
		<c:import url="/WEB-INF/view/footer.jsp"></c:import>
</div>
</body>
</html>