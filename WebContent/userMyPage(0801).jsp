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
<title>userMyPage</title>


<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/compareBox(0801).css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage(0801).css">

<style type="text/css">
	.continer{
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
</script>


</head>
<body>

	<div class="header">
		<c:import url="header_user_sh(0801).jsp"></c:import>
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
							<div class="sub9"><c:forEach var="id" items="${usermp_ni }">${id.nickname }(${id.userid })</c:forEach></div>
						</div>
						<div class="id1">
							<div class="title9">등급</div>
							<div class="sub9"><c:forEach var="grade" items="${usermp_grade }">${grade.grade }</c:forEach></div>
						</div>
						<div class="id1">
							<div class="title9">포인트</div>
							<div class="sub9"><c:forEach var="id" items="${usermp_point }">${point.point }</c:forEach>pt</div>
						</div>
						<div class="id1">
							<div class="title9">키워드</div>
							<div class="sub9"><c:forEach var="keyword" items="${usermp_ukeyword }">${keyword.ukeyword }</c:forEach> </div>
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
						<c:forEach var="jjim" items="${usermp_likelist }">
						<div class="jimstore">
							<div class="jimstoreImg">
								<img src="${jjimphoto }" class="jimstImg" alt="...">
							</div>
							<div class="jimstoreName">
								${jjim.jjimstname }
							</div>
						</div>
						</c:forEach>
						
					</div><!-- .jimlist end -->
				</div><!-- .jjimlist end -->


				<!-- 개인이 비교했던 가게목록 -->
				<div class="jjimlist">
					<div class="ta">
						<div class="title">비교했던 가게목록</div>
						<div class="ado" id="ado">
							<a href="" class="adoi">더보기+</a>
						</div>
					</div>

					<div class="jimlist">
						<c:forEach var="rgstli" items="${usermp_risonstlist }">
							<div class="jimstore">
								<div class="jimstoreImg">
									<img src="${rgstli.cbphoto }" class="jimstImg" alt="...">
								</div>
								<div class="jimstoreName">
									${rgstli.cblstname }
								</div>
								
							</div>
						</c:forEach>
					</div><!-- .jimlist end -->
				</div>
				<!-- .stalist end -->
				
				
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
					<c:forEach var="rvlist" items="${usermp_rvlist }">
						<div class="list0">
							<div class="list1">${rvlist.rvnum }</div>
							<div class="list1">${rvlist.rvstname }</div>
							<div class="list1">${rvlist.rvcontent }</div>
							<div class="list1">${rvlist.rbregdate }</div>
						</div>
					</c:forEach>
				</div><!-- .stalist end -->
			</div><!-- .col-md-8 end -->
			
			
			<!-- 오른쪽 비교함 영역 -->
			<div id="compareDiv">
				<!-- 비교함 이름 영역 -->
				<div class="comNameDiv">
					<span>비교함</span>
				</div>

				<!-- 비교함 담은 가게 리스트 영역 -->
				<div class="comStoreListDiv">

					<!-- 한 가게 영역 -->
					<c:forEach var="rgst" items="${usermp_compare_box }">
					<div class="comStoreDiv">
						<!-- 한 가게 대표사진 영역 -->
						<div class="comStoreImgDiv">
							<label for="st1" class="stLabel"> <input type="checkbox"
								class="comStImgCB" id="st1"> <!-- <span class="circle"></span> -->
								<img class="comStImg" src="<%=cp%>/${rgst.cbphoto }">
							</label>
						</div>
						<!-- 한 가게 가게이름 영역 -->
						<div class="comStoreNameDiv">${rgst.cbstname }</div>
					</div>
					</c:forEach>

				</div><!-- .comStoreListDiv end -->

				<!-- 비교하기 버튼 영역 -->
				<div class="comStoreBtnDiv">
					<button type="button" class="btn" id="comBtn" name="comBtn">비교하기</button>
				</div>
			</div><!-- .compareDiv end -->
		
		
		</div><!-- .middle end -->
	</div><!-- container end -->

	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>



</body>
</html>