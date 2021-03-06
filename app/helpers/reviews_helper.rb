module ReviewsHelper
  def self.display_ratings(reviews)
    if reviews.length == 0
      rating = 0
    else
      rating = reviews.inject(0)  do |sum,review|
        if (review.rating == nil|| review.rating > 5 || review.rating < 0)
        sum
        else
        sum + review.rating
        end
      end
      rating = rating / reviews.length
    end
    star_bad = "<span class='glyphicon glyphicon-star' aria-hidden='true' style='color:black' ></span>"
    star_good = "<span class='glyphicon glyphicon-star' aria-hidden='true' style='color:#EF651A' ></span>"
    star_good*rating+star_bad*(5-rating)
  end
end
