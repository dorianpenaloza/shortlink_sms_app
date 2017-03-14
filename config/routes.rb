Rails.application.routes.draw do
   root to: 'posts#index'
  #  get 'post', to: 'posts#show'
  #  get 'show', to: :show, controller: 'posts'
   get '/posts' => 'posts#index'
   get '/:short_url' => 'posts#redirect'
   post '/send_sms' => 'posts#send_sms'

   resources :posts
  #  get 'urls/new'
  #  get 'urls/create'
  #  resources :urls, only: [:new, :create]

  resource :posts do
    collection do
      post 'reply'
    end
  end

end
