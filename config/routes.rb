Rails.application.routes.draw do

 devise_for :users, controllers: {
        :omniauth_callbacks => "users/omniauth_callbacks"
      }

root 'items#index'

 devise_scope :user do
 	
 get 'sign_in' , :to => 'devise/sessions#new', :as => :new_user_session_path
 #delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session

end

     
     resources :items
     resources :users
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
