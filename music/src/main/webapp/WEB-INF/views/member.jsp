<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="member" method="post">
		<table>
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>���</th>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name"></td>
			</tr>
		</table>
		<input type="submit" value="ȸ������"> <input type="button"
			value="���" onclick="main()">
	</form>

	<script>
		function main() {
			location = "main";
		}
	</script>
</body>
</html>