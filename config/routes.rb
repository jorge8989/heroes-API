Rails.application.routes.draw do
  namespace :api do
    resources :heroes
  end
end