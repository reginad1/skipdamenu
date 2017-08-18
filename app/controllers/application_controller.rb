class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # def facebook
  #    @user = User.from_omniauth(request.env["omniauth.auth"])
  #    sign_in_and_redirect @user      
  # end
end
