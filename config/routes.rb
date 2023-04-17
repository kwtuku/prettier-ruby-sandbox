Rails.application.routes.draw do
  root "home#index"

  devise_for :users,
             skip: %i[registrations],
             controllers: {
               invitations: "users/invitations",
             }
  devise_scope :user do
    resource :user_registration,
             controller: "devise_invitable/registrations",
             only: %i[edit update destroy],
             path: "users"
  end
  namespace :users do
    root "home#index"
    resources :questionnaires
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
