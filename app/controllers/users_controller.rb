class UsersController < ApplicationController

	def index
	end

	def show
		@user = User.find(params[:id])
	end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    @user.geocode
    else
      render 'edit'
    end
  end

private

 def user_params
   params.require(:user).permit(:city, :zip, :name)
 end

end

