class RestaurantsController < ApplicationController

	def show
		@restaurant = Restaurant.find(params[:id])
    @menu = Item.where(restaurant_id:params[:id]).includes(:reviews)
	end

end
