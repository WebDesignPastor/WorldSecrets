Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources "itineraries", only: %i[index show create] do
    resources "trips", only: :create
  end

  resources "trips", only: %i[show create update] do
    resources "questions", only: :index
    resources "trip_answers", only: :create
  end

  resources "pois", only: :show


    # Defines the root path route ("/")
  # root "articles#index"
end
