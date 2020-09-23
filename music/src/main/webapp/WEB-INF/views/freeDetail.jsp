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
			<th>작성자</th>
			<td>${get.userId}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${get.rDate}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${get.hit}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${get.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${get.contents}</td>
		</tr>
	</table>
	<input type="button" value="게시판" onclick="freeBoard()">
	<script>
		function freeBoard() {
			location = "freeBoard";
		}
	</script>
</body>
</html>