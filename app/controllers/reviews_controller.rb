class ReviewsController < ApplicationController
	def index
		@reviews = Review.all
	end 

	def new 
		@review = Review.new
	end 

	def update
		binding.pry
	end

	def create
		@item = Item.find(params[:item_id])
		@check = Review.where(["item_id = ? and user_id = ?",params[:id],current_user.id])
			


		if @check.length == 0
			if params[:review][:image] == "undefined"
				@review = @item.reviews.create!(body: params[:review][:body],rating: params[:review][:rating], user_id: current_user.id)
			else
				@image = Cloudinary::Uploader.upload(params[:review][:image])
				@review = @item.reviews.create!(body: params[:review][:body],rating: params[:review][:rating], user_id: current_user.id, image: params[:review][:image])
			end 
			if request.xhr?
				# binding.pry 
				thing = @review.image.url
				render json: @review.to_json
							 thing.to_json
			else
				redirect_to @item
			end
		else
			render :json => { :errors => "FAIL YOU HACKER!!!" }, :status => 422
		end
		

		# respond_to do |format|
		# 	if @review.save
		# 		format.html {redirect_to @review, notice: 'Review was successfully created.'}
		# 		format.json {render :show, status: :created, location: @review }
		# 	else 
		# 		format.html {render :new }
		# 		format.json {render json: @review.errors, status: :unprocessable_entity}
		# 	end 
		# end 
	
end


	end	# @review = Review.new(review_params)
