class ItinerariesController < ApplicationController
  def index

    if params[:query].present?
      @itineraries = Itinerary.where(category: params[:category])
      city = City.where(name: params[:query])
      @itineraries = Itinerary.where(city_id: city.ids[0].to_i)
    else
      @itineraries = Itinerary.all
    end

    if params[:query].present?
      @short_itineraries = Itinerary.where(category: params[:query])
      city = City.where(name: params[:query])
      @short_itineraries = Itinerary.where(city_id: city.ids[0].to_i).where("duration < 90")
    else
      @short_itineraries = Itinerary.where("duration < 90")
    end

    if params[:query].present?
      @long_itineraries = Itinerary.where(category: params[:query])
      city = City.where(name: params[:query])
      @long_itineraries = Itinerary.where(city_id: city.ids[0].to_i).where("duration >= 90")
    else
      @long_itineraries = Itinerary.where("duration >= 90")
    end

    @itineraries_markers = @itineraries.geocoded.map do |itinerary|
      {
        lat: itinerary.latitude,
        lng: itinerary.longitude
      }
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @trip = Trip.new

    @markers = {
      lat: @itinerary.latitude,
      lng: @itinerary.longitude
    }
  end
end
