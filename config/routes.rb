Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources "itineraries", only: %i[index show create update] do
    resources "bookmarks", only: %i[create destroy]
    resources "trips", only: :create
  end
  resources "trips", only: %i[show create update] do
    resources "questions", only: :index do
      resources "itineraries", only: %i[update]
    end
  end
end
