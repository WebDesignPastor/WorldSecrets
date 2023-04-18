Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources "itineraries", only: %i[index show create] do
    resources "trips", only: :create
  end

  # get 'itineraries', to: 'itineraries#rating', as: 'rating'

  resources "trips", only: %i[show create update] do
    resources "questions", only: :index do
      # resources "itineraries", only: :update
      # member do
      #   post 'rate/:rating_value', to: 'questions#rate', as: 'rate'
      # end
      patch 'update_rates_one', to: 'itineraries#update_rates_one'
      patch 'update_rates_two', to: 'itineraries#update_rates_two'
      patch 'update_rates_three', to: 'itineraries#update_rates_three'
      patch 'update_rates_four', to: 'itineraries#update_rates_four'
      patch 'update_rates_five', to: 'itineraries#update_rates_five'
    end
    resources "trip_answers", only: :create
  end

  # patch "questions/:question_id/itineraries/:id", to: "itineraries#update_rating"

  resources "pois", only: :show
end
