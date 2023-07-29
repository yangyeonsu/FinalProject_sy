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

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/MY_personal_main(0725_1).css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/userMyPage.css">



</head>
<body>

	<c:import url="header_user_sh.jsp"></c:import>

	<div class="container">




		<div class="middle">
			<div class="col-md-2" id="mleft">
				<div class="left-btn">
					<input type="button" class="side" value="포인트내역"> 
					<input type="button" class="side" value="접수내역"> 
					<input type="button" class="side" value="찜한가게목록"> 
					<input type="button" class="side" value="비교했던가게목록"> 
					<input type="button" class="side" value="작성리뷰목록"> 
					<input type="button" class="side" value="경고내역">
				</div>
			</div>
			<div class="col-md-8">
				<div class="mypage">
					마이 페이지
				</div>
				<div class="id">
					
					<div class="id1">
						<div class="title9">닉네임(아이디)</div>
						<div class="sub9">홍길동(dong)</div>
					</div>
					<div class="id1">
						<div class="title9">등급</div>
						<div class="sub9">크랩</div>
					</div>
					<div class="id1">
						<div class="title9">포인트</div>
						<div class="sub9">150pt</div>
					</div>
					<div class="id1">
						<div class="title9">키워드</div>
						<div class="sub9">맵찔이</div>
					</div>
				</div>


				<div class="jjimlist">
					<div class="ta">
						<div class="title">찜한가게 목록</div>
						<div class="ado" id="ado">
							<a href="" class="adoi">더보기+</a>
						</div>
					</div>
					<br>

					<div class="jimlist">
						<div class="card">
							<img src="images/logo.PNG" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text1">맛집 탐방을 이용해주셔서 감사합니다.</p>
							</div>
						</div>
						<div class="card">
							<img src="images/logo.PNG" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text1">맛집 탐방을 이용해주셔서 감사합니다.</p>
							</div>
						</div>
						<div class="card">
							<img src="images/logo.PNG" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text1">맛집 탐방을 이용해주셔서 감사합니다.</p>
							</div>
						</div>
						<div class="card">
							<img src="images/logo.PNG" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text1">맛집 탐방을 이용해주셔서 감사합니다.</p>
							</div>
						</div>
						<div class="card">
							<img src="images/logo.PNG" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text1">맛집 탐방을 이용해주셔서 감사합니다.</p>
							</div>
						</div>
						<div class="card">
							<img src="images/logo.PNG" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text1">맛집 탐방을 이용해주셔서 감사합니다.</p>
							</div>
						</div>
					</div>
				</div>
				<br>

				<div class="stalist">
					<div class="ta">
						<div class="title2">비교했던 가게목록</div>
						<div class="ado">
							<a href="" class="adoi">더보기+</a>
						</div>
					</div>
					<br>
					<div class="list0" id="list0">
						<div class="list1">Num</div>
						<div class="list1">가게명</div>
						<div class="list1">비교한 날짜</div>
					</div>
					<div class="list0">
						<div class="list1">4</div>
						<div class="list1">가게명4</div>
						<div class="list1">2019-12-06</div>
					</div>
					<div class="list0">
						<div class="list1">3</div>
						<div class="list1">가게명3</div>
						<div class="list1">2019-12-06</div>
					</div>
					<div class="list0">
						<div class="list1">2</div>
						<div class="list1">가게명2</div>
						<div class="list1">2019-12-06</div>
					</div>
					<div class="list0">
						<div class="list1">1</div>
						<div class="list1">가게명1</div>
						<div class="list1">2019-12-06</div>
					</div>
					
					<br>
				</div>
				<br>
				<div class="stalist">
					<div class="ta">
						<div class="title2">작성한 리뷰목록</div>
						<div class="ado">
							<a href="" class="adoi">더보기+</a>
						</div>
					</div>

					<br>
					<div class="list0" id="list0">
						<div class="list1">Num</div>
						<div class="list1">가게명</div>
						<div class="list1">내용</div>
						<div class="list1">리뷰 작성 날짜</div>
					</div>
					<div class="list0">
						<div class="list1">4</div>
						<div class="list1">가게명4</div>
						<div class="list1">안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다</div>
						<div class="list1">2019-12-06</div>
					</div>
					<div class="list0">
						<div class="list1">3</div>
						<div class="list1">가게명3</div>
						<div class="list1">안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다</div>
						<div class="list1">2019-12-06</div>
					</div>
					<div class="list0">
						<div class="list1">2</div>
						<div class="list1">가게명2</div>
						<div class="list1">안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다</div>
						<div class="list1">2019-12-06</div>
					</div>
					<div class="list0">
						<div class="list1">1</div>
						<div class="list1">가게명1</div>
						<div class="list1">안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다안녕하세요 맛있었습니다</div>
						<div class="list1">2019-12-06</div>
					</div>
					<br>
				</div>
				<br>

			</div>
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
						<label for="st1" class="stLabel">
							<input type="checkbox" class="comStImgCB" id="st1">
							<!-- <span class="circle"></span> -->
							<img class="comStImg" src="<%=cp%>/images/store_img01.png">
						</label>
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						가게1
					</div>
				</div>
				
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<input type="checkbox" class="comStImgCB" id="st2">
						<label for="st2" class="stLabel"> 
							<img class="comStImg" src="<%=cp%>/images/logo.PNG">
						</label>
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						가게2
					</div>
				</div>
				
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<input type="checkbox" class="comStImgCB" id="st3">
						<label for="st3" class="stLabel"> 
							<img class="comStImg" src="<%=cp%>/images/store_img01.png">
						</label>					
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						가게3
					</div>
				</div>
				
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<input type="checkbox" class="comStImgCB" id="st4">
						<label for="st4" class="stLabel"> 
							<img class="comStImg" src="<%=cp%>/images/store_img01.png">
						</label>						
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						가게4
					</div>
				</div>
				
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<img class="comStImg" src="<%=cp%>/images/comp_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						
					</div>
				</div>
				
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<img class="comStImg" src="<%=cp%>/images/comp_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						
					</div>
				</div>
				
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<img class="comStImg" src="<%=cp%>/images/comp_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						
					</div>
				</div>
				
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<img class="comStImg" src="<%=cp%>/images/comp_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						
					</div>
				</div>
				
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<img class="comStImg" src="<%=cp%>/images/comp_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						
					</div>
				</div>
				
				<!-- 한 가게 영역 -->
				<div class="comStoreDiv">
					<!-- 한 가게 대표사진 영역 -->
					<div class="comStoreImgDiv">
						<img class="comStImg" src="<%=cp%>/images/comp_img01.png">
					</div>
					<!-- 한 가게 가게이름 영역 -->
					<div class="comStoreNameDiv">
						
					</div>
				</div>
				
			</div>
		</div>	
		
		<div class="comStoreBtnDiv">
			<button type="button" class="btn" id="comBtn" name="comBtn">비교하기</button>
		</div>
		
	</div>
		</div>
		
	</div>
	<c:import url="footer.jsp"></c:import>




</body>
</html>