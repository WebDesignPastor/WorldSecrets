class QuestionsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @questions = Question.where(itinerary_id: @trip.itinerary)
    @itinerary = @trip.itinerary
  end

  helper_method :update_rates
end
