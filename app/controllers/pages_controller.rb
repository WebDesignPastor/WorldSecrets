class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    user_trips = Trip.where(user_id: current_user.id, completed: true)
    @completed_itineraries = user_trips.map(&:itinerary)
    bookmarks = Bookmark.where(user_id: current_user.id, favorite: true)
    @favorite_itineraries = bookmarks.map(&:itinerary)
  end

  def rating(itinerary)
    (itinerary.rates.sum / itinerary.rates.length).truncate(0)
  end

  helper_method :rating
end
