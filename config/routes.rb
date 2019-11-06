# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :github do
        resources :repositories, only: %i[index show]
      end
    end
  end
end
