$(document).ready(() => {
var text = $("#text-area")
var input = $("#file-upload")

input.on("change", () => {
		var filename = $('#file-upload')[0].files[0].name;
    console.log(filename);
 		text.html(filename);
})
});
$(function() {
  $("select#request_department_id").on("change",() => {
      $.ajax({
          url:  "/document_by_department",
          method: "get",
          data: { selected_department: $("select#request_department_id").val() }
      });
  });
});
