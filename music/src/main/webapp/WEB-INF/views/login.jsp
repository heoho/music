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
		if (session.getAttribute("loginid") == null) {
	%>
	<section>
		<form action="login" method="post">
			<table>
				<tr>
					<th>���̵�</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>���</th>
					<td><input type="password" name="pw"></td>
				</tr>
			</table>
			<input type="submit" value="�α���">
			<input type="button" value="ȸ������" onclick="member()">
			<input type="button" value="���" onclick="main()">
		</form>
	</section>
	<%
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
		function main() {
			location = "main";
		}
		function member() {
			location = "goMember";
		}
	</script>
</body>
</html>