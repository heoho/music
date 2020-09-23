<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

section {
	margin-left: 310px;
	height: 100vh;
	background: url(resources/img/class.jpg) no-repeat;
	background-size: cover;
}

a {
	text-decoration: none;
}

table, th, td {
	border: 1px solid black;
}

.panel_left {
	position: fixed;
	background-color: #000;
	height: 100vh;
	width: 310px;
}

.panel_wrap {
	padding-top: 300px;
	text-align: center;
}

.panel_wrap div {
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #777;
}

.panel_wrap div:first-child {
	border-top: 1px solid #666;
}

.panel_wrap div a {
	color: #fff;
	font-size: 22px;
	font-weight: 700;
}

.panel_wrap div a:hover {
	color: #fff;
	text-decoration: underline;
}

.active {
	border-right: 5px solid #fff;
}

#myPage {
	background-color: #000;
	color: #fff;
	font-size: 22px;
	font-weight: 700;
	cursor: pointer;
	border: 0;
}

#myPage:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="panel_left">
		<div class="panel_wrap">
			<%
				if (session.getAttribute("loginid") == null) {
			%>
			<div class="active">
				<a href="goMember">회원가입</a>
			</div>
			<div>
				<a href="goLogin">로그인</a>
			</div>
			<%
				} else {
			%>
			<div>
				<a href="logout">로그아웃</a>
			</div>
			<form action="getMember" method="post">
				<div>
					<input type="hidden" value="<%=session.getAttribute("loginid")%>" name="id">
					<input type="submit" value="마이페이지" id="myPage">
				</div>
			</form>
			<%
				}
			%>
			<div>
				<a href="freeBoard">게시판</a>
			</div>
			<div>
				<a href="memberList">회원목록</a>
			</div>
		</div>
	</div>

	<section></section>
</body>
</html>