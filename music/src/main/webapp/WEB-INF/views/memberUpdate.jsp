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
		<c:when test="${loginid ne null}">
			<form action="memberUpdate" method="post">
				<table>
					<tr>
						<th>���̵�</th>
						<td><input type="text" name="id" value="${loginid}" readonly="readonly"></td>
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
		</c:when>
		<c:otherwise>
			<script>
			alert("�߸��� �����Դϴ�.");
			location.href="main";
		</script>
		</c:otherwise>
	</c:choose>
	<script>
		function main() {
			location.href="main";
		}
		function memeberDelete() {
			location.href="memberDelete?id=${loginid}";
		}
	</script>
</body>
</html>