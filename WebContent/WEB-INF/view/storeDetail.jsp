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
<meta charset="UTF-8">
<title>storeDetail-userView.jsp</title>


<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/compareBox.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/userMyPage.css">


<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
#body {
	width: 100%;
	display: flex;
}

.mainBody {
	background-color: #F7F4EA;
	margin-left: 20vw;
	width: 60vw;
}

.main {
	padding-top: 2vh;
}

.container1 {
	float: left;
}

.main-left {
	width: 50%;
	height: 40vh;
	float: left;
	text-align: center;
}

.main-right {
	width: 50%;
	height: 40vh;
	float: right;
	text-align: center;
}

.opli, .btli {
	border: 2vw;
	width: 10vw;
	height: 3vh;
}

#weekList li, .time li {
	padding-bottom: 0.5vw;
	padding-right: 0.5vw;
	padding-left: 0.5vw;
	padding-top: 0.5vw;
	list-style: none;
	border-radius: 11px;
}

.revKeyList li {
	padding-bottom: 0.3vw;
	padding-top: 0.3vw;
	background-color: #F8E6E0;
	border: 1px solid #F781BE;
	margin: 0.5vw;
	border-radius: 11px;
	list-style: none;
}

.revKeyList input {
	background: none;
	border: 0;
	list-style: none;
}

.openclose {
	width: 50%;
	float: left;
}

.time {
	width: 50%;
	float: left;
	text-align: center;
}

.btli {
	text-align: center;
}

.container2 {
	margin-top: 20vh;
	margin-left: 4vw;
}

.info {
	width: 100%;
	height: 50%;
	display: flex;
	padding-right: 2vw;
	text-align: left;
	margin: 1vw;
}

.info input, textarea {
	width: 35vw;
	height: 4vh;
	background-color: #F8E6E0;
	border: 0;
}

.container3, .container4 {
	width: 100%;
	float: left;
	margin-top: 3vh;
}

.container3 {
	padding-left: 0.2vw;
}

.thumbnail {
	width: 10vw;
	height: 17vh;
	float: left;
}

.img-rounded {
	width: 100%;
	height: 100%;
}

.main ul {
	list-style-type: none;
}

.menu {
	display: flex;
	justify-content: space-evenly;
	padding-right: 5vw;
	padding-left: 5vw;
}

.form {
	padding-left: 3vw;
}

.revBoard {
	padding-left: 2vw;
}

.menuList {
	display: flex;
	margin-left: 3vw;
}

.menuPhoto {
	padding: 1vw;
}

.revBack {
	width: 90%;
	height: 14vh;
	background-color: #EED2CE;
	border-radius: 11px;
}

.btn {
	background-color: #F7AF97;
	border: 1px #EF6351;
	border-radius: 8px;
	color: white;
	font-size: 10pt;
	font-family: 'IBM Plex Sans KR', sans-serif;
	cursor: pointer;
}

#repCon {
	float: right;
}

.reViews {
	padding-bottom: 2vh;
}

.recBtn {
	float: right;
}

.has_sub_menu {
	list-style-type: none;
}

.side-menu {
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

#sidebar-menu li {
	font-size: 1.5rem;
}

#sidebar-menu .fas {
	padding-top: 3vh;
	padding-left: 1.2vw
}

.left_sub_menu {
	position: fixed;
	top: 50px;
	width: 18vw;
	z-index: 10;
	left: 4.6vw;
	background: white;
	height: 90%;
	margin-top: 5.7vh;
}

.sub_menu {
	margin-top: 50px;
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
	<form action="search.action" id="userForm" method="post">
		<div class="header">
			<c:import url="header_user.jsp"></c:import>
		</div>

		<div id="body">

			<div id="column">

				<!-- 왼쪽 메뉴 배너 -->
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


			<div class="mainBody">

				<div id="container1" class="">

					<div class="placeholders main">

						<div class="placeholder main-left">
							<div class="background"
								style="font-weight: bold; margin-top: 1vh;">
								<span style="font-size: 30pt;">영업 시간</span><br /> <br /> <br />

								<div id="weekList" class="openclose background">

									<ul>
										<c:forEach var="op" items="${openClose}">
											<li><input class="opli" type="text"
												style="text-align: center;"
												placeholder="${op.day_name} ${op.start_time}:00 ~ ${op.end_time}:00"
												readonly="readonly" /></li>
										</c:forEach>
									</ul>
									<br /> <br />
								</div>

								<div class="time background">
									<div>
										<ul>
											<c:forEach var="bt" items="${breakTime}">
												<li><input class="btli" type="text"
													placeholder="${bt.week_weekend} / 브레이크 타임"
													readonly="readonly" /></li>
												<li><input class="btli" type="text"
													placeholder="${bt.start_breaktime} ~ ${bt.end_breaktime} "
													readonly="readonly" /></li>
											</c:forEach>
											<c:forEach var="h" items="${holiday}">
												<li><input class="btli" type="text"
													placeholder="휴일 : ${h.day_name}" readonly="readonly" /></li>
											</c:forEach>
										</ul>

									</div>

								</div>

							</div>

						</div>


						<div class="placeholder main-right">
							<c:forEach var="s" items="${store }">
								<div class="background"
									style="font-weight: bold; margin-top: 1vh; margin-left: 1vw;">
									<span style="font-size: 30pt; font-weight: bold;">${s.st_name }</span>
									<br /> <br /> <br />

									<div class="revBoard">

										<div class="info">
											<div class="likeRevC likeNum">
												<label for="likeNum" class=""
													style="font-weight: bold; display: inline;"> 좋아요 수
													: &nbsp;&nbsp; <span class="glyphicon glyphicon-heart"
													aria-hidden="true"> </span> <span id="likeNum"
													style="display: inline;">${s.like_count }</span>
												</label>
											</div>
											<div class="likeRevC score">
												<label for="score" class=""
													style="font-weight: bold; display: inline;">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 평점 :
													&nbsp;&nbsp;&nbsp;&nbsp; <span id="score"
													style="display: inline;">${s.star_score}</span>
												</label>
											</div>

											<div class="likeRevC reviewNum">
												<label for="reviewNum" class=""
													style="font-weight: bold; display: inline;">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													리뷰 수 : &nbsp;&nbsp; <span id="reviewNum"
													style="display: inline;">${s.review_count}</span>
												</label>
											</div>
										</div>
										<!-- .likeRevC    info background -->

										<br />

										<div class="info background">
											<label for="addr" class=""
												style="font-weight: bold; display: inline;">
												주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<span id="addr" style="display: inline;"> :
													${s.st_location }</span>
											</label>
										</div>

										<br />

										<div class="info background">
											<label for="tel" class=""
												style="font-weight: bold; display: inline;">
												전화번호&nbsp;&nbsp;&nbsp;&nbsp; <span id="tel"
												style="display: inline;"> : ${s.st_tel }</span>
											</label>
										</div>
										<br />

									</div>
								</div>
							</c:forEach>
						</div>

					</div>

					<!-- <br /> -->



					<!-- 기타 관련 -->

					<div class="container2 " id="storePay">


						<c:forEach var="o" items="${others }" varStatus="status">
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<div class="info background">
								<label for="payTool" class="oTool" style="font-weight: bold">결제
									수단&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<!-- 결제 수단 -->
								<div class=" form">
									<input class="" type="text" id="payTool" class="oInfo"
										placeholder="${o.pay_name }" readonly>
								</div>
							</div>

							<div class="info background">
								<label for="storePage" class="oTool" style="font-weight: bold">가게
									이메일</label>
								<!-- 페이지 -->
								<div class="form">
									<input class="" type="text" id="storePage" class="oInfo"
										placeholder="${o.st_email }" readonly>
								</div>
							</div>
							<div class="info background">
								<label for="etcInfo" class="oTool" style="font-weight: bold">기타
									정보&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<!-- 수용 인원 등 -->
								<div class=" form">
									<input class="" type="text" id="etcInfo" class="oInfo"
										placeholder="최대 수용 인원 : ${o.max_customers }, 와이파이 있음, 주차 가능 등..."
										readonly>
								</div>
							</div>
							<div class="info background">
								<label for="storeExplain" class="oTool"
									style="font-weight: bold">가게 설명&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<!-- 가게 설명 -->
								<div class="form">
									<textarea class="" rows="3" id="storeExplain" class="oInfo"
										placeholder="${o.st_explain }" readonly></textarea>
								</div>
							</div>
							<div>
								<button type="submit" class="btn" onclick="reqapplyform.action"
									value="${o.st_num }"
									style="width: 10vw; height: 3vh; margin-left: 33vw;">가게정보오류수정</button>
							</div>

						</c:forEach>
					</div>
					<!-- class="container2 " id="storePay" -->
					<div id="menuboard" class="container3">
						<div id="rv-Keyword">
							<br /> <br />
							<!-- 메뉴 -->
							<h1 style="padding-left: 4vw;">메뉴</h1>
							<div class="menuList" style="padding-bottom: 1vh;">
								<!-- 
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴1 : 15,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴2 : 14,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴3 : 13,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴4 : 13,500원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴5 : 15,500원
								</a>
							</div>
							 -->
							</div>
							<div class="col-xs-16 col-md-16 menuList">
								<!-- 
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴6 : 14,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴7 : 12,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴8 : 11,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴9 : 9,000원
								</a>
							</div>
							<div class="menuPhoto">
								<a href="#" class="thumbnail"> <img src="images/store_img01.png"
									alt="..." class="img-rounded">메뉴10 : 8,000원
								</a>
							</div>
							 -->
								<c:forEach var="ml" items="${menuLists }">
									<div class="menuPhoto">
										<a class="thumbnail" style="font-weight: bold;"> <img
											src="images/${ml.image_link }" alt="..." class="img-rounded"
											style="border-radius: 15px;">${ml.menu_name } <br /> :
											${ml.price }원
										</a>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
					<!-- id="menuboard" class="col-md-offset-1 col-md-1 container3  " -->
					<br /> <br /> <br /> <br />
					<div class=" container4">
						<div id="reviewList" style="margin-top: 5vh; margin-left: 2vw;">
							<h1 style="padding-left: 2vw; display: inline;">리뷰</h1>
							<button type="submit" class="btn" style="margin-left: 42vw;">리뷰
								작성하기</button>
							<br />
							<div class="revKeyList">
								<br />
								<ul style="display: flex; text-align: center;">
									<!-- 
								<li><input class="" type="text"
									placeholder="리뷰 키워드1" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드2" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드3" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드4" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드5" readonly="readonly" /></li>
								 -->
									<c:forEach var="sK" items="${stKeys }">
										<li style="display: inline-block;"><input class=""
											type="text" style="text-align: center; font-weight: bold;"
											placeholder="${sK.st_keyword }" readonly="readonly" /></li>
									</c:forEach>
								</ul>
								<!-- 
							<ul style="display: flex;">
								<li><input class="" type="text"
									placeholder="리뷰 키워드6" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드7" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드8" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드9" readonly="readonly" /></li>
								<li><input class="" type="text"
									placeholder="리뷰 키워드10" readonly="readonly" /></li>
							</ul>
							 -->
								<br />
								<div id="revList" style="margin-left: 1vw;">
									<!-- 
								<div class="reViews">
									<div class="reView revBack">
										<span id="userId" style="font-size: 15pt; font-weight: bold; margin-left: 1vw;">디토</span><br />
										<textarea class=" reV" style="height: 7vh; margin-left: 1vw;" placeholder="훌쩍 훌쩍 커버렸어"
											readonly="readonly"></textarea>
										<div id="repCon">
											<span style="padding-left: 16px; display: inline;">작성
												일자 : 2023.08.02</span><br />
											<div class="revRec" style="padding-left: 5px;">
												<button type="button" class="recBtn" onclick="">비추천</button>
												<span class="glyphicon glyphicon-star-empty"aria-hidden="true" style="float: right;"></span>
												<button type="button" class="recBtn" onclick="">추천</button>
												<span class="glyphicon glyphicon-star" style="float: right;" aria-hidden="true"></span>
											</div>
											<button type="submit" class="reportBtn" style="float: right;">신고하기</button><br /><br />
										</div>
									</div>
								</div>
								<div class="reViews">
									<div class="reView revBack">
										<span id="userId" style="font-size: 15pt; font-weight: bold; margin-left: 1vw;">ETA</span><br />
										<textarea class=" reV" style="height: 7vh;  margin-left: 1vw;" 
											placeholder="뭐니 너의 ETA 뭐니 너의 ETA" readonly="readonly"></textarea>
										<div id="repCon">
											<span style="padding-left: 16px; display: inline;">작성
												일자 : 2023.08.02</span><br />
											<div class="revRec" style="padding-left: 5px;">
												<button type="button" class="recBtn" onclick="">비추천</button>
												<span class="glyphicon glyphicon-star-empty"aria-hidden="true" style="float: right;"></span>
												<button type="button" class="recBtn" onclick="">추천</button>
												<span class="glyphicon glyphicon-star" style="float: right;" aria-hidden="true"></span>
											</div>
											<button type="submit" class="reportBtn" style="float: right;">신고하기</button><br /><br />
										</div>
									</div>
								</div>
								<div class="reViews">
									<div class="reView revBack">
										<span id="userId" style="font-size: 15pt; font-weight: bold; margin-left: 1vw;">주목</span><br />
										<textarea class=" reV" style="height: 7vh; margin-left: 1vw;"
											placeholder="너에게 필요한 건 주목이야--" readonly="readonly"></textarea>
										<div id="repCon">
											<span style="padding-left: 16px; display: inline;">작성
												일자 : 2023.08.02</span><br />
											<div class="revRec" style="padding-left: 5px;">
												<button type="button" class="recBtn" onclick="">비추천</button>
												<span class="glyphicon glyphicon-star-empty"aria-hidden="true" style="float: right;"></span>
												<button type="button" class="recBtn" onclick="">추천</button>
												<span class="glyphicon glyphicon-star" style="float: right;" aria-hidden="true"></span>
											</div>
											<button type="submit" class="reportBtn" style="float: right;">신고하기</button><br /><br />
										</div>
									</div>
								</div>
								 -->
									<c:forEach var="rv" items="${reViews }">
										<div class="reViews">
											<div class="reView revBack">
												<span id="userId"
													style="font-size: 15pt; font-weight: bold; margin-left: 1vw;">${rv.user_nickname }</span><br />
												<textarea class=" reV"
													style="height: 7vh; margin-left: 1vw; font-size: 12pt; font-weight: bold;"
													placeholder="${rv.rv_content}" readonly="readonly"></textarea>
												<div id="repCon">
													<span style="padding-left: 16px; display: inline;">작성
														일자 : ${rv.reg_date }</span><br />
													<button type="submit" class="reportBtn btn"
														style="float: right;">신고하기</button>
													<br />
													<div class="revRec" style="padding-left: 5px;">
														<button type="button" class="recBtn btn" onclick="">비추천</button>
														<span class="glyphicon glyphicon-star-empty"
															style="float: right;" aria-hidden="true">
															${rv.rec_nonrec_name2 } </span>
														<button type="button" class="recBtn btn" onclick="">추천</button>
														<span class="glyphicon glyphicon-star"
															style="float: right;" aria-hidden="true">
															${rv.rec_nonrec_name1 } </span>
													</div>

												</div>
											</div>
										</div>
									</c:forEach>

								</div>
								<!-- id="revList" -->
							</div>
							<!-- class="revKeyList"  -->
						</div>
					</div>
					<!-- class="col-md-8  container4" -->
				</div>
				<!-- id="container1" class="col-md-8" -->
			</div>
			<!-- main -->


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
											<button type="button" value="${com.st_num }"
												class="comDelete">X</button>
											<label for="${com.st_num}" class="stLabel"> <input
												type="checkbox" class="comStImgCB" id="${com.st_num}">
												<c:set var="photo" value="${com.photo_link }" /> <c:choose>
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
				<input type="hidden" name="regionChk" id="regionChk"> 
				<input type="hidden" name="foodlabelChk" id="foodlabelChk"> 
				<input type="hidden" name="stKeyChk" id="stKeyChk">

				<div class="comStoreBtnDiv">
					<button type="button" class="btn" id="comBtn" name="comBtn">비교하기</button>
				</div>
			</div>

		</div>

		<div class="footer">
			<c:import url="footer.jsp"></c:import>
		</div>

	</form>
</body>
</html>