<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="memberUpdate" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"
					value="<%=session.getAttribute("loginid")%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>비번</th>
				<td><input type="text" name="pw" value="${get.pw}"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${get.name}"></td>
			</tr>
		</table>
		<input type="hidden" name="idx" value="${get.idx}"> <input
			type="submit" value="수정"> <input type="button" value="삭제"
			onclick="memeberDelete()"> <input type="button" value="취소"
			onclick="main()">
	</form>
	<script>
		function main() {
			location.href="main";
		}
		function memeberDelete() {
			location.href="memberDelete?id=<%=session.getAttribute("loginid")%>";
		} 
	</script>
</body>
</html>