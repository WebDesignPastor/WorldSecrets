class QuestionsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @questions = Question.all
    @trip.itinerary.questions = @questions
  end

  # def update_rating
  #   @questions = Question.all
  #   @itinerary = Itinerary.find(params[:itinerary_id])
  #   @itinerary_questions = Question.where(@questions.itinerary = @itinerary)
  #   @rating = @itinerary.rating
  #   @itinerary.update(@rating)
  #   redirect_to itinerary_path(@itinerary)
  # end
end
