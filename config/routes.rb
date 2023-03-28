Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources "itineraries", only: %i[index show create] do
    resources "trips", only: :create
  end

  resources "trips", only: %i[show create update] do
    resources "questions", only: :index  do
      member do
        post 'rate/:rating_value', to: 'questions#rate', as: 'rate'
      end
    end
    resources "trip_answers", only: :create
  end

  patch "questions/:question_id/itineraries/:id", to: "itineraries#update_rating"

  resources "pois", only: :show
  # Defines the root path route ("/")
  # root "articles#index"
end
