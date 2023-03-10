class QuestionsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @questions = Question.all
    @trip.itinerary.questions = @questions
  end
end
