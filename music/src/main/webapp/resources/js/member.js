$(document).ready(function() {
	$('.btn_ok').prop("disabled", true);
	$('tbody').children("tr").eq(8).hide();
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