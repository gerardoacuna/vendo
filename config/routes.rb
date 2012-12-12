Vendo::Application.routes.draw do

	%w[precios templates].each do |page|
    match page, controller: "site/info", action: page
  end

  authenticated :user do
    root :to => 'site/home#index'
  end

  root :to => "site/home#index"

  devise_for :users
  resources :users

end