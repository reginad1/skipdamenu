class ItemsController < ApplicationController

	def index
	 	@items = Item.all
    @review = Review.new
    if params[:search]
      @items = Item.search(params[:search]).sort
    else
      @items = Item.all.order("created_at DESC")
    end
	end

  def add
    @item = Item.new(recipe_params)
    if @item.save
      redirect_to @item
    else
      render action: 'new'
    end
  end

	def show
	  @item = Item.find(params[:id])
	end

  def new
    @item = Item.new
    @item.reviews.build
  end

  private

    def item_params
      params.require(:item).permit(review_attributes: [:body])
    end
end
