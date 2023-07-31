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
<title>Main Admin Page</title>



<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main_admin.css">
<style type="text/css">


</style>

<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

</head>

<body>

<!-- header -->
<c:import url="header_admin.jsp"></c:import>

<!-- container -->
<div id="container">
	
	<div id="mainDiv">
		
		<!-- 접수내역관리 -->
		<div id="receive">
			<h1>접수내역 관리</h1>
			
			<!-- 리뷰신고 box -->
			<div id="reviewBox">
				<h3><a href="#">리뷰신고</a></h3>
			
				<table id="review_list">
					<thead>
						<tr>	
							<th>신고일자</th>
							<th>신고자 ID</th>
							<th>가게 이름</th>
							<th>피신고자 ID</th>
							<th>처리상태</th>
							<th>처리일자</th>
							<th>처리한 관리자</th>
						</tr>
						<tr>
							<td>2023.05.01</td>
							<td>hong</td>
							<td>마시다</td>
							<td>gildong</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.31</td>
							<td>gil</td>
							<td>맛스타</td>
							<td>ssang</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.29</td>
							<td>dong</td>
							<td>맛다시</td>
							<td>gulee</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.29</td>
							<td>lee</td>
							<td>김치찌개</td>
							<td>sanghyuk</td>
							<td>처리중</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.29</td>
							<td>soon</td>
							<td>순두부맛집</td>
							<td>simmi</td>
							<td>최종처리완료</td>
							<td>2023.05.02</td>
							<td>MG1</td>
						</tr>
					</thead>
				</table>
			</div>
			
			<br>
			<!-- 가게정보수정요청 box -->
			<div id="storeErrBox" >
				<h3><a href="#">가게정보수정요청</a></h3>
			
				<table id="storeErr_list">
					<thead>
						<tr>	
							<th>요청일자</th>
							<th>요청자 ID</th>
							<th>가게 이름</th>
							<th>처리상태</th>
							<th>처리일자</th>
							<th>처리한 관리자</th>
						</tr>
						<tr>
							<td>2023.05.02</td>
							<td>hong</td>
							<td>다시다</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.05.01</td>
							<td>gil</td>
							<td>맛스타</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>dong</td>
							<td>맛다시</td>
							<td>처리중</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.29</td>
							<td>gill</td>
							<td>김치찌개</td>
							<td>최종처리완료</td>
							<td>2023.05.06</td>
							<td>MG2</td>
						</tr>
						<tr>
							<td>2023.04.29</td>
							<td>gagildong</td>
							<td>순두부맛집</td>
							<td>최종처리완료</td>
							<td>2023.05.02</td>
							<td>MG1</td>
						</tr>
					</thead>
				</table>
			</div>
			
			<br>
			<!-- 이의제기 box -->
			<div id="objectionBox" >
				<h3><a href="#">이의제기</a></h3>
			
				<table id="objection_list">
					<thead>
						<tr>	
							<th>신청일자</th>
							<th>가게 이름</th>
							<th>처리상태</th>
							<th>처리일자</th>
							<th>처리한 관리자</th>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>맛시따</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>맛스타</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>김치찌개</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>순두부맛집</td>
							<td>최종처리완료</td>
							<td>2023.05.04</td>
							<td>MG2</td>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>다시다</td>
							<td>최종처리완료</td>
							<td>2023.05.04</td>
							<td>MG1</td>
						</tr>
					</thead>
				</table>
			</div>
			
			
			<br>
			<!-- 패널티회수 box -->
			<div id="penaltyBox" >
				<h3><a href="#">패널티회수</a></h3>
			
				<table id="penalty_list">
					<thead>
						<tr>	
							<th>신청일자</th>
							<th>가게 이름</th>
							<th>처리상태</th>
							<th>처리일자</th>
							<th>처리한 관리자</th>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>맛시따</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>맛스타</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>김치찌개</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>순두부맛집</td>
							<td>최종처리완료</td>
							<td>2023.05.04</td>
							<td>MG2</td>
						</tr>
						<tr>
							<td>2023.04.30</td>
							<td>다시다</td>
							<td>최종처리완료</td>
							<td>2023.05.04</td>
							<td>MG1</td>
						</tr>
					</thead>
				</table>
			</div>
			
			<br>
			<!-- 가게 등록/폐업 요청 box -->
			<div id="inout_Box" >
				<h3><a href="#">가게 등록/폐업 요청</a></h3>
			
				<table id="inout_list">
					<thead>
						<tr>
							<th>구분</th>	
							<th>신청일자</th>
							<th>신청 ID</th>
							<th>처리상태</th>
							<th>처리일자</th>
							<th>처리한 관리자</th>
						</tr>
						<tr>
							<td style="background-color: green;">등록</td>
							<td>2023.05.02</td>
							<td>hong</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td style="background-color: pink;">폐업</td>
							<td>2023.05.02</td>
							<td>gil</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td style="background-color: green;">등록</td>
							<td>2023.05.02</td>
							<td>dong</td>
							<td>미확인</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td style="background-color: green;">등록</td>
							<td>2023.05.02</td>
							<td>sam</td>
							<td>최종처리완료</td>
							<td>2023.05.04</td>
							<td>MG2</td>
						</tr>
						<tr>
							<td style="background-color: pink;">폐업</td>
							<td>2023.05.02</td>
							<td>smith</td>
							<td>최종처리완료</td>
							<td>2023.05.04</td>
							<td>MG1</td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- footer -->
<c:import url="footer.jsp"></c:import>
</body>



</body>

</html>