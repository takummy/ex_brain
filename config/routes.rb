Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: :show
  resources :books, shallow: true do
    resources :questions
  end
  resources :lessons, only: %i(new create), shallow: true do
    resources :lesson_questions
  end
end