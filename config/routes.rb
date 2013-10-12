Blog::Application.routes.draw do

  mount Rich::Engine => '/rich', :as => 'rich'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}

  resources :posts   do
    resources :comments
  end

  root to: "posts#index"
end