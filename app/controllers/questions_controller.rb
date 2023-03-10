class QuestionsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @itinerary = Itinerary.find(params[:id])
    @questions = Question.all
    @itinerary.questions = @questions
  end
end
