$(document).ready(() => {
	var text = $("#text-area");
	var input = $("#file-upload");

	input.on("change", () => {
		var filename = $("#file-upload")[0].files[0].name;
		console.log(filename);
		text.html(filename);
	});
});

$(function () {
	$("select#request_department_id").on("change", () => {
		$.ajax({
			url: "/document_by_department",
			method: "get",
			data: { selected_department: $("select#request_department_id").val() },
		});
	});
});

$(function () {
	$("select#request_document_id").on("change", () => {
		$.ajax({
			url: "/info_by_document",
			method: "get",
			data: { selected_document: $("select#request_document_id").val() },
		});
	});
});

$(document).on("click", ".request", function () {
	$(this).each(function () {
		var data = $(this).attr("data-request");
		$.ajax({
			url: "/demo_by_click",
			method: "get",
			data: { id: data },
		});
	});
});
var _changeInterval = null;

$(document).ready(() => {
	$("#search").on("keyup", function () {
		clearInterval(_changeInterval);
		_changeInterval = setInterval(function () {
			var str = $("#search").val();
			console.log(str);
			$.ajax({
				url: "search_document",
				method: "get",
				data: { key: str },
			});
			clearInterval(_changeInterval);
		}, 1000);
	});
});

$(document).ready(() => {
  $("#failform").hide();
  $("#pass").css('color', 'red');

  $("#pass").click(function() {
    $("#failform").hide();
    $("#passform").show();
    $(this).css('color', 'blue');
    $("#fail").css('color', 'black');
  });

  $( "#fail" ).click(function() {
    $("#passform").hide();
    $("#failform").show();
    $(this).css('color', 'blue');
    $("#pass").css('color', 'black');
  });
})