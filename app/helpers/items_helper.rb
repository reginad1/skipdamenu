module ItemsHelper
	def self.get_picture(item)
	  images = []
      item.reviews.each do |review|
        images << review.image
      end
   	 images
	end
end
