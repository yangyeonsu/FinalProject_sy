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
<title>compareView.jsp</title>

<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/compareBox.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">


<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>


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


.compareMain
{	
	width : 70vw;
}

.compBody
{	
	display: flex;
	margin-left: 8.5vw;
}

.compare
{
	/* background-color : red; */
	margin-left: 1.5vw;
	margin-top: 2vw;
	margin-bottom: 2vw;
	margin-top: 3vh;
}

.cLists1
{
	text-align: center;
}

.cList
{
	width: 22vw;
	list-style: none;
	border-top: 1px solid #EF6351;
}

.cOption
{
	width: 22vw;
	height: 20vh;
	list-style: none;
	border-top: 1px solid #EF6351;
}

.cName
{
	width: 22vw;
	list-style: none;
}

.cImages
{	
	width: 22vw;
	list-style: none;
	border-top: 1px solid #EF6351;
}

.cImages0, .cImages1
{
	height: 40vh;
}

.cName0 div, .cList0 div, .cOption0 div, .cImages0 div, .cImages0 div
{
	font-size: 2rem; font-weight: bold; margin-top: 1vh; margin-left: 1vw;
}

.img-rounded
{	
	margin-left : 2vw;
	width: 15vw;
	height: 15vh;
}

.cName1
{
	background-color: #FABF9D;
}

.cName1, .cList1, .cOption1
{
	border-left: 1px solid #EF6351;
}

.cList1, .cOption1, .cImages1 div, .cImages1
{
	background-color: #F7F4EA;
}

.compare0
{
	width: 10vw;
}

.compare0 li
{
	height: 13vh;
}

.compare1, .compare2, .compare3
{
	width: 20vw;
} 

.compare1 li, .compare2 li, .compare3 li
{
	height: 13vh;
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



</head>
<body>

<div class="header">
		<c:import url="/WEB-INF/view/header_user.jsp"></c:import>
</div>


	<div class="compareBody" style="display: flex; width: 80vw;">
		
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
			
			<div class="compTitle" style="width: 15vw; height: 15vh; margin-left: 44vw;">
				<span style="font-size: 3rem; font-weight: bold; text-align: center;">비교하기</span>
			</div>			
			
			
			<div class="compBody">
			
					<div class="compare0 compare">
						
						<div class="compContent">
							<div class="cLists0">
								<ul>
									<li class="cName cName0"><div>가게명</div></li>
									<li class="cList cList0"><div>카테고리</div></li>
									<li class="cList cList0"><div>주소</div></li>
									<li class="cList cList0"><div>평점</div></li>
									<li class="cList cList0"><div>리뷰수</div></li>
									<li class="cList cList0"><div>영업시간</div></li>
									<li class="cList cList0"><div>메뉴 <br /> 평균가격</div></li>
									<li class="cOption cOption0"><div>옵션's 유무</div></li>
									<li class="cImages cImages0"><div>대표메뉴</div></li>
								</ul>
							</div>
						</div>
					
					</div>
					
					
					<div class="compare1 compare"> 
					
						<div class="compStore1">
							
							<div class="compContent">
								<div class="cLists1">
									<ul>
										<li class="cName cName1"><div>가게1</div></li>
										<li class="cList cList1"><div>카테고리</div></li>
										<li class="cList cList1"><div>주소</div></li>
										<li class="cList cList1"><div>평점</div></li>
										<li class="cList cList1"><div>리뷰수</div></li>
										<li class="cList cList1"><div>영업시간</div></li>
										<li class="cList cList1"><div>메뉴 <br /> 평균가격</div></li>
										<li class="cOption cOption1"><div>옵션's 유무</div></li>
										<li class="cImages cImages1">대표메뉴<div>
											<a class="cImage"> <img src="images/store_img01.png"
											alt="..." class="img-rounded"></a>
										</div></li>
									</ul>
								</div>
							</div>
							
						</div>	
								
					</div>
					
					
					<div class="compare2 compare">
					
						<div class="compStore2">
						
							<div class="compContent">
								<div class="cLists1">
									<ul>
										<li class="cName cName1"><div>가게2</div></li>
										<li class="cList cList1"><div>카테고리</div></li>
										<li class="cList cList1"><div>주소</div></li>
										<li class="cList cList1"><div>평점</div></li>
										<li class="cList cList1"><div>리뷰수</div></li>
										<li class="cList cList1"><div>영업시간</div></li>
										<li class="cList cList1"><div>메뉴 <br /> 평균가격</div></li>
										<li class="cOption cOption1"><div>옵션's 유무</div></li>
										<li class="cImages cImages1">대표메뉴<div>
											<a class="cImage"> <img src="images/store_img01.png"
											alt="..." class="img-rounded"></a>										
										</div></li>
									</ul>
								</div>
							</div>
						
						</div>	
								
					</div>
					
					
					<div class="compare3 compare">
					
						<div class="compStore3">
						
							<div class="compContent">
								<div class="cLists1">
									<ul>
										<li class="cName cName1"><div>가게3</div></li>
										<li class="cList cList1"><div>카테고리</div></li>
										<li class="cList cList1"><div>주소</div></li>
										<li class="cList cList1"><div>평점</div></li>
										<li class="cList cList1"><div>리뷰수</div></li>
										<li class="cList cList1"><div>영업시간</div></li>
										<li class="cList cList1"><div>메뉴 <br /> 평균가격</div></li>
										<li class="cOption cOption1"><div>옵션's 유무</div></li>
										<li class="cImages cImages1">대표메뉴<div>
											<a class="cImage"> <img src="images/store_img01.png"
											alt="..." class="img-rounded"></a>										
										</div></li>
									</ul>
								</div>
							</div>	
											
						</div>		
						
					</div>
			
			</div> <!-- compBody -->
			
		</div>
			
		
		
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
		
	</div>


<div class="footer">
		<c:import url="/WEB-INF/view/footer.jsp"></c:import>
</div>
</body>
</html>