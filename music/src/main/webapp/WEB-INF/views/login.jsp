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
		<c:when test="${loginid eq null}">
			<section>
				<form action="login" method="post">
					<table>
						<tr>
							<th>���̵�</th>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<th>���</th>
							<td><input type="password" name="pw"></td>
						</tr>
					</table>
					<input type="submit" value="�α���">
					<input type="button" value="ȸ������" onclick="member()">
					<input type="button" value="���" onclick="main()">
				</form>
			</section>
		</c:when>
		<c:otherwise>
			<script>
				alert("�߸��� �����Դϴ�.");
				location.href = "main";
			</script>
		</c:otherwise>
	</c:choose>
	<script>
		function main() {
			location = "main";
		}
		function member() {
			location = "goMember";
		}
	</script>
</body>
</html>