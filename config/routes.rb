# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :github do
        resources :repositories, only: %i[index show]

        get '/refresh', to: 'repositories#refresh_page'
      end
    end
  end
end
