$(document).ready(function() {
	$("#review_form").hide();
	$("#add-review-button").click(function(event) {
		event.preventDefault()
		$(this).hide();
		$("#review_form").show();
	})

	$("#review_form").on('submit',function(event) {
		event.preventDefault();
		$form = $(this)

		$.ajax({
			url:$form.attr('action'),
			method:$form.attr('method'),
			data: $form.serialize()
		})
	.done(function(response) {
		console.log("it worked correctly?")
		skeleton = $(".review-skeleton").removeAttr('style').removeClass().addClass("review-display")
		$(skeleton).find("#review").html(response.body)
		$(skeleton).find("#rating").html(response.rating )
		$(skeleton).find("#user").html(current_user)
		$(".all-review-container").append(skeleton)
		$form.trigger('reset')
		$("#review_form").hide();
	})
	.fail(function(response){
		console.log(response)
		console.log("DDIDIDIDI THIS WORK?")
		$("#review_form").hide();
	})


	})
})

