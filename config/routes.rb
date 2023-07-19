Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :categories
  resources :tasks

  get '/tailwindcss/base', to: redirect('/path/to/your/base.css')
  get '/tailwindcss/components', to: redirect('/path/to/your/components.css')
  get '/tailwindcss/utilities', to: redirect('/path/to/your/utilities.css')


  root "pages#home"
end
