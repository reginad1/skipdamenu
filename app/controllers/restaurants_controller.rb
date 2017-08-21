class RestaurantsController < ApplicationController

	def show
		@restaurant = Restaurant.find(params[:id])
    @menu = @restaurant.items
	end

end
