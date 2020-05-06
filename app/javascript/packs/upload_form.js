$(document).ready(() => {
var text = $("#text-area")
var input = $("#file-upload")

input.on("change", function(){
		var filename = $('#file-upload')[0].files[0].name;
    console.log(filename);
 		text.html(filename);
})

var allOptions = $('#selectprod option')

$('#selectcat').change(function () {
    $('#selectprod option').remove()
    var classN = $('#selectcat option:selected').prop('class');
    var opts = allOptions.filter('.' + classN);
    $.each(opts, function (i, j) {
        $(j).appendTo('#selectprod');
    });
});
});