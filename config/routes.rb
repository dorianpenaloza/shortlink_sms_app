Rails.application.routes.draw do
   root to: 'posts#index'
   get '/posts' => 'posts#index'
   get '/:short_url' => 'posts#redirect'
   post '/send_sms' => 'posts#send_sms'

   resources :posts
end
