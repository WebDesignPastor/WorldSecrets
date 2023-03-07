class TripsController < ApplicationController
  def show
    # @trip = Trip.find(params[:id])
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
    # params.require(:trip).permit(:proximity_level, :image, :content, :status, :progress)
  end
end
