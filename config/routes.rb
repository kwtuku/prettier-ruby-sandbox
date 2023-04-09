Rails.application.routes.draw do
  root "home#index"

  devise_for :users
  namespace :users do
    root "home#index"
    resources :users, only: %i[index]
  end

  devise_for :admins
  namespace :admins do
    root "home#index"
    devise_for :users,
               only: %i[invitations],
               controllers: {
                 invitations: "admins/users/invitations",
               }
    resources :users, only: %i[index]
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
