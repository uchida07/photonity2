Rails.application.routes.draw do
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
  end

  scope module: :public do
    root "homes#top"
    resource :members
     get 'members/edit_member' => 'members#edit', as: :edit_member
    resources :posts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
