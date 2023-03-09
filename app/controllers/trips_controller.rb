class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @itinerary = @trip.itinerary
    @pois = @itinerary.pois
    @departure = @itinerary.departure
    @markers = @pois.geocoded.map do |poi|
      {
        lat: poi.latitude,
        lng: poi.longitude
      }
    end
    @departure_marker = [
      {
        lat: @itinerary.latitude,
        lng: @itinerary.longitude
      }
    ]
  end

  def create
    # @itinerary = Itinerary.find(params[:itinerary_id])
    # @trip = Trip.new(trip_params)
    # @trip.user = current_user
    # @trip.itinerary = @itinerary
    # if @trip.save
    #   redirect_to trip_path(@trip)
    # else
    #   render itinerary_path(@itinerary), status: :unprocessable_entity
    # end
  end

  private

  def trip_params
    params.require(:trip).permit(:proximity_level, :image, :content, :status, :progress, :departure)
  end
end
