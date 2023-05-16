class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @completed_itineraries = Itinerary.where(user: current_user, completed: true)
    @favorite_itineraries = Itinerary.where(user: current_user, favorite: true)
  end
end
