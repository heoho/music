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

		<div>��ü ������ ��ȣ : ${count}</div>
		<table>
			<thead>
				<th>��ȣ</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>�ۼ���</th>
				<th>��ȸ��</th>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${count eq 0}">
						<tr>
							<td colspan="3" align="center">�Խñ��� �����ϴ�.</td>
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
		<input type="button" value="�۾���" onclick="freeWrite()">
		<input type="button" value="����" onclick="main()">

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