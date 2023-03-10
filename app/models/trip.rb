class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_answers, dependent: :destroy
  has_many :questions, through: :itineraries
  belongs_to :itinerary
  geocoded_by :departure
end
