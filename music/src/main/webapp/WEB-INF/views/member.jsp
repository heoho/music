<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<link href="resources/css/member.css" rel="stylesheet" type="text/css">
<style>
* {
	margin: 0;
	padding: 0;
	font-family: 'NotoKR', Sans-serif;
}

a {
	text-decoration: none;
}

body {
	background-color: #161616;;
}

.member {
	border-right: 5px solid #fff;
}
</style>
</head>
<body>
	<jsp:include page="left_menu.jsp" />
	<section class="contents">
		<h1 class="title">ȸ������ �Է�</h1>
		<c:choose>
			<c:when test="${loginid eq null}">
				<form action="member" method="post">
					<table class="write_tb">
						<col style="width: 20%;">
						<tbody>
							<tr>
								<th>���̵� *</th>
								<td><input type="text" name="id" class="input_member">
									<input type="button" class="idCheck" value="�ߺ�üũ">
									<div class="result"></div></td>
							</tr>
							<tr>
								<th>��й�ȣ *</th>
								<td><input type="text" name="pw" class="input_member"></td>
							</tr>
							<tr>
								<th>��й�ȣ Ȯ�� *</th>
								<td><input type="text" name="pw_check" class="input_member"></td>
							</tr>
							<tr>
								<th>�̸� *</th>
								<td><input type="text" name="name" class="input_member"></td>
							</tr>
							<tr>
								<th>������� *</th>
								<td><input type="text" class="input_member" name="day"
									placeholder="��)940201">
									<div class="birthday d_radio">
										<input type="radio" id="Lunar" name="calendar" value="S"
											checked> <label for="Lunar">���</label> <input
											type="radio" id="solar" name="calendar" value="L"> <label
											for="solar">����</label>
									</div></td>
							</tr>
							<tr>
								<th>���� *</th>
								<td class="d_radio"><input type="radio" id="m" name="gen"
									value="M" checked> <label for="m">����</label> <input
									type="radio" id="w" name="gen" value="F"> <label
									for="w">����</label></td>
							</tr>
							<tr>
								<th>�̸��� *</th>
								<td><input type="text" class="input_member" name="email1">@
									<input type="text" class="input_member input_email"
									name="email2"> <select class="input_member d_email"
									name="email3">
										<option value="0">�����Է�</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="hanmail.com">hanmail.com</option>
										<option value="korea.com">korea.com</option>
								</select></td>
							</tr>
							<tr>
								<th>�޴��� *</th>
								<td><input type="text" class="input_member" name="tel"
									placeholder="��)01012345678"> <input type="button"
									class="certification" value="������ȣ����"></td>
							</tr>
							<tr>
								<th>������ȣ</th>
								<td><input type="text" class="input_member" name="number">
									<input type="button" class="certification_ok" value="Ȯ��">
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_area">
						<input type="submit" value="ȸ������" class="btn_ok">
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<script>
					alert("�߸��� �����Դϴ�.");
					location.href = "main";
				</script>
			</c:otherwise>
		</c:choose>
	</section>
	<script src="resources/js/member.js"></script>
	<script>
		function main() {
			location = "main";
		}

		$(function() {
			$(".idCheck").click(function() {
				var params = "id=" + $("input[name=id]").val();
				$.ajax({
					type : "POST",
					url : "Ajaxtmpok",
					data : params,
					dataType : "json", //�޴� type�� json���
					success : function(args) { // ������� json������� args�� ���� ����
						if (args.result == "����� �� �ִ� ���̵� �Դϴ�.") {
							$(".result").html(args.result);
							$('.btn_ok').addClass('btn_ok2');
							$('.btn_ok2').removeClass('btn_ok');
							$('.btn_ok2').prop("disabled", false);
						} else {
							$(".result").html(args.result);
							$('.btn_ok2').addClass('btn_ok');
							$('.btn_ok').removeClass('btn_ok2');
							$('.btn_ok').prop("disabled", true);
						}
					},
					error : function(args) {
						$(".result").html(args.responseText + "<br>���� �߻�!");
					}
				});
			});
		});
	</script>
</body>
</html>