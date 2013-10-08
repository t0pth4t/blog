Blog::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}

  resources :posts   do
    resources :comments
  end

  root to: "posts#index"
end