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
	%>
	<form action="memberUpdate" method="post">
		<table>
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id"
					value="<%=session.getAttribute("loginid")%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>���</th>
				<td><input type="text" name="pw" value="${get.pw}"></td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name" value="${get.name}"></td>
			</tr>
		</table>
		<input type="submit" value="����">
		<input type="button" value="����" onclick="memeberDelete()">
		<input type="button" value="���" onclick="main()">
	</form>
	<%
		} else {
	%>
	<script>
			alert("�߸��� �����Դϴ�.");
			location.href="main";
		</script>
	<%
		}
	%>
	<script>
		function main() {
			location.href="main";
		}
		function memeberDelete() {
			location.href="memberDelete?id=<%=session.getAttribute("loginid")%>";
		}
	</script>
</body>
</html>