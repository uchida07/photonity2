Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  devise_for :member, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root "homes#top"
    resources :members
    resources :posts
  end

  scope module: :public do
    root "homes#top"
    resources :members
     #get 'members/edit_member' => 'members#edit', as: :edit_member
    resources :posts, only: [:new, :index, :show, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :replies, only: [:create, :destroy]
    end
    get "search_tag" => "posts#search_tag"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
