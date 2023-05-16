class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @completed_itineraries = Itinerary.all
    bookmarks = Bookmark.where(user_id: current_user.id, favorite: true)
    @favorite_itineraries = bookmarks.map(&:itinerary)
  end
end
