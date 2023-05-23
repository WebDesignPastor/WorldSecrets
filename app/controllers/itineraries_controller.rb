class ItinerariesController < ApplicationController
  def index
    if params[:query].present?
      city = City.where("to_tsvector('english', name) @@ plainto_tsquery('english', ?)", params[:query].to_s)
      @itineraries = Itinerary.where(city_id: city.ids[0].to_i)
      @itineraries = @itineraries.merge(Itinerary.where(category: params[:category])) if params[:category].present?
    else
      @itineraries = Itinerary.all
    end
    @itineraries_markers = @itineraries.geocoded.map do |itinerary|
      { lat: itinerary.latitude,
        lng: itinerary.longitude,
        completed: itinerary.trips.where(user: current_user).any?(&:completed?),
        name: itinerary.name
      }
    end
  end

  def short(itineraries)
    itineraries.where("duration < 90")
  end

  def long(itineraries)
    itineraries.where("duration >= 90")
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @trip = Trip.new
    @bookmarks = Bookmark.where(user: current_user, itinerary: @itinerary)
    @markers = { lat: @itinerary.latitude, lng: @itinerary.longitude }
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    new_rate = params[:itinerary][:rates].to_i
    @itinerary.rates << new_rate
    flash[:notice] = "Merci pour votre note !" if @itinerary.save # TODO: flash message because it's not working
    redirect_to itineraries_path
  end

  def rating(itinerary)
    (itinerary.rates.sum / itinerary.rates.length).truncate(0)
  end

  helper_method :rating, :short, :long

  private

  def itinerary_params
    params.require(:itinerary).permit(:rates)
  end
end
