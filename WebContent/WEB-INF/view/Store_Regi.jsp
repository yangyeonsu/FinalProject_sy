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
	margin-right: 1vw;
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
	width: 24vw;
	margin-right: 1vw;
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                /* document.getElementById("sample6_extraAddress").value = extraAddr; */
	            
	            } /* else {
	                document.getElementById("sample6_extraAddress").value = '';
	            } */
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('st_location').value = addr + extraAddr;
	            /* document.getElementById("sample6_address").value = addr; */
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("st_location_dt").focus();
	        }
	    }).open();
	}
	
	function fn_ValidationCheck(value) {
	    var valueMap = value.replace(/-/gi, '').split('').map(function (item) {
	        return parseInt(item, 10);
	    });
	
	    if (valueMap.length === 10) {
	        var multiply = [1, 3, 7, 1, 3, 7, 1, 3, 5];
	        var checkSum = 0;
	
	        for (var i = 0; i < multiply.length; ++i) {
	            checkSum += multiply[i] * valueMap[i];
	        }
	
	        checkSum += parseInt((multiply[8] * valueMap[8]) / 10, 10);
	        return Math.floor(valueMap[9]) === ((10 - (checkSum % 10)) % 10);
	    }
	
	    return false;
	}
	
	function st_in_numcheck() {
	    var st_in_numInput = $("#st_in_num1").val() + $("#st_in_num2").val() + $("#st_in_num3").val();
	    var isValid = fn_ValidationCheck(st_in_numInput);
	
	    $("#err1").toggle(!isValid);
	    $("#st_in_num1").focus();
	    
	    if (isValid)
	    {
	    	alert(st_in_numInput);
	    	$("#st_in_num").val(st_in_numInput);
	    }
	    else
	    	alert("가게 등록 번호 에러");
	    
	
	    return isValid;
	}

	$(function() {
	    $("#insert").click(function() {
	        $("#err2").css("display", "none");
	        $("#fileregi1").css("border", "none");
	        $("#fileregi2").css("border", "none");
	        $("#err2").css("display", "none");
	        $("#err3").css("display", "none");
	        $("#err4").css("display", "none");
	        $("#err5").css("display", "none");
	        $("#err6").css("display", "none");
	        $("#err7").css("display", "none");
	        $("#err8").css("display", "none");
	        
	        
			
	        if ($("#st_in_num1").val() == "" || $("#st_in_num2").val() == "" || $("#st_in_num3").val() == "") {
	            $("#err1").text("사업자 등록 번호를 입력해주세요.").css("display", "inline");
	            $("#st_in_num1").focus();
	            return;
	        }
	        if ($("#file1").val() == "") {
	            $("#err2").text("사업자 서류를 등록해주세요.").css("display", "inline");
	            $("#fileregi1").css("border", "3px solid red");
	            return;
	        }
	        
	        if ($("#st_place_num").val() == "") {
	            $("#err3").text("사업장 관리 번호를 입력해주세요.").css("display", "inline");
	            $("#st_place_num").focus();
	            return;
	        }
	        
	        if ($("#file2").val() == "") {
	            $("#err4").text("사업자 서류를 등록해주세요.").css("display", "inline");
	            $("#fileregi2").css("border", "3px solid red");
	            return;
	        }

	        if ($("#st_name").val() == "") {
	            $("#err5").text("가게 명을 입력해주세요.").css("display", "inline");
	            $("#st_name").focus();
	            return;
	        }

	        if ($("#st_location").val() == "") {
	            $("#err6").text("가게 주소를 입력해주세요.").css("display", "inline");
	            $("#st_location").focus();
	            return;
	        }
	        
	        if ($("#st_location_dt").val() == "") {
	            $("#err7").text("가게 상세 주소를 입력해주세요.").css("display", "inline");
	            $("#st_location_dt").focus();
	            return;
	        }

	        if ($("#st_tel").val() == "") {
	            $("#err8").text("가게 번호를 입력해주세요.").css("display", "inline");
	            $("#st_tel").focus();
	            return;
	        }

	        // 폼 submit 액션 처리 수행
	        $("#userForm").submit();
	    });
	});
	
	
	function displayAndSetFileName1() {
	    var fileInput = document.getElementById("file1");
	    var uploadNameInput = document.getElementById("upload-name1");

	    if (fileInput.files.length > 0) {
	        var uploadedFileName = fileInput.files[0].name;
	        uploadNameInput.value = uploadedFileName;
	    }
	    else {
	    	uploadNameInput.value = null;
	    }
	}
	function displayAndSetFileName2() {
	    var fileInput = document.getElementById("file2");
	    var uploadNameInput = document.getElementById("upload-name2");

	    if (fileInput.files.length > 0) {
	        var uploadedFileName = fileInput.files[0].name;
	        uploadNameInput.value = uploadedFileName;
	    }
	    else {
	    	uploadNameInput.value = null;
	    }
	}
	
	

	


</script>

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
						<input type="text" class="inputform" id="st_in_num1" maxlength='3'> - 
						<input type="text" class="inputform" id="st_in_num2" maxlength='2'> - 
						<input type="text" class="inputform" id="st_in_num3" maxlength='5'>
						<input type="hidden" id="st_in_num" name="st_in_num">
						<button type="button" class="cfb" onclick="st_in_numcheck()">인증하기</button>
						
					</div>
					<span id="err1" style="color: red; font-weight: bold; display: none;">잘못된 사업자 등록 번호 입니다.</span>
				</div>
				
				<!-- 서류등록 -->
				<div class="igroup">
					<div class="title">
						사업자 서류등록
					</div>
					<div class="input_group" id="fileregi1">
					    <label for="file1" class="upload-name" id="upload-name01">파일 업로드 click here~!!!</label>
					    <input type="file" id="file1" class="file" onchange="displayAndSetFileName1()" name="st_in_file">
					    <input class="upload-name" id="upload-name1" value="" placeholder="첨부파일" readonly>
					</div>
					<span id="err2" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				<!-- 사업장 관리 번호 -->
				<div class="igroup">
					<div class="title">
						사업장 관리 번호
					</div>
					<div class="input_group">
						<input type="text" class="inputform" id="st_place_num" name="st_place_num" maxlength='11'>
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
						<button type="button" id="addrsc" onclick="sample6_execDaumPostcode()">주소 찾기</button>
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
					<button type="button" id="insert" onclick="checkpoint()">완료</button><br>
					<span id="err9" style="color: red; font-weight: bold; display: none;"></span>
				</div>
				
				<!-- user_num -->
				<input type="hidden" class="inputform" name="user_num" id="user_num"
				value="<%=(String) session.getAttribute("user_num")%>">
			
		</div> <!-- st_info_insert -->
	</div>
	
	
	<!-- footer -->
	<div><c:import url="footer.jsp"></c:import></div>

	</form>
</div>

</body>
</html>