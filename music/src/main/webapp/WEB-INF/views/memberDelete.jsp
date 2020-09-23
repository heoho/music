<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		if (session.getAttribute("loginid") != null) {
			session.invalidate();
		} else {
	%>
	<script>
		alert("잘못된 접근입니다.");
		location.href = "main";
	</script>
	<%
		}
	%>
	<script>
		alert("삭제 되었습니다.");
		location.href = "main";
	</script>
</body>
</html>