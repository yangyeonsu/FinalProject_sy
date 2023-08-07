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
	padding-top: 5vh;
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
	
	width: 30vw;
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
}
.cfb
{
	height: 3.3vh;
}

.igroup
{
	margin-left: 10vw;
	margin-top: 5vh;
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
    margin-right: 10px; /* Adjust the spacing between the label and the button */
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script type="text/javascript">
	
	function fn_ValidationCheck(value) {
	    var valueMap = value.replace(/-/gi, '').split('').map(function (item) {
	        return parseInt(item, 10);
	    });

	    if (valueMap.length === 10) {
	        var multiply = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
	        var checkSum = 0;

	        for (var i = 0; i < multiply.length; ++i) {
	            checkSum += multiply[i] * valueMap[i];
	        }

	        checkSum += parseInt((multiply[8] * valueMap[8]) / 10, 10);
	        return Math.floor(valueMap[9]) === ((10 - (checkSum % 10)) % 10);
	    }

	    return false;
	}

	// 사업자 등록번호 유효성을 체크하는 함수
	function st_in_numcheck() {
	    var st_in_numInput = $("#st_in_num").val();

	    if (!fn_ValidationCheck(st_in_numInput)) {
	        $("#err").text("사업자 등록 번호가 올바르지 않습니다.").css("display", "inline");
	        $("#st_in_num").focus();
	        return false;
	    } else {
	        $("#err").css("display", "none");
	        return true;
	    }
	}

	$(function() {
	    $("#insert").click(function() {
	        $("#file").css("border", "1px solid black");
	        if ($("#file").val() == "") {
	            $("#err").text("서류를 등록해주세요.").css("display", "inline");
	            $("#file").css("border", "3px solid red");
	            return;
	        }
			
	        if ($("#st_in_num").val() == "") {
	            $("#err").text("사업자 등록 번호를 입력해주세요.").css("display", "inline");
	            $("#st_in_num").focus();
	            return;
	        }

	        if (!st_in_numcheck()) {
	            return;
	        }

	        if ($("#stmgnum").val() == "") {
	            $("#err").text("사업장 관리 번호를 입력해주세요.").css("display", "inline");
	            $("#stmgnum").focus();
	            return;
	        }

	        if ($("#stname").val() == "") {
	            $("#err").text("가게 명을 입력해주세요.").css("display", "inline");
	            $("#stname").focus();
	            return;
	        }

	        if ($("#staddr").val() == "") {
	            $("#err").text("가게 주소를 입력해주세요.").css("display", "inline");
	            $("#staddr").focus();
	            return;
	        }
	        
	        if ($("#staddr").val() == "") {
	            $("#err").text("가게 상세 주소를 입력해주세요.").css("display", "inline");
	            $("#staddr").focus();
	            return;
	        }

	        if ($("#sthp").val() == "") {
	            $("#err").text("가게 번호를 입력해주세요.").css("display", "inline");
	            $("#sthp").focus();
	            return;
	        }

	        // 폼 submit 액션 처리 수행
	        $("#stinfoinsert").submit();
	    });
	});
	


</script>

</head>
<body>

<div class="bframe">
	<!-- header -->
	<div><c:import url="header_user.jsp"></c:import></div>
	
	<div class="middle">
		<div class="top">
			<h1>사업자 등록 인증</h1>
			<hr>
		</div>
		
		<!-- 입력 부분 -->
		<div class="st_info_insert">
			<form action="storeregiinsert.action" method="post" id="stinfoinsert">
		
			
			
			<!-- 사업자 등록 번호 -->
			<div class="igroup">
				<div class="title">
					사업자 등록 번호
				</div>
				<div class="input_group">
					<input type="text" class="inputform" name="st_in_num" id="st_in_num">
					<button type="button" class="cfb" onclick="st_in_numcheck()">인증하기</button>
				</div>
			</div>
			
			<!-- 서류등록 -->
			<div class="igroup">
				<div class="title">
					사업자 서류등록
				</div>
				<div class="input_group">
				    <label for="file" class="file_label"></label>
				    <input type="file" id="file1" class="file">
				</div>
			</div>
			
			<!-- 사업장 관리 번호 -->
			<div class="igroup">
				<div class="title">
					사업장 관리 번호
				</div>
				<div class="input_group">
					<input type="text" class="inputform" id="st_place_num", name="st_place_num">
				</div>
			</div>
			
			<!-- 서류등록 -->
			<div class="igroup">
				<div class="title">
					사업장 서류등록
				</div>
				<div class="input_group">
				    <label for="file" class="file_label"></label>
				    <input type="file" id="file2" class="file">
				</div>
			</div>
			
			<!-- 가게명 -->
			<div class="igroup">
				<div class="title">
					가게 명
				</div>
				<div class="input_group">
					<input type="text" class="inputform" id="st_name" name="st_name">
				</div>
			</div>
			
			<!-- 가게 주소 -->
			<div class="igroup">
				<div class="title">
					가게 주소
				</div>
				<div class="input_group">
					<input type="text" class="inputform" name="st_location" id="st_location">
				</div>
			</div>
			
			<!-- 가게 상세 주소 -->
			<div class="igroup">
				<div class="title">
					가게 상세 주소
				</div>
				<div class="input_group">
					<input type="text" class="inputform" name="st_location_dt" id="st_location_dt">
				</div>
			</div>
			
			<!-- 가게 번호 -->
			<div class="igroup">
				<div class="title">
					가게 번호
				</div>
				<div class="input_group">
					<input type="text" class="inputform" name="st_tel" id="st_tel">
				</div>
			</div>
			
			
			<div class="button">
				<button type="reset">취소</button>
				<button type="button" id="insert" onclick="checkpoint()">완료</button><br>
				<span id="err" style="color: red; font-weight: bold; display: none;">필수 입력 항목이 누락되었습니다.</span>
			</div>
			
			<!-- user_num -->
			<input type="hidden" class="inputform" name="user_num" id="user_num"
			value="<%=(String) session.getAttribute("user_num")%>">
			</form>
		</div> <!-- st_info_insert -->
	</div>
	
	
	<!-- footer -->
	<div><c:import url="footer.jsp"></c:import></div>


</div>


</body>
</html>