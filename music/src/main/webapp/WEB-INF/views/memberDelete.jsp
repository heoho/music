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
		alert("�߸��� �����Դϴ�.");
		location.href = "main";
	</script>
	<%
		}
	%>
	<script>
		alert("���� �Ǿ����ϴ�.");
		location.href = "main";
	</script>
</body>
</html>