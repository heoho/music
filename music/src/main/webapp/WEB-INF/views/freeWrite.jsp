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
		alert("로그인하세요.");
		location.href = "goLogin";
	</script>
	<%
		} else {
	%>
	<form action="freeWrite" method="post">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="hidden" name="userId"
					value="<%=session.getAttribute("loginid")%>"> <%=session.getAttribute("loginid")%>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="contents"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="글쓰기"> <input type="submit"
			value="취소" onclick="freeBoard()">
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