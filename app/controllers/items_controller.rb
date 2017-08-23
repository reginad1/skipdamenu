class ItemsController < ApplicationController
   # before_action :set_item

   def index
    @generic_austin = {latitude: 30.2915328, longitude: -97.7688358}
    @items = Item.all
    @review = Review.new
    @restaurants = []

    if params[:search]
      @items = Item.includes(:restaurant,:reviews).search(params[:search]).sort
    else
      @items = Item.all.order("created_at DESC")
    end
   
    @items.each do |item|
      @restaurants << item.restaurant
    end
    
    @restaurants = @restaurants.uniq
	end

	def show
	  @item = Item.includes(:restaurant,:reviews).find(params[:id])
    if current_user
      @check = Review.where(["item_id = ? and user_id = ?",params[:id],current_user.id])
    else
      @check = [0]
    end
	end
  
 end

 def update
  # @item = Item.find(params[:id])
  # @check = Review.where(["item_id = ? and user_id = ?",params[:id],current_user.id])
  # binding.pry

  # if @check.length == 0
  #   if params[:review][:image] == null
  #     @review = @item.reviews.create!(body: params[:review][:body],rating: params[:review][:rating], user_id: current_user.id)
  #   else
  #     @review = @item.reviews.create!(params[:review])
  #     @review.user = current_user
  #   end 
  #   if request.xhr?
  #     render json: @review.to_json
  #   else
  #     redirect_to @item
  #   end
  # else
  #   render :json => { :errors => "FAIL YOU HACKER!!!" }, :status => 422
  # end
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

   def item_params
     params.require(:item).permit(:name, :price, :description)
   end
   # def set_item
   #    @item = Item.find(params[:id])
   #  end

    # def review_params
    #   params.require(:reviews).permit(reviews_attributes: [:body,:rating])
    # end


end
