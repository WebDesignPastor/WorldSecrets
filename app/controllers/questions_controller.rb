class QuestionsController < ApplicationController
  def index
    @itinerary = Itinerary.find(params[:itinerary_id])
    @questions.itinerary = @itinerary
    @questions = Question.all
  end
end
