Rails.application.routes.draw do
  root 'photos#index'
  resources :comments
  
  devise_for :users
  resources :photos do
  resources :comments
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"


      # match "/photos/comment" => "photos#comment", :as => "comment_to_photo", :via => [:post]


    # resources :comments, :only => [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
