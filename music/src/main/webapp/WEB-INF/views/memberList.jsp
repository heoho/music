<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<thead>
			<tr>
				<th>��ȣ</th>
				<th>���̵�</th>
				<th>�̸�</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="memberBean" items="${list}">
				<tr>
					<td>${memberBean.idx}</td>
					<td>${memberBean.id}</td>
					<td>${memberBean.name}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="button" value="����" onclick="main()">
	
	<script>
		function main() {
			location.href="main";
		}
	</script>
</body>
</html>