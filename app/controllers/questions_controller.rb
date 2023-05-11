class QuestionsController < ApplicationController
  def index
    # raise
    @trip = Trip.find(params[:trip_id])
    @questions = Question.where(itinerary_id: @trip.itinerary)
    @itinerary = @trip.itinerary
  end

  def update_rates
    @trip = Trip.find(params[:trip_id])
    @itinerary = Itinerary.find_by(trips: @trip)
    @itinerary.rates << params[:rating_value].to_i
    @itinerary.save
  end

  helper_method :update_rates
end
