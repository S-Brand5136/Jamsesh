Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do

  end

  resources :sessions do 

  end

  resources :users_in_sessions, path: "attendees" do

  end
end
