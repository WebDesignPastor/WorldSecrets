class QuestionsController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @questions = Question.where(itinerary: @trip.itinerary)
  end

  def rate
    @trip = Trip.find(params[:trip_id])
    @questions = Question.where(itinerary_id: @trip.itinerary)
    @trip.itinerary.questions = @questions
    @rating_value = params[:rating_value].to_i
    @questions.itinerary.rates << @rating_value
  end

  private

  def itinerary_params
    params.require[:itinerary].permit(:name, :distance, :duration, :number_of_poi, :departure, :city_id,
                                      :category, :description, :subtitle, :rates)
  end
end
