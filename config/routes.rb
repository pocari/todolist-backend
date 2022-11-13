# frozen_string_literal: true

Rails.application.routes.draw do
  # ブラウザからのPreFlightを処理する
  match '*path' => 'pre_flight#handle_pre_flight', via: :options

  resources :todo_items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
