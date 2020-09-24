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
							<th>아이디</th>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<th>비번</th>
							<td><input type="password" name="pw"></td>
						</tr>
					</table>
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="member()">
					<input type="button" value="취소" onclick="main()">
				</form>
			</section>
		</c:when>
		<c:otherwise>
			<script>
				alert("잘못된 접근입니다.");
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