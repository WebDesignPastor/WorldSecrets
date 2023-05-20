class BookmarksController < ApplicationController
  before_action :set_itinerary

  def create
    @bookmark = Bookmark.new(user: current_user, itinerary: @itinerary, favorite: true)

    if @bookmark.save
      respond_to do |format|
        format.turbo_stream { redirect_to @itinerary, notice: 'Ajouté aux favoris :-)' }
        format.js
      end
    else
      render itinerary_path(@itinerary)
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(user: current_user, itinerary: @itinerary)
    @bookmark.destroy
    respond_to do |format|
      format.turbo_stream { redirect_to @itinerary, notice: 'Retiré des favoris :-(' }
      format.js
    end
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end
end
