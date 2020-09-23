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

li {
	list-style: none;
	float: left;
}
</style>
</head>
<body>
	<section>

		<div>전체 페이지 번호 : ${count}</div>
		<table>
			<thead>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${count eq 0}">
						<tr>
							<td colspan="3" align="center">게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="fbBean" items="${list}">
							<tr>
								<td>${fbBean.idx}</td>
								<td><a href="freeDetail?idx=${fbBean.idx}">${fbBean.title}</td>
								<td>${fbBean.userId}</td>
								<td>${fbBean.rDate}</td>
								<td>${fbBean.hit}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<ul>
			<c:if test="${pageNum gt 10}">
				<li><a href="freeBoard?pageNum=1">&lt;&lt;</a></li>
				<li><a href="freeBoard?pageNum=${prevPage}">&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${start}" end="${end}" step="1">
				<c:choose>
					<c:when test="${i eq pageNum}">
						<li>[${i}]</li>
					</c:when>
					<c:otherwise>
						<li><a href="freeBoard?pageNum=${i}">[${i}]</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageNum lt 11 and count gt 100}">
				<li><a href="freeBoard?pageNum=${nextPage}">&gt;</a></li>
				<li><a href="freeBoard?pageNum=${pageCount}">&gt;&gt;</a></li>
			</c:if>
		</ul>
		<input type="button" value="글쓰기" onclick="freeWrite()">
		<input type="button" value="메인" onclick="main()">

		<script>
			function freeWrite() {
				location.href = "goFreeWrite";
			}

			function main() {
				location.href = "main";
			}
		</script>
</body>
</html>