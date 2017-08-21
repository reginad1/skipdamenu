$(document).ready(function() {
	$("#review_form").hide();
	$("#add-review-button").click(function(event) {
		event.preventDefault()
		console.log("hello")
		$(this).hide();
		$("#review_form").show();
	})

	$("#review_form").on('submit',function(event) {
		event.preventDefault();


		console.log("WHYYY");

		$form = $(this)
// 	event.preventDefault();
// 	event.preventDefault();
// 	event.preventDefault();
// 	// var data = $form.serialize()
// 	// console.log(data)

//     // var reviewBody = $("#review-body").val();
//     // var reviewRate = $("#review-rating").val();
//     // var data = ({body: reviewBody, rating: reviewRate})
//     // console.log(data)

	$.ajax({
		url:$form.attr('action'),
		method:$form.attr('method'),
		data: $form.serialize()
	})
	.done(function(response) {
		console.log(response)
		displayReviews(response)
		// console.log($form)
	})
	function displayReviews(reviews) {
		$.get("assets/javascripts/templates/review.mst", function(template){
			for (var i = 0; i < reviews.length; i++) {
				var reviewsList = Mustache.to_html(template, reviews[i]);
				$(".review-container ul").append(reviewsList)
			}
		})
	}

// })

})
})

