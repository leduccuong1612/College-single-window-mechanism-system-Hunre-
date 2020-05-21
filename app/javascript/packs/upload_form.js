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

$(document).on("click",".request",function(){
  $(this).each(function(){
  var data = $(this).attr('data-request')
    $.ajax({
        url:  "/demo_by_click",
        method: "get",
        data: { id: data }
    });
  });
});


$(function() {                      
  $("#pass").click(function() {  
    $(this).addClass("is-active");  
    $("#fail").remove("is-active");
    $("pass-form").remove("is-hidden");
    $("fail-form").add("is-hidden");
  });
});

$(function() {                      
  $("#fail").click(function() {  
    $(this).addClass("is-active");  
    $("#pass").remove("is-active");
    $("fail-form").remove("is-hidden");
    $("pass-form").add("is-hidden");
  });
});