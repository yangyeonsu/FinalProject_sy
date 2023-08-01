<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/MY_personal_main(0801).css">

</head>

<body>


<c:import url="header_user_sh(0801).jsp"></c:import>

<div class=container>

	<!-- 비교함 외의 영역 -->
	<div id="mainDiv">
		
		<!-- 메인로고 + 검색창 + 검색버튼 구역 -->
		<div id="searchArea">
		
			<!-- 메인로고 -->
			<div id="logoImgDiv">
				<img id="logoImg" name="logoImg" class="Img" src = "<%=cp %>/images/logo_text.png">
			</div>
			
			<!-- 검색창 + 검색버튼 -->
			<div id="inputDiv">
				<!-- 검색창 -->
				<input type="text" id="typingArea" name="typingArea" class="insert" placeholder="검색어를 입력해주세요.">
				<!-- 검색버튼 -->
				<button type="button" id="searchBtn" name="searchBtn">
					<img id="searchIcon" src="<%=cp %>/images/search_icon.png">
				</button>
			</div>
		</div>
		
		
		
		<!-- 추천가게 구역 -->
		<div id="recommendStDiv">
			
			<!-- 입맛키워드기반 추천 -->
			<div id="personalIbmatDiv">
				<div class="recommendName fa-solid">
					▼ <span>입맛</span>에 기반을 둔 추천
				</div>
				
				<!-- 가게 구역 -->
				<div class="storeList">
				
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>					
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div>
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>					
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div>
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>					
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div>
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>						
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div><!-- store end -->
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>						
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div><!-- store end -->
				</div><!-- storeList end -->
			</div><!-- personalIbmatDiv end -->
			
			<!-- 찜기반 추천 -->
			<div id="personalLike">
		
				<div class="recommendName">
					▼ <span>찜</span>에 기반을 둔 추천
				</div>
				
				<!-- 가게 구역 -->
				<div class="storeList">
				
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>					
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div>
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>						
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div>
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>					
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div>
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>						
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div><!-- store end -->
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>					
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div><!-- store end -->
				</div><!-- storeList end -->
			</div>
			
			<!-- 요즘 뜨는 가게들 -->
			<div id="famousSt">
				<div class="recommendName">
					▼ <span>요즘 뜨는</span> 가게 추천
				</div>
				
				<!-- 가게 구역 -->
				<div class="storeList">
				
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>						
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div>
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>					
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div>
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>						
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div>
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>						
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div><!-- store end -->
					
					<div class="store">
						<!-- 가게 사진 + 찜, 비교함추가 -->
						<div class="stImgBtnDiv">
							<div class="stImgDiv">
								<img class="stImg" src="<%=cp%>/images/store_img01.png">
							</div>
							
							<div class="likeComAddBtn">
								<button type="button" class="comAddBtn">+</button>
								<button type="button" class="likeAddBtn">❤️</button>						
							</div>

						</div>
						
						<div class="name_reviewDiv">
							<!-- 가게 명 -->
							<div class="stName">
								가게 1
							</div>
							
							 <!-- 별점 평점(리뷰 수) -->
							<div class="startReviewDivs">
								<span>4.5</span>(450)
							</div>
						</div>
					</div><!-- store end -->
				</div><!-- storeList end -->
			</div>
		
		</div>
	</div><!-- mainDiv end -->
	
	
	
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
							<img class="comStImg" src="<%=cp%>/images/store_img01.png">
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

<c:import url="footer.jsp"></c:import>	

</body>
</html>