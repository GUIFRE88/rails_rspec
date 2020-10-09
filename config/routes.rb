Rails.application.routes.draw do
 
  resources :carros

  get "/cachorros", to: "cachorros#index"

end
