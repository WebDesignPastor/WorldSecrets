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

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update(itinerary_params)
  end

  # def rating
  #   itinerary = Itinerary.find(params[:id])
  #   (itinerary.rates.sum / itinerary.rates.count).truncate(0)
  # end

  def update_rates_one
    @itinerary = Itinerary.find(params[:id])
    @itinerary.rates << 1
    @itinerary.save
    # redirect_to question_path(params[:question_id])
  end

  def update_rates_two
    @itinerary = Itinerary.find(params[:id])
    @itinerary.rates << 2
    @itinerary.save
    # redirect_to question_path(params[:question_id])
  end

  def update_rates_three
    @itinerary = Itinerary.find(params[:id])
    @itinerary.rates << 3
    @itinerary.save
    # redirect_to question_path(params[:question_id])
  end

  def update_rates_four
    @itinerary = Itinerary.find(params[:id])
    @itinerary.rates << 4
    @itinerary.save
    # redirect_to question_path(params[:question_id])
  end

  def update_rates_five
    @itinerary = Itinerary.find(params[:id])
    @itinerary.rates << 5
    @itinerary.save
    # redirect_to question_path(params[:question_id])
  end

  private

  def itinerary_params
    require.params(:itinerary).permit(:rates)
  end
end
