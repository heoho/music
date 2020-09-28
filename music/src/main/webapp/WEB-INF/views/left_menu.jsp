<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="resources/css/left_menu.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="panel_left">
		<div class="panel_wrap">
			<div class="home">
				<a href="main">Ȩ</a>
			</div>
			<c:choose>
				<c:when test="${loginid eq null}">
					<div class="member">
						<a href="goMember">ȸ������</a>
					</div>
					<div class="login">
						<a href="goLogin">�α���</a>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<a href="logout">�α׾ƿ�</a>
					</div>
					<form action="getMember" method="post">
						<div class="memberUpdate">
							<input type="hidden" value="${loginid}" name="id"> 
							<input type="submit" value="����������" id="myPage">
						</div>
					</form>
				</c:otherwise>
			</c:choose>
			<div class="freeBoard">
				<a href="freeBoard">�Խ���</a>
			</div>
			<div class="memberList">
				<a href="memberList">ȸ�����</a>
			</div>
		</div>
	</div>
</body>
</html>