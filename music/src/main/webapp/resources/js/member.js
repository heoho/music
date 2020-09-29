$(document).ready(function() {
	$('tbody').children("tr").eq(8).hide();
	$('.btn_ok').prop("disabled", true);
	$(".idCheck").click(function() {
		var params = "id=" + $("input[name=id]").val();
		$.ajax({
			type: "POST",
			url: "Ajaxtmpok",
			data: params,
			dataType: "json", //받는 type은 json방식
			success: function(args) { // 결과값이 json방식으로 args로 들어온 상태
				$(".result").html(args.result);
				if ($(".result").html() == "사용할 수 있는 아이디 입니다.") {
					$('.btn_ok').addClass('btn_ok2');
					$('.btn_ok2').removeClass('btn_ok');
					$('.btn_ok2').prop("disabled", false);
				} else {
					$('.btn_ok2').addClass('btn_ok');
					$('.btn_ok').removeClass('btn_ok2');
					$('.btn_ok').prop("disabled", true);
				}
			},
			error: function(args) {
				$(".result").html(args.responseText + "<br>에러 발생!");
			}
		});
	});

	$("input[name=pw_check]").keyup(function() {
		var text = "비밀번호가 일치합니다";
		var text02 = "비밀번호가 일치하지 않습니다";
		var a = $("input[name=pw]").val();
		var b = $("input[name=pw_check]").val();
		if (a == b) {
			$(".result03").text(text);
		} else {
			$(".result03").text(text02);
		}
	});

	$('.certification').click(function() {
		$('tbody').children("tr").eq(8).show();
	});
	$(".d_email").change(function() {
		var optioniValue = $(".d_email option:selected").val();
		if (optioniValue != "0") {
			$(".input_email").val(optioniValue);
			$(".input_email").prop("readonly", true);
		}
		else {
			$(".input_email").val('');
			$(".input_email").prop("readonly", false);
		}
	});
});