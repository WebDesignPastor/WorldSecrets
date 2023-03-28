class QuestionsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @questions = Question.where(itinerary_id: @trip.itinerary)
    @trip.itinerary.questions = @questions
  end

  # def add_rating
  #   @trip = Trip.find(params[:trip_id])
  #   @questions = Question.where(itinerary_id: @trip.itinerary)
  #   @trip.itinerary.questions = @questions
  #   rating = params[:rating]
  #   @questions.itinerary.rates << rating.to_i
  #   @questions.itinerary.save
  # end

  # def update_rating
  #   @questions = Question.all
  #   @itinerary = Itinerary.find(params[:itinerary_id])
  #   @itinerary_questions = Question.where(@questions.itinerary = @itinerary)
  #   @rating = @itinerary.rating
  #   @itinerary.update(@rating)
  #   redirect_to itinerary_path(@itinerary)
  # end

  private

  def itinerary_params
    params.require[:itinerary].permit(:name, :distance, :duration, :number_of_poi, :departure, :city_id,
                                      :category, :description, :subtitle, :rates)
  end
end
