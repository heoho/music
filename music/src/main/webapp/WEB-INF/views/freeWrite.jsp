<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>

	<%
		if (session.getAttribute("loginid") == null) {
	%>
	<script>
		alert("�α����ϼ���.");
		location.href = "goLogin";
	</script>
	<%
		} else {
	%>
	<form action="freeWrite" method="post">
		<table>
			<tr>
				<th>�ۼ���</th>
				<td><input type="hidden" name="userId"
					value="<%=session.getAttribute("loginid")%>"> <%=session.getAttribute("loginid")%>
				</td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><textarea name="contents"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="�۾���"> <input type="submit"
			value="���" onclick="freeBoard()">
	</form>
	<%
		}
	%>
	<script>
		function freeBoard() {
			location.href = "main";
		}
	</script>
</body>
</html>