class ItemsController < ApplicationController

	def index
	 	@items = Item.all
    @review = Review.new
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
