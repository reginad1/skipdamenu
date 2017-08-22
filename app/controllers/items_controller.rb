class ItemsController < ApplicationController
   # before_action :set_item

	def index
    @generic_austin = {latitude: 30.2915328, longitude: -97.7688358}
	 	@items = Item.all
    @review = Review.new
    if params[:search]
      @items = Item.search(params[:search]).sort
    else
      @items = Item.all.order("created_at DESC")
    end
	end

	def show
	  @item = Item.find(params[:id])
	end

  def update
    @item = Item.find(params[:id])
    @review = @item.reviews.create!(body: params[:reviews][:body],rating: params[:reviews][:rating], user_id: current_user.id) 
    if request.xhr?
      render json: @review.to_json
    else
      redirect_to @item
    end 
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

   # def set_item
   #    @item = Item.find(params[:id])
   #  end

    # def review_params
    #   params.require(:reviews).permit(reviews_attributes: [:body,:rating])
    # end


end
