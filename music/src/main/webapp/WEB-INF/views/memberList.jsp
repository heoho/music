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
	<div>전체 페이지 번호 : ${count}</div>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${count eq 0}">
					<tr>
						<td colspan="3" align="center">게시글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="memberBean" items="${list}">
						<tr>
							<td>${memberBean.idx}</td>
							<td>${memberBean.id}</td>
							<td>${memberBean.name}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<ul>
		<c:if test="${pageNum gt 10}">
			<li><a href="memberList?pageNum=1">&lt;&lt;</a></li>	
			<li><a href="memberList?pageNum=${prevPage}">&lt;</a></li>
		</c:if>
		<c:forEach var="i" begin="${start}" end="${end}" step="1">
			<c:choose>
				<c:when test="${i eq pageNum}">
					<li>[${i}]</li>
				</c:when>
				<c:otherwise>
					<li><a href="memberList?pageNum=${i}">[${i}]</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageNum lt 11 and count gt 100}">
			<li><a href="memberList?pageNum=${nextPage}">&gt;</a></li>
			<li><a href="memberList?pageNum=${pageCount}">&gt;&gt;</a></li>
		</c:if>
	</ul>
	<input type="button" value="메인" onclick="main()">

	<script>
		function main() {
			location.href = "main";
		}
	</script>
</body>
</html>