class RestaurantsController < ApplicationController

	def show
		@restaurant = Restaurant.find(params[:id])
    @menu = Item.where(restaurant_id:params[:id]).includes(:reviews)
	end

  def update
    restaurant = Restaurant.find(map_params[:id])
    restaurant.google_id = map_params[:map]
    restaurant.save
  end
  private
    def map_params
      params.permit(:map,:id)
    end
end
