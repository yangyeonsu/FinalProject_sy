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
<title>가게 등록</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

.bframe
{
	display: flex;
	flex-direction: column;
}


.st_info_insert
{
	width: 70vw;
	margin-left: 15vw;
	padding-top: 3vh;
	padding-bottom: 5vh;
	border: 5px solid #F7F4EA;
	border-radius: 40px;
}
.top
{
	width: 70vw;
	margin-left: 15vw;
	text-align: center;
}

.input_group
{
	/* border: 1px solid gray; */
	border-radius: 5px;
	display: flex;
}

.inputform
{
	
	width: 23.8vw;
	border-radius: 0 10px 10px 0;
	border: 1px solid #ccc;
	padding: 8px 12px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
#st_in_num
{
	width: 27.5v
}
.title
{
	background-color: #F7F4EA;
	width: 8vw;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px 0 0 10px;
	margin-right: 1vw;
}
.cfb
{
	height: 3.3vh;
}

.igroup
{
	margin-left: 10vw;
	margin-top: 3vh;
	width: 55vw;
	display: flex;

	
}



.button
{
	margin-top: 3vh;
	margin-bottom: 3vh;
	text-align: center;
}


button
{
	
	display: inline-block;
	outline: none;
	cursor: pointer;
	font-weight: 500;
	border-radius: 3px;
	padding: 0 16px;
	border-radius: 4px;
	background: #F7F4EA;
	line-height: 1.15;
	font-size: 14px;
	height: 36px;
	word-spacing: 0px;
	letter-spacing: .0892857143em;
	text-decoration: none;
	text-transform: uppercase;
	min-width: 64px;
	border: none;
	text-align: center;
	box-shadow: 0px 3px 1px -2px rgb(0 0 0 / 20%), 0px 2px 2px 0px rgb(0 0 0 / 14%), 0px 1px 5px 0px rgb(0 0 0 / 12%);
	transition: box-shadow 280ms cubic-bezier(0.4, 0, 0.2, 1);
	:hover {
	    background: rgb(98, 0, 238);
	    box-shadow: 0px 2px 4px -1px rgb(0 0 0 / 20%), 0px 4px 5px 0px rgb(0 0 0 / 14%), 0px 1px 10px 0px rgb(0 0 0 / 12%);
	}
                
}

.input_group {
    display: flex;
    align-items: center;
}

.file_label {
    margin-right: 10px;
    width: 100%;
    height: 100%;
    text-align: center;
    border: 1px solid gray;
    border-radius: 5px;
}
#st_in_num
{
	width: 25.5vw;
}

.file
{
	position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.file_label
{
	background-color: #F7F4EA;
}
.upload-name
{
	width: 14.3vw;
	border-radius: 0 10px 10px 0;
	border: 1px solid #ccc;
	padding: 8px 12px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
#upload-name01
{
	border-radius: 0;
}
#upload-name02
{
	border-radius: 0;
}

#st_in_num1
{
	width: 6vw;
	border-radius: 10px;
	margin-right: 0.5vw;
}
#st_in_num2
{
	width: 6vw;
	border-radius: 10px;
	margin-right: 0.5vw;
	margin-left: 0.5vw;
}
#st_in_num3
{
	width: 6vw;
	border-radius: 10px;
	margin-left: 0.5vw;
	margin-right: 1vw;
}
#insert
{
	margin-left: 2vw;
}

#st_location
{
	width: 30vw;
	margin-right: 1vw;
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</head>
<body>

<div class="bframe">
	<form action="storeregiinsert.action" method="post" id="userForm" enctype="multipart/form-data">
	<!-- header -->
	<div><c:import url="header_user.jsp"></c:import></div>
	
	<div class="middle">
		<div class="top">
			<h1>사업자 등록 인증</h1>
			<hr>
		</div>
		
		<!-- 입력 부분 -->
		<div class="st_info_insert">
		
				<!-- 사업자 등록 번호 -->
				<div class="igroup">
					<div class="title">
						사업자 등록 번호
					</div>
					<div class="input_group">
						<input type="text" class="inputform" id="st_in_num1" maxlength='3' value=""> - 
						<input type="text" class="inputform" id="st_in_num2" maxlength='2'> - 
						<input type="text" class="inputform" id="st_in_num3" maxlength='5'>
						<input type="hidden" id="st_in_num" name="st_in_num">
					</div>
				</div>
				
				<!-- 서류등록 -->
				<div class="igroup">
					<div class="title">
						사업자 서류등록
					</div>
					<div class="input_group" id="fileregi1">
					    <a href="">파일 업로드 click here~!!!</label>
					</div>
					<span id="err2" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				<!-- 사업장 관리 번호 -->
				<div class="igroup">
					<div class="title">
						사업장 관리 번호
					</div>
					<div class="input_group">
						<input type="text" class="inputform" id="st_place_num" name="st_place_num">
					</div>
					<span id="err3" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				<!-- 서류등록 -->
				<div class="igroup">
					<div class="title">
						사업장 서류등록
					</div>
					<div class="input_group" id="fileregi2">
					    <label for="file2" class="upload-name" id="upload-name02">파일 업로드 click here~!!!</label>
					    <input type="file" id="file2" class="file" onchange="displayAndSetFileName2()" name="st_place_file">
					    <input class="upload-name" id="upload-name2" value="" placeholder="첨부파일" readonly>
					</div>
					<span id="err4" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				<!-- 가게명 -->
				<div class="igroup">
					<div class="title">
						가게 명
					</div>
					<div class="input_group">
						<input type="text" class="inputform" id="st_name" name="st_name">
					</div>
					<span id="err5" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				<!-- 가게 주소 -->
				<div class="igroup">
					<div class="title">
						가게 주소
					</div>
					<div class="input_group">
						<input type="text" class="inputform" name="st_location" id="st_location" placeholder="주소" readonly>
						<input type="hidden" id="query">
					</div>
					<span id="err6" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				<!-- 가게 상세 주소 -->
				<div class="igroup">
					<div class="title">
						가게 상세 주소
					</div>
					<div class="input_group">
						<input type="text" class="inputform" name="st_location_dt" id="st_location_dt" placeholder="상세주소">
						
					</div>
					<span id="err7" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				<!-- 가게 번호 -->
				<div class="igroup">
					<div class="title">
						가게 번호
					</div>
					<div class="input_group">
						<input type="text" class="inputform" name="st_tel" id="st_tel">
					</div>
					<span id="err8" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				
				<div class="button">
					<button type="reset">취소</button>
					<button type="button" id="insert" onclick="">완료</button><br>
					<span id="err9" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				<!-- user_num -->
				<input type="hidden" class="inputform" name="user_num" id="user_num"
				value="">
			
		</div> <!-- st_info_insert -->
	</div>
	
	

	</form>
</div>

</body>
</html>