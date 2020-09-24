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
	<c:choose>
		<c:when test="${loginid eq null}">
			<script>
				alert("�α����ϼ���.");
				location.href = "goLogin";
			</script>
		</c:when>
		<c:otherwise>
			<form action="freeWrite" method="post">
				<table>
					<tr>
						<th>�ۼ���</th>
						<td>
							<input type="hidden" name="userId" value="${loginid}">
							${loginid}
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
				<input type="submit" value="�۾���">
				<input type="button" value="���" onclick="freeBoard()">
			</form>
		</c:otherwise>
	</c:choose>
	<script>
		function freeBoard() {
			location.href = "main";
		}
	</script>
</body>
</html>