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
				<a href="main">홈</a>
			</div>
			<c:choose>
				<c:when test="${loginid eq null}">
					<div class="member">
						<a href="goMember">회원가입</a>
					</div>
					<div class="login">
						<a href="goLogin">로그인</a>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<a href="logout">로그아웃</a>
					</div>
					<form action="getMember" method="post">
						<div class="memberUpdate">
							<input type="hidden" value="${loginid}" name="id"> 
							<input type="submit" value="마이페이지" id="myPage">
						</div>
					</form>
				</c:otherwise>
			</c:choose>
			<div class="freeBoard">
				<a href="freeBoard">게시판</a>
			</div>
			<div class="memberList">
				<a href="memberList">회원목록</a>
			</div>
		</div>
	</div>
</body>
</html>