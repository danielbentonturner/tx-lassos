$(document).on('ready', function() {
	$(".comments-area").show();
	$("#text-area").hide();
	$(".social-form").hide();
	$(".top-form").hide();


	$("#comm").on('click', function(e) {
		e.preventDefault;
		$(".comments-area").hide();
		$("#comm").hide();
		$("#text-area").fadeIn();

	});

	$("#con").on('click', function(e) {
		e.preventDefault;
		$(".visible-social").hide();
		$("#con").hide();
		$(".social-form").fadeIn();
	});

	$("#main").on('click', function(e) {
		e.preventDefault;
		$(".professional").hide();
		$(".profile-main").hide();
		$("#main").hide();
		$(".top-form").fadeIn();

		
	});

	
});

