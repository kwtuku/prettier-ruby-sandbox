Rails.application.routes.draw do
  root "home#index"

  devise_for :users
  namespace :users do
    root "home#index"
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
