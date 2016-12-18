Rails.application.routes.draw do

  resources :admins
  get 'sessions/new'

  resources :reports
  resources :people
  resources :police

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  post '/mlogin', to: 'msession#create'

  get '/sort_date', to: 'police#sortable'
  get '/sort_loc', to: 'police#sortablel'
  get '/sort_res', to: 'police#sortr'

  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
