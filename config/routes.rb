Rails.application.routes.draw do

 devise_for :users, controllers: {
        :omniauth_callbacks => "users/omniauth_callbacks"
      }

root 'welcome#index'

 devise_scope :user do

 get 'sign_in' , :to => 'devise/sessions#new', :as => :new_user_session_path
 #delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session

end


     resources :items do
     	resources :reviews
     end
     resources :users
     resources :restaurants, only: [:show,:update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
