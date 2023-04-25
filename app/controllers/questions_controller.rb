class QuestionsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @questions = Question.where(itinerary_id: @trip.itinerary)
    @trip.itinerary.questions = @questions
    @itinerary = @trip.itinerary
  end
end
