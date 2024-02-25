Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  get "privacy", to: "pages#privacy"
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
