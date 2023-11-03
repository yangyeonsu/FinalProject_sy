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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function moveClose() {
	  opener.location.href="stdetailmodify.action?st_num="+${param.st_num};
	  self.close();
	}

</script>
</head>
<body>
아직 가게 상세페이지를 입력하지 않았습니다. 가게상세페이지로 가시겠습니까?
<input type="button" value="아니요" onclick="self.close()" />
<input type="button" value="예" onclick="moveClose()" />
</body>
</html>