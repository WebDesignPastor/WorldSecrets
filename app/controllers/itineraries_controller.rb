class ItinerariesController < ApplicationController
  def index
    if params[:query].present?
      # Recherche de la ville
      city = City.where(name: params[:query])

      # Recherche des itinéraires liés à la ville
      itineraries = Itinerary.where(city_id: city.ids[0].to_i)

      # Filtrage par catégorie (en ajoutant le filtre seulement si la catégorie est présente)
      itineraries = itineraries.merge(Itinerary.where(category: params[:category])) if params[:category].present?

      @itineraries = itineraries
    else
      @itineraries = Itinerary.all
    end

    if params[:query].present?
      city = City.where(name: params[:query])
      @short_itineraries = Itinerary.where(city_id: city.ids[0].to_i).where("duration < 90")
      @filtered_short_itineraries = Itinerary.where(category: params[:query])
    else
      @short_itineraries = Itinerary.where("duration < 90")
    end

    if params[:query].present?
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

  private

  def itinerary_params
    require.params(:itinerary).permit(:rates)
  end
end
