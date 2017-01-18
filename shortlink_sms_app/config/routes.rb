Rails.application.routes.draw do
   get 'urls/new'
#
   get 'urls/create'
#
   resources :posts
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end
#
# BitlyExample::Application.routes.draw do
  resources :urls, only: [:new, :create]
  root to: 'urls#new'
end
