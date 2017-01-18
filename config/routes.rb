Rails.application.routes.draw do
   get 'urls/new'

   get 'urls/create'

   resources :posts

   resources :urls, only: [:new, :create]

   root to: 'posts#index'

end
