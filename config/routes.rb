Rails.application.routes.draw do

  get 'categories/index'
  get 'posts/index'
  get "/" => "home#top"
  get "/about" => "home#about"
  get "typings/edit" => "typings#edit"
  get "/typings" => "typings#index"
  get "/typings/result" => "typings#result"
  get "/categories/index" => "categories#index"

    resources :posts
    resources :categories 
    resources :characters ,only: [:show]
end
