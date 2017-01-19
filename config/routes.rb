Rails.application.routes.draw do
   root to: 'posts#index'
   get 'urls/new'
   get 'urls/create'
   resources :posts
   resources :urls, only: [:new, :create]
   post '/send_sms' => 'posts#send_sms'
end
