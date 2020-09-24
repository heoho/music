<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${get.userId eq loginid}">
			<form action="freeUpdate" method="post">
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
						<td><input type="text" name="title" value="${get.title}"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><input type="text" name="contents" value="${get.contents}"></td>
					</tr>
				</table>
				<input type="hidden" name="idx" value="${get.idx}">
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="freeBoard()">
			</form>
		</c:when>
		<c:otherwise>
			<script>
				alert("잘못된 접근입니다.");
				location = "main";
			</script>
		</c:otherwise>
	</c:choose>
	<script>
		function freeBoard() {
			location = "freeBoard";
		}
	</script>
</body>
</html>