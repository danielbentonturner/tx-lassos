$(document).on('ready', function() {
	$(".comments-area").show();
	$("#text-area").hide();
	$(".social-form").hide();

	$("#comm").on('click', function(e) {
		e.preventDefault;
		$(".comments-area").hide();
		$("#comm").hide();
		$("#text-area").show();
		$('#comm-save').addClass("btn btn-primary")
	});

	$("#con").on('click', function() {
		$(".social-form").show();
		$(".visible-social").hide();
		$("#con").hide();
	});

	
});

