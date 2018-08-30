Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: "registrations" }
  #devise_for :users
  resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'movies' => 'movies#index'
get 'movie' => 'movies#single'
get 'genre' => 'movies#genre'
get 'profile' => 'profiles#profile'
post 'addmovie' => 'users#addmovie', as: 'addmovie'
post 'top_movies' => 'users#top_movies', as: 'top_movies'
root 'movies#home'

end
