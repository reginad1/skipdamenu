class ItemsController < ApplicationController
   before_action :set_item

	def index
	 	@items = Item.all
    @review = Review.new
	end

	def show
	  @item = Item.find(params[:id])
	end

  def update
    @item = Item.find(params[:id])
    @review = @item.reviews.create!(body: params[:reviews][:body],rating: params[:reviews][:rating], user_id: current_user.id)
         
    redirect_to @item
  end

  def edit
    @item.reviews.build
  end 

  #  def update
  #   respond_to do |format|
  #     binding.pry
  #     current_user.id = @review.user_id 
  #     if @item.update(params)
  #       format.html { redirect_to @item, notice: 'item was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @item }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private

   def set_item
      @item = Item.find(params[:id])
    end

    def review_params
      params.require(:review).permit(body: params[:reviews][:body], user_id: current_user.id)
    end


end
