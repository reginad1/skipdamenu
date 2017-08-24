$(document).ready(function() {
	$("#review_form").hide();
	$("#add_item_form").hide();

	$("#add-review-button").click(function(event) {
		event.preventDefault()
		$(this).hide();
		$("#review_form").show();
	})

	$("#review_form").on('submit',function(event) {
		event.preventDefault();
		$form = $(this)
		var formData = new FormData()
		var $input = $("#review_image")
		formData.append('review[image]',$input[0].files[0]);
		$form.serializeArray().forEach(function(obj, i ){  formData.append(obj.name, obj.value) })


		$.ajax({
			url:$form.attr('action'),
			method:$form.attr('method'),
			data: formData,
		  cache: false,
		  contentType: false,
		  processData: false,
		})
	.done(function(response) {
		skeleton = $(".review-skeleton").removeAttr('style').removeClass().addClass("review-display")
		$(skeleton).find("#review").html(response.body)
		$(skeleton).find("#rating").html(response.rating)
		$(skeleton).find("#user").html(current_user)
		if(response.image.url != null){
		imageTag = `<img src=${response.image.url} class="reviews-picture">`
		$(skeleton).find("#image").html(imageTag)
		}
		// console.log (response.image)
		// console.log(imageTag)
		$(".all-review-container").append(skeleton)
		$form.trigger('reset')
		$("#review_form").hide();
	})
	.fail(function(response){
		$("#review_form").hide();
	})
})

})

		// imageTag = `<img src=${response.image} >`
