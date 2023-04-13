Rails.application.routes.draw do
  get 'posts/index'
  get "/" => "home#top"
  get "/about" => "home#about"
  get "typings/edit" => "typings#edit"
  get "/typings" => "typings#index"
  get "/typings/result" => "typings#result"


    resources :posts
end
