class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @completed_itineraries = Itinerary.all
    @favorite_itineraries = Itinerary.all
  end
end
