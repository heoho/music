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
	<table>
		<tr>
			<th>�ۼ���</th>
			<td>${get.userId}</td>
		</tr>
		<tr>
			<th>�ۼ���</th>
			<td>${get.rDate}</td>
		</tr>
		<tr>
			<th>��ȸ��</th>
			<td>${get.hit}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${get.title}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${get.contents}</td>
		</tr>
	</table>
	<input type="button" value="�Խ���" onclick="freeBoard()">
	<script>
		function freeBoard() {
			location = "freeBoard";
		}
	</script>
</body>
</html>