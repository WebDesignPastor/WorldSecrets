class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
    @itinerary = @trip.itinerary
    @pois = @itinerary.pois
    @departure = @itinerary.departure
    @markers = @pois.geocoded.map do |poi|
      { lat: poi.latitude, lng: poi.longitude }
    end
    @departure_marker = [{ lat: @itinerary.latitude, lng: @itinerary.longitude }]
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @trip = Trip.new
    @trip.user = current_user
    @trip.itinerary = @itinerary
    if @trip.save!
      redirect_to trip_path(@trip)
    else
      render itinerary_path(@itinerary), status: :unprocessable_entity
    end
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trip_questions_path(@trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:image, :content, :departure, :completed)
  end
end
